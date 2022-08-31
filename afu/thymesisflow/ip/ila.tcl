create_ip -name vio -vendor xilinx.com -library ip -version 3.0 -module_name vio_8x16
set_property -dict [list CONFIG.C_PROBE_IN8_WIDTH {64} CONFIG.C_PROBE_IN7_WIDTH {16} CONFIG.C_PROBE_IN6_WIDTH {16} CONFIG.C_PROBE_IN5_WIDTH {16} CONFIG.C_PROBE_IN4_WIDTH {16} CONFIG.C_PROBE_IN3_WIDTH {16} CONFIG.C_PROBE_IN2_WIDTH {16} CONFIG.C_PROBE_IN1_WIDTH {16} CONFIG.C_PROBE_IN0_WIDTH {16} CONFIG.C_NUM_PROBE_OUT {0} CONFIG.C_NUM_PROBE_IN {9} CONFIG.Component_Name {vio_8x16}] [get_ips vio_8x16]
generate_target {all} [get_ips vio_8x16]

create_ip -name ila -vendor xilinx.com -library ip -version 6.2 -module_name ila_512
set_property -dict [list CONFIG.C_PROBE0_WIDTH {512} CONFIG.C_NUM_OF_PROBES {3} CONFIG.Component_Name {ila_512}] [get_ips ila_512]
generate_target {all} [get_ips ila_512]

create_ip -name ila -vendor xilinx.com -library ip -version 6.2 -module_name ila_256
set_property -dict [list CONFIG.C_PROBE0_WIDTH {256} CONFIG.C_NUM_OF_PROBES {3} CONFIG.Component_Name {ila_256}] [get_ips ila_256]
generate_target {all} [get_ips ila_256]

create_ip -name ila -vendor xilinx.com -library ip -version 6.2 -module_name ila_0
set_property -dict [list CONFIG.C_NUM_OF_PROBES {9} CONFIG.C_SLOT_0_AXI_DATA_WIDTH {256} CONFIG.C_SLOT_0_AXI_PROTOCOL {AXI4S} CONFIG.C_SLOT_0_AXIS_TDATA_WIDTH {256} CONFIG.C_ENABLE_ILA_AXI_MON {true} CONFIG.C_MONITOR_TYPE {AXI}] [get_ips ila_0]
generate_target {all} [get_ips ila_0]

create_ip -name ila -vendor xilinx.com -library ip -version 6.2 -module_name ila_40
set_property -dict [list CONFIG.C_PROBE0_WIDTH {40} CONFIG.C_NUM_OF_PROBES {3} CONFIG.Component_Name {ila_40}] [get_ips ila_40]
generate_target {all} [get_ips ila_40]
