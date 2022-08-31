
create_ip -name cmac_krnl_0 -vendor xilinx.com -library RTLKernel -version 1.0 -module_name cmac_krnl_0_0
 
generate_target {all} [get_ips cmac_krnl_0_0]

create_ip -name cmac_krnl_1 -vendor xilinx.com -library RTLKernel -version 1.0 -module_name cmac_krnl_1_0
 
generate_target {all} [get_ips cmac_krnl_1_0]


