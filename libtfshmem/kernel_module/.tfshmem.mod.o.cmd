cmd_/home/thymesisflow/ThymesisFlow-Ethernet/libtfshmem/kernel_module/tfshmem.mod.o := gcc -Wp,-MD,/home/thymesisflow/ThymesisFlow-Ethernet/libtfshmem/kernel_module/.tfshmem.mod.o.d  -nostdinc -isystem /usr/lib/gcc/powerpc64le-linux-gnu/7/include  -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -Iubuntu/include  -include ./include/linux/compiler_types.h -D__KERNEL__ -I ./arch/powerpc -DHAVE_AS_ATHIGH=1 -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Wno-format-security -std=gnu89 -mlittle-endian -m64 -msoft-float -pipe -mtraceback=no -mabi=elfv2 -mcmodel=medium -mno-pointers-to-nested-functions -mcpu=power8 -mtune=power9 -mno-altivec -mno-vsx -mno-spe -mspe=no -fno-dwarf2-cfi-asm -mno-string -Wa,-maltivec -Wa,-mpower4 -Wa,-many -mno-strict-align -mlittle-endian -mstack-protector-guard=tls -mstack-protector-guard-reg=r13 -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -O2 --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fstack-protector-strong -Wno-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-variable -fno-var-tracking-assignments -pg -mprofile-kernel -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -mstack-protector-guard-offset=4472 -D_TASK_CPU=300  -DMODULE -mno-save-toc-indirect -mcmodel=large  -DKBUILD_BASENAME='"tfshmem.mod"' -DKBUILD_MODNAME='"tfshmem"' -c -o /home/thymesisflow/ThymesisFlow-Ethernet/libtfshmem/kernel_module/tfshmem.mod.o /home/thymesisflow/ThymesisFlow-Ethernet/libtfshmem/kernel_module/tfshmem.mod.c

source_/home/thymesisflow/ThymesisFlow-Ethernet/libtfshmem/kernel_module/tfshmem.mod.o := /home/thymesisflow/ThymesisFlow-Ethernet/libtfshmem/kernel_module/tfshmem.mod.c

