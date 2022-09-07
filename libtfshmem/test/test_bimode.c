/*
 * Copyright 2021 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Author: Christian Pinto - christian.pinto@ibm.com
 */

#include <stdio.h>
#include <inttypes.h>
#include <string.h>
#include <errno.h>
#include <stdbool.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

/* POWER9 cacheline size
 * TODO: make this more robust*/
#define CACHELINE_SIZE 0x80
#define CACHELINE_MASK (CACHELINE_SIZE - 1)


#define FLUSH_LINE(addr) \
	asm volatile ( \
		"dcbf 0x0,%0\n" \
		: \
		: "b"(addr) \
		: "memory" \
	)


#define FLUSH_LINE_SYNC(addr) \
	asm volatile ( \
		"dcbf 0x0,%0\n" \
		"sync\n" \
		: \
		: "b"(addr) \
		: "memory" \
	)


static inline void flush_memory_block (void *addr, uint64_t size, int sync) {
	uint64_t start_addr = (uint64_t) addr;
	uint64_t end_addr = (start_addr + size);
	unsigned int count = 0;
	printf("\nstarting flusshing buffer @ address: %" PRIx64 " of size %" PRIu64, start_addr, size);

	if ((start_addr & CACHELINE_MASK) != 0) {
		if (sync)
			FLUSH_LINE_SYNC(start_addr);
		else {
//			printf("\n#%u flushing line @ address: %" PRIx64, count, start_addr);
			fflush(stdout);
			FLUSH_LINE(start_addr);
		}
		start_addr += CACHELINE_SIZE - (start_addr & CACHELINE_MASK);
	}

	for ( ; start_addr < end_addr; start_addr += CACHELINE_SIZE, count++){
		if (sync)
			FLUSH_LINE_SYNC(start_addr);
		else {
//			printf("\n#%u flushing line @ address: %" PRIx64, count, start_addr);
			fflush(stdout);
			FLUSH_LINE(start_addr);
		}
	}
}

static void * _buf_map_mmap (off_t offset, uint64_t size) {
	int fd;
	void *ret;
	if ((fd = open("/dev/tfshmem", O_RDWR|O_SYNC)) < 0 ) {
		printf("\nError opening /dev/mem.");
		close(fd);
		return NULL;
	}

	printf("Trying mapping buffer of size: %" PRIu64 " with offset ea %.16lx", size, offset);

	if ((ret = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, offset)) == (void *) -1) {
		printf("\n%s - mmap failed with error: %s\n", __func__, strerror(errno));
	}
	
	printf("buf ptr: %p", ret);
	close(fd);

	return ret;
}


int main() {

	uint64_t pool_size = 100ULL*1024*1024*1024;
	uint64_t pool_ea;
	uint64_t buf_size = 100ULL*1024*1024;
	uint64_t buf_ea;
	void *buf_ptr;
	int result;
	int i;
	unsigned long long int sum = 0;

	/*
	 * Here we map a first 100MB buffer allocated at the memory node side. Again the ea is not valid here
	 * and it is used only to compute the offset from the main pool start.
	 * */
	buf_ptr = _buf_map_mmap(0, buf_size);
	if (buf_ptr == NULL){
		printf ("Error mapping buffer");
		return -1;
	}
	
	printf("\n %" PRIu64 "bytes mapped in a buffer at ea %p", buf_size, buf_ptr);
	/*
	for (i=0; i < buf_size/(sizeof (unsigned int)); i++) {
		((unsigned int *)buf_ptr)[i] = i;
		sum += i;
	}
	printf("\nBuffer 1 sum is %llu", sum);
*/
	
	((unsigned int *)buf_ptr)[0] = 100;
	flush_memory_block(buf_ptr, buf_size, 0);
	/*
	sum = 0;	
	for (i=0; i < buf_size/(sizeof (unsigned int)); i++) {
		sum += ((unsigned int *)buf_ptr)[i];
	}
	printf("\nBuffer 1 sum is %llu", sum);
	*/

	printf("\n 00 is %d",((unsigned int *)buf_ptr)[0]);


}
