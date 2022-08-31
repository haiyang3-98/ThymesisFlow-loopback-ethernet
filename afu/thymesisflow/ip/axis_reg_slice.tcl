create_ip -name axis_register_slice -vendor xilinx.com -library ip -version 1.1 -module_name axis_register_slice_0
set_property -dict [list CONFIG.TDATA_NUM_BYTES {65}] [get_ips axis_register_slice_0]
generate_target {all} [get_ips axis_register_slice_0]

create_ip -name axis_register_slice -vendor xilinx.com -library ip -version 1.1 -module_name axis_register_slice_1_64
set_property -dict [list CONFIG.TDATA_NUM_BYTES {64}] [get_ips axis_register_slice_1_64]
generate_target {all} [get_ips axis_register_slice_1_64]

create_ip -name axis_register_slice -vendor xilinx.com -library ip -version 1.1 -module_name axis_register_slice_25
set_property -dict [list CONFIG.TDATA_NUM_BYTES {25}] [get_ips axis_register_slice_25]
generate_target {all} [get_ips axis_register_slice_25]

create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name fifo_generator_172
set_property -dict [list CONFIG.Component_Name {fifo_generator_172} CONFIG.Input_Data_Width {172} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {172} CONFIG.Output_Depth {512} CONFIG.Use_Embedded_Registers {true} CONFIG.Underflow_Flag {true} CONFIG.Overflow_Flag {true} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510}] [get_ips fifo_generator_172]