deps_/home/thymesisflow/ThymesisFlow-Ethernet/libtfshmem/kernel_module/tfshmem.mod.o := \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/retpoline.h) \
  include/linux/kconfig.h \
    $(wildcard include/config/cpu/big/endian.h) \
    $(wildcard include/config/booger.h) \
    $(wildcard include/config/foo.h) \
  include/linux/compiler_types.h \
    $(wildcard include/config/have/arch/compiler/h.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/cc/has/asm/inline.h) \
  include/linux/compiler_attributes.h \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  include/linux/build-salt.h \
    $(wildcard include/config/build/salt.h) \
  include/linux/elfnote.h \
  include/linux/elf.h \
  arch/powerpc/include/asm/elf.h \
    $(wildcard include/config/spu/base.h) \
    $(wildcard include/config/ppc64.h) \
  include/linux/sched.h \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/uclamp/task.h) \
    $(wildcard include/config/uclamp/buckets/count.h) \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/preempt/notifiers.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/psi.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/stackprotector.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/posix/cputimers.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/x86/cpu/resctrl.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/rseq.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/kasan.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/kcov.h) \
    $(wildcard include/config/uprobes.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/gcc/plugin/stackleak.h) \
    $(wildcard include/config/arch/task/struct/on/stack.h) \
    $(wildcard include/config/preemption.h) \
    $(wildcard include/config/debug/rseq.h) \
  include/uapi/linux/sched.h \
  include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  include/uapi/linux/types.h \
  arch/powerpc/include/asm/types.h \
  arch/powerpc/include/uapi/asm/types.h \
  include/asm-generic/int-ll64.h \
  include/uapi/asm-generic/int-ll64.h \
  arch/powerpc/include/uapi/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  include/uapi/asm-generic/bitsperlong.h \
  include/uapi/linux/posix_types.h \
  include/linux/stddef.h \
  include/uapi/linux/stddef.h \
  include/linux/compiler_types.h \
  arch/powerpc/include/uapi/asm/posix_types.h \
  include/uapi/asm-generic/posix_types.h \
  arch/powerpc/include/asm/current.h \
  arch/powerpc/include/asm/paca.h \
    $(wildcard include/config/ppc/book3e.h) \
    $(wildcard include/config/kvm/book3s/64/handler.h) \
    $(wildcard include/config/ppc/pseries.h) \
    $(wildcard include/config/ppc/book3s/64.h) \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/ppc/book3s.h) \
    $(wildcard include/config/ppc/mm/slices.h) \
    $(wildcard include/config/kvm/book3s/hv/possible.h) \
    $(wildcard include/config/ppc/transactional/mem.h) \
    $(wildcard include/config/ppc/powernv.h) \
    $(wildcard include/config/kvm/book3s/handler.h) \
    $(wildcard include/config/kvm/book3s/pr/possible.h) \
    $(wildcard include/config/mmiowb.h) \
  include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
  arch/powerpc/include/asm/barrier.h \
    $(wildcard include/config/ppc/e500mc.h) \
    $(wildcard include/config/ppc/fsl/book3e.h) \
    $(wildcard include/config/ppc/barrier/nospec.h) \
  arch/powerpc/include/asm/asm-const.h \
  include/asm-generic/barrier.h \
  include/linux/kasan-checks.h \
  /usr/lib/gcc/powerpc64le-linux-gnu/7/include/stdarg.h \
  include/uapi/linux/string.h \
  arch/powerpc/include/asm/string.h \
  arch/powerpc/include/asm/lppaca.h \
  include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  include/uapi/linux/kernel.h \
  include/uapi/linux/sysinfo.h \
  arch/powerpc/include/asm/cache.h \
    $(wildcard include/config/ppc/8xx.h) \
    $(wildcard include/config/403gcx.h) \
    $(wildcard include/config/ppc32.h) \
    $(wildcard include/config/ppc/47x.h) \
    $(wildcard include/config/ppc/book3s/32.h) \
  include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  include/linux/spinlock_types.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  arch/powerpc/include/asm/spinlock_types.h \
  include/linux/lockdep.h \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/prove/locking.h) \
  include/linux/rwlock_types.h \
  arch/powerpc/include/asm/mmu.h \
    $(wildcard include/config/40x.h) \
    $(wildcard include/config/44x.h) \
    $(wildcard include/config/e200.h) \
    $(wildcard include/config/e500.h) \
    $(wildcard include/config/ppc/book3e/64.h) \
    $(wildcard include/config/ppc/radix/mmu.h) \
    $(wildcard include/config/ppc/kuap.h) \
    $(wildcard include/config/jump/label/feature/checks.h) \
    $(wildcard include/config/jump/label/feature/check/debug.h) \
    $(wildcard include/config/jump/label.h) \
    $(wildcard include/config/ppc/mem/keys.h) \
    $(wildcard include/config/strict/kernel/rwx.h) \
    $(wildcard include/config/ppc/mmu/nohash.h) \
  include/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/bug/on/data/corruption.h) \
  arch/powerpc/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  arch/powerpc/include/asm/asm-compat.h \
  arch/powerpc/include/asm/ppc-opcode.h \
  include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  include/linux/limits.h \
  include/uapi/linux/limits.h \
  include/linux/linkage.h \
  include/linux/stringify.h \
  include/linux/export.h \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/have/arch/prel32/relocations.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  arch/powerpc/include/asm/linkage.h \
  include/linux/bitops.h \
  include/linux/bits.h \
  include/linux/const.h \
  include/uapi/linux/const.h \
  arch/powerpc/include/asm/bitops.h \
  arch/powerpc/include/asm/synch.h \
  arch/powerpc/include/asm/feature-fixups.h \
  arch/powerpc/include/asm/asm-405.h \
    $(wildcard include/config/ibm405/err77.h) \
  include/asm-generic/bitops/non-atomic.h \
  include/asm-generic/bitops/ffz.h \
  include/asm-generic/bitops/builtin-__ffs.h \
  include/asm-generic/bitops/builtin-ffs.h \
  include/asm-generic/bitops/builtin-__fls.h \
  include/asm-generic/bitops/const_hweight.h \
  include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  include/asm-generic/bitops/le.h \
  arch/powerpc/include/uapi/asm/byteorder.h \
  include/linux/byteorder/little_endian.h \
  include/uapi/linux/byteorder/little_endian.h \
  include/linux/swab.h \
  include/uapi/linux/swab.h \
  arch/powerpc/include/asm/swab.h \
  arch/powerpc/include/uapi/asm/swab.h \
  include/linux/byteorder/generic.h \
  include/asm-generic/bitops/ext2-atomic-setbit.h \
  include/asm-generic/bitops/sched.h \
  include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  include/linux/typecheck.h \
  include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/quiet.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/kmsg/ids.h) \
    $(wildcard include/config/dynamic/debug.h) \
  include/linux/init.h \
    $(wildcard include/config/strict/module/rwx.h) \
  include/linux/kern_levels.h \
  include/linux/dynamic_debug.h \
  include/linux/jump_label.h \
    $(wildcard include/config/have/arch/jump/label/relative.h) \
  arch/powerpc/include/asm/jump_label.h \
  include/linux/build_bug.h \
  arch/powerpc/include/generated/asm/div64.h \
  include/asm-generic/div64.h \
  arch/powerpc/include/asm/cputable.h \
    $(wildcard include/config/altivec.h) \
    $(wildcard include/config/vsx.h) \
    $(wildcard include/config/spe.h) \
    $(wildcard include/config/mpc10x/bridge.h) \
    $(wildcard include/config/ppc/83xx.h) \
    $(wildcard include/config/8260.h) \
    $(wildcard include/config/ppc/mpc52xx.h) \
    $(wildcard include/config/bdi/switch.h) \
    $(wildcard include/config/cpu/little/endian.h) \
    $(wildcard include/config/ppc/book3s/601.h) \
    $(wildcard include/config/ppc/dt/cpu/ftrs.h) \
  arch/powerpc/include/uapi/asm/cputable.h \
  arch/powerpc/include/asm/page.h \
    $(wildcard include/config/ppc/page/shift.h) \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/kernel/start.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/physical/start.h) \
    $(wildcard include/config/nonstatic/kernel.h) \
    $(wildcard include/config/relocatable.h) \
    $(wildcard include/config/booke.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/ppc/smlpar.h) \
  arch/powerpc/include/asm/page_64.h \
  include/asm-generic/getorder.h \
  arch/powerpc/include/asm/pgtable-be-types.h \
    $(wildcard include/config/ppc/64k/pages.h) \
  arch/powerpc/include/asm/cmpxchg.h \
  include/asm-generic/memory_model.h \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  include/linux/pfn.h \
  arch/powerpc/include/asm/slice.h \
    $(wildcard include/config/ppc/mmu/nohash/32.h) \
  arch/powerpc/include/asm/book3s/64/slice.h \
  arch/powerpc/include/asm/book3s/64/mmu.h \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/spapr/tce/iommu.h) \
    $(wildcard include/config/ppc/subpage/prot.h) \
  arch/powerpc/include/asm/book3s/64/mmu-hash.h \
    $(wildcard include/config/transparent/hugepage.h) \
  arch/powerpc/include/asm/book3s/64/pgtable.h \
    $(wildcard include/config/kgdb.h) \
    $(wildcard include/config/xmon.h) \
    $(wildcard include/config/kprobes.h) \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/have/arch/soft/dirty.h) \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/arch/enable/thp/migration.h) \
  include/asm-generic/5level-fixup.h \
  include/linux/mmdebug.h \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  arch/powerpc/include/asm/book3s/64/hash.h \
  arch/powerpc/include/asm/book3s/64/hash-64k.h \
  arch/powerpc/include/uapi/asm/errno.h \
  include/uapi/asm-generic/errno.h \
  include/uapi/asm-generic/errno-base.h \
  arch/powerpc/include/asm/book3s/64/radix.h \
  arch/powerpc/include/asm/book3s/64/radix-64k.h \
  arch/powerpc/include/asm/book3s/64/tlbflush-radix.h \
  arch/powerpc/include/asm/cpu_has_feature.h \
  arch/powerpc/include/asm/book3s/64/pgtable-64k.h \
  arch/powerpc/include/asm/task_size_64.h \
  arch/powerpc/include/asm/firmware.h \
    $(wildcard include/config/ppc/ps3.h) \
    $(wildcard include/config/ppc/native.h) \
  arch/powerpc/include/asm/exception-64s.h \
  arch/powerpc/include/asm/kvm_book3s_asm.h \
  arch/powerpc/include/asm/accounting.h \
  arch/powerpc/include/asm/hmi.h \
  arch/powerpc/include/asm/cpuidle.h \
  arch/powerpc/include/asm/atomic.h \
  include/asm-generic/mmiowb_types.h \
  include/linux/pid.h \
  include/linux/rculist.h \
    $(wildcard include/config/prove/rcu/list.h) \
  include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  include/linux/rcupdate.h \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  include/linux/atomic.h \
  include/linux/atomic-fallback.h \
    $(wildcard include/config/generic/atomic64.h) \
  include/asm-generic/atomic-long.h \
  include/linux/irqflags.h \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  arch/powerpc/include/asm/irqflags.h \
  arch/powerpc/include/asm/hw_irq.h \
    $(wildcard include/config/ppc/irq/soft/mask/debug.h) \
  include/linux/errno.h \
  include/uapi/linux/errno.h \
  arch/powerpc/include/asm/ptrace.h \
    $(wildcard include/config/book3s/601.h) \
  arch/powerpc/include/uapi/asm/ptrace.h \
  include/linux/thread_info.h \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  include/linux/restart_block.h \
  include/linux/time64.h \
  include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  include/uapi/linux/time.h \
  include/uapi/linux/time_types.h \
  arch/powerpc/include/asm/thread_info.h \
    $(wildcard include/config/thread/shift.h) \
  arch/powerpc/include/asm/processor.h \
    $(wildcard include/config/ppc/adv/debug/regs.h) \
    $(wildcard include/config/ppc/adv/debug/iacs.h) \
    $(wildcard include/config/ppc/adv/debug/dvcs.h) \
    $(wildcard include/config/ppc/rtas.h) \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/kvm/book3s/32/handler.h) \
    $(wildcard include/config/kvm.h) \
  arch/powerpc/include/asm/reg.h \
    $(wildcard include/config/fsl/emb/perfmon.h) \
    $(wildcard include/config/ppc/cell.h) \
  arch/powerpc/include/asm/hw_breakpoint.h \
    $(wildcard include/config/ppc/dawr.h) \
  include/linux/kdebug.h \
  arch/powerpc/include/asm/kdebug.h \
  arch/powerpc/include/asm/debug.h \
    $(wildcard include/config/debugger.h) \
    $(wildcard include/config/kexec/core.h) \
  include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/trace/preempt/toggle.h) \
  arch/powerpc/include/generated/asm/preempt.h \
  include/asm-generic/preempt.h \
  include/linux/bottom_half.h \
  include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  include/linux/bitmap.h \
  include/linux/rcutree.h \
  include/linux/wait.h \
  include/linux/spinlock.h \
  arch/powerpc/include/asm/mmiowb.h \
  include/asm-generic/mmiowb.h \
  arch/powerpc/include/asm/spinlock.h \
    $(wildcard include/config/ppc/splpar.h) \
  arch/powerpc/include/asm/hvcall.h \
  include/linux/rwlock.h \
    $(wildcard include/config/preempt.h) \
  include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
    $(wildcard include/config/generic/lockbreak.h) \
  include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  include/uapi/linux/wait.h \
  include/linux/refcount.h \
    $(wildcard include/config/refcount/full.h) \
  include/linux/sem.h \
  include/uapi/linux/sem.h \
  include/linux/ipc.h \
  include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  include/linux/highuid.h \
  include/linux/rhashtable-types.h \
  include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  include/linux/osq_lock.h \
  include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/wq/watchdog.h) \
  include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/preempt/rt.h) \
    $(wildcard include/config/no/hz/common.h) \
  include/linux/ktime.h \
  include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  include/linux/seqlock.h \
  include/linux/time32.h \
  include/linux/timex.h \
  include/uapi/linux/timex.h \
  include/uapi/linux/param.h \
  arch/powerpc/include/generated/uapi/asm/param.h \
  include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  include/uapi/asm-generic/param.h \
  arch/powerpc/include/asm/timex.h \
  include/linux/jiffies.h \
  include/generated/timeconst.h \
  include/linux/timekeeping.h \
  include/linux/timekeeping32.h \
  include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  include/uapi/linux/ipc.h \
  arch/powerpc/include/uapi/asm/ipcbuf.h \
  arch/powerpc/include/uapi/asm/sembuf.h \
  include/linux/shm.h \
  include/uapi/linux/shm.h \
  include/uapi/asm-generic/hugetlb_encode.h \
  arch/powerpc/include/uapi/asm/shmbuf.h \
  arch/powerpc/include/asm/shmparam.h \
  include/linux/kcov.h \
  include/uapi/linux/kcov.h \
  include/linux/plist.h \
    $(wildcard include/config/debug/plist.h) \
  include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  include/linux/hrtimer_defs.h \
  include/linux/rbtree.h \
  include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  arch/powerpc/include/asm/smp.h \
    $(wildcard include/config/ppc/smp/muxed/ipi.h) \
    $(wildcard include/config/nmi/ipi.h) \
  include/linux/irqreturn.h \
  arch/powerpc/include/asm/percpu.h \
  include/asm-generic/percpu.h \
  include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  include/linux/timerqueue.h \
  include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  include/uapi/linux/seccomp.h \
  arch/powerpc/include/asm/seccomp.h \
  include/uapi/linux/unistd.h \
  arch/powerpc/include/asm/unistd.h \
  arch/powerpc/include/uapi/asm/unistd.h \
  arch/powerpc/include/generated/uapi/asm/unistd_64.h \
  include/asm-generic/seccomp.h \
  include/linux/nodemask.h \
    $(wildcard include/config/highmem.h) \
  include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  include/linux/resource.h \
  include/uapi/linux/resource.h \
  arch/powerpc/include/generated/uapi/asm/resource.h \
  include/asm-generic/resource.h \
  include/uapi/asm-generic/resource.h \
  include/linux/latencytop.h \
  include/linux/sched/prio.h \
  include/linux/sched/types.h \
  include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  include/uapi/linux/signal.h \
  arch/powerpc/include/asm/signal.h \
  arch/powerpc/include/uapi/asm/signal.h \
  include/uapi/asm-generic/signal-defs.h \
  arch/powerpc/include/generated/uapi/asm/siginfo.h \
  include/uapi/asm-generic/siginfo.h \
  include/linux/mm_types_task.h \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  include/linux/posix-timers.h \
    $(wildcard include/config/posix/timers.h) \
  include/linux/alarmtimer.h \
  include/uapi/linux/rseq.h \
  arch/powerpc/include/uapi/asm/elf.h \
  arch/powerpc/include/uapi/asm/auxvec.h \
  include/uapi/linux/elf.h \
  include/uapi/linux/elf-em.h \
  include/linux/module.h \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/bpf/events.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/function/error/injection.h) \
  include/linux/stat.h \
  arch/powerpc/include/uapi/asm/stat.h \
  include/uapi/linux/stat.h \
  include/linux/kmod.h \
  include/linux/umh.h \
  include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/contig/alloc.h) \
    $(wildcard include/config/cma.h) \
  include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/shuffle/page/allocator.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  include/linux/page-flags-layout.h \
    $(wildcard include/config/kasan/sw/tags.h) \
  include/generated/bounds.h \
  arch/powerpc/include/asm/sparsemem.h \
  include/linux/mm_types.h \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
  include/linux/auxvec.h \
  include/uapi/linux/auxvec.h \
  include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/debug/rwsems.h) \
  include/linux/err.h \
  include/linux/completion.h \
  include/linux/uprobes.h \
  arch/powerpc/include/asm/uprobes.h \
  include/linux/notifier.h \
  include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
    $(wildcard include/config/srcu.h) \
  include/linux/rcu_segcblist.h \
  include/linux/srcutree.h \
  include/linux/rcu_node_tree.h \
    $(wildcard include/config/rcu/fanout.h) \
    $(wildcard include/config/rcu/fanout/leaf.h) \
  arch/powerpc/include/asm/probes.h \
  include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/idle/page/tracking.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  arch/powerpc/include/asm/mmzone.h \
    $(wildcard include/config/fa/dump.h) \
  include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  include/linux/arch_topology.h \
    $(wildcard include/config/generic/arch/topology.h) \
  arch/powerpc/include/asm/topology.h \
    $(wildcard include/config/pci.h) \
  include/asm-generic/topology.h \
  include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  include/uapi/linux/sysctl.h \
  include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  include/linux/sysfs.h \
  include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  include/linux/idr.h \
  include/linux/radix-tree.h \
  include/linux/xarray.h \
    $(wildcard include/config/xarray/multi.h) \
  include/linux/kconfig.h \
  include/linux/kobject_ns.h \
  include/linux/kref.h \
  include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
  include/linux/rbtree_latch.h \
  include/linux/error-injection.h \
  include/asm-generic/error-injection.h \
  include/linux/tracepoint-defs.h \
  include/linux/static_key.h \
  arch/powerpc/include/asm/module.h \
    $(wildcard include/config/mprofile/kernel.h) \
    $(wildcard include/config/dynamic/ftrace/with/regs.h) \
  include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  include/linux/vermagic.h \
  include/generated/utsrelease.h \

/home/thymesisflow/ThymesisFlow-Ethernet/libtfshmem/kernel_module/tfshmem.mod.o: $(deps_/home/thymesisflow/ThymesisFlow-Ethernet/libtfshmem/kernel_module/tfshmem.mod.o)

$(deps_/home/thymesisflow/ThymesisFlow-Ethernet/libtfshmem/kernel_module/tfshmem.mod.o):
