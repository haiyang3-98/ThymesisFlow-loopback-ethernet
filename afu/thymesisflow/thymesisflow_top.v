// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
// Module designer: Dimitris Syrivelis
// Backup: Christian Pinto, Michele Gazzetti

<<<<<<< Updated upstream
`define ETH
`define DEBUG
=======
//`define ETH
`define DIRECT
//`define DEBUG
//`define INTF_INPUT

>>>>>>> Stashed changes

`timescale 1ns / 10ps
// ******************************************************************************************************************************
// File Name          :  thymesisflow_top.v
// Project            :  ThymesisFlow-P top file for OpenCAPI disaggregated memory bridge
//                       top file stitching the various modules
// Module Description : This file acts as the top file of the thymesisflow AFU remote memory extension.
// ******************************************************************************************************************************

// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module thymesisflow_top  (

        input              clock
      , input              reset_n
      //OpenCAPI TLX command flit AXI-S channel
      , input  [162:0]     ocx_tlx_cmd_flit_in_tdata
      , input              ocx_tlx_cmd_flit_in_tvalid
      , output             ocx_tlx_cmd_flit_in_tready
      //OpenCAPI TLX cmddata flit AXI-S channel
      , input  [512:0]     ocx_tlx_cmddata_flit_in_tdata
      , input              ocx_tlx_cmddata_flit_in_tvalid
      , output             ocx_tlx_cmddata_flit_in_tready
      //OpenCAPI TLx Response (cmd/data combined channel) to issued commands
      , output [551:0]     ocx_tlx_resp_tdata
      , output             ocx_tlx_resp_tvalid
      , input              ocx_tlx_resp_tready
      //OpenCAPI TL Response cmd flit
      , input  [39:0]      ocx_tl_resp_tdata
      , input              ocx_tl_resp_tvalid
      , output             ocx_tl_resp_tready
      //OpenCAPI TL Response data AXI-S channel
      , input  [519:0]     ocx_tl_resp_data_tdata
      , input              ocx_tl_resp_data_tvalid
      , output             ocx_tl_resp_data_tready
      //OpenCAPI mem TLx cmd
      , output [199:0]     ocx_tlx_cmd_tdata
      , output             ocx_tlx_cmd_tvalid
      , input              ocx_tlx_cmd_tready
      //OpenCAPI mem TLx data
      , output [519:0]     ocx_tlx_data_tdata
      , output             ocx_tlx_data_tvalid
      , input              ocx_tlx_data_tready
      //Throttles the push of responses when a backlog threshold is violated
      , output [31:0]      tl_resp_fifo_axis_data_count
      //FPGA GTY and reference clock pins coming from the design top file
      , input              serdes_init_clock
      , input              serdes_start0
      , input              serdes_start1
      //mem mode enable by sending ACTAG
      , input              mem_mode_enable
      // Active ACTAG
      , input  [11:0]      active_actag
      //mem mode rty timeout in case of rty cmd responses
      , input  [35:0]      rty_timeout

      // QSFP0 external FPGA pins
      , input              qsfp0_ref_clk_n 
      , input              qsfp0_ref_clk_p 
      , input  [0:3]       qsfp0_rx_n
      , input  [0:3]       qsfp0_rx_p
      , output [0:3]       qsfp0_tx_n
      , output [0:3]       qsfp0_tx_p  
     // QSFP1 external FPGA pins
      , input              qsfp1_ref_clk_n 
      , input              qsfp1_ref_clk_p 
      , input  [0:3]       qsfp1_rx_n
      , input  [0:3]       qsfp1_rx_p
      , output [0:3]       qsfp1_tx_n
      , output [0:3]       qsfp1_tx_p     

);

//for timing relax
wire [199:0]     ocx_tlx_cmd_tdata_reg;
wire             ocx_tlx_cmd_tvalid_reg;
wire             ocx_tlx_cmd_tready_reg;

axis_register_slice_25 ocx_tlx_cmd_tdata_reg (
  .aclk(clock),                    // input wire aclk
  .aresetn(reset_n),              // input wire aresetn
  .m_axis_tvalid(ocx_tlx_cmd_tvalid),  // input wire s_axis_tvalid
  .m_axis_tready(ocx_tlx_cmd_tready),  // output wire s_axis_tready
  .m_axis_tdata(ocx_tlx_cmd_tdata),    // input wire [199 : 0] s_axis_tdata
  .s_axis_tvalid(ocx_tlx_cmd_tvalid_reg),  // output wire m_axis_tvalid
  .s_axis_tready(ocx_tlx_cmd_tready_reg),  // input wire m_axis_tready
  .s_axis_tdata(ocx_tlx_cmd_tdata_reg)    // output wire [199 : 0] m_axis_tdata
);



reg [31:0] timestamp;
always @ (posedge clock) begin
  if(!reset_n) begin
    timestamp = 0;
  end
  else begin
    timestamp = timestamp + 1;

  end

end

`ifdef DEBUG

ila_512 ila_TF_COMPUTE_ROUTING_EGR(
.clk(clock),


.probe0(ocx_compute_netflit_out_tdata),
.probe1(ocx_compute_netflit_out_tvalid),
.probe2(ocx_compute_netflit_out_tready)
);

ila_256 ila_ocx_tlx_cmd_flit_in(
.clk(clock),
.probe0(ocx_tlx_cmd_flit_in_tdata),
.probe1(ocx_tlx_cmd_flit_in_tvalid),
.probe2(ocx_tlx_cmd_flit_in_tready)
);

ila_512 ila_ocx_tlx_cmddata_flit_in(
.clk(clock),
.probe0(ocx_tlx_cmddata_flit_in_tdata),
.probe1(ocx_tlx_cmddata_flit_in_tvalid),
.probe2(ocx_tlx_cmddata_flit_in_tready)
);

ila_512 ila_ocx_tlx_resp(
.clk(clock),
.probe0(ocx_tlx_resp_tdata[511:0]),
.probe1(ocx_tlx_resp_tvalid),
.probe2(ocx_tlx_resp_tresp)
);

`endif


wire           qsfp0_usr_clk;
wire           qsfp1_usr_clk;
wire           power_on_qsfp0_rout;
wire           power_on_qsfp1_rout;

//Compute glue logic internal wires
wire  [519:0]  ocx_compute_egress_in_tdata;
wire           ocx_compute_egress_in_tvalid;
wire           ocx_compute_egress_in_tready;
wire  [511:0]  ocx_compute_netflit_out_tdata;
wire           ocx_compute_netflit_out_tvalid;
wire           ocx_compute_netflit_out_tready;
wire  [255:0]  clkcross0_egress_fifo_out_tdata;
wire           clkcross0_egress_fifo_out_tvalid;
wire           clkcross0_egress_fifo_out_tready;
wire  [255:0]  clkcross1_egress_fifo_out_tdata;
wire           clkcross1_egress_fifo_out_tvalid;
wire           clkcross1_egress_fifo_out_tready;
wire  [511:0]  ocx_compute_netflit_in_tdata;
wire           ocx_compute_netflit_in_tvalid;
wire           ocx_compute_netflit_in_tready;
 

//Memory glue logic internal wires
wire  [511:0]  memory_netflit_out_tdata;
wire           memory_netflit_out_tvalid;
wire           memory_netflit_out_tready;
wire  [511:0]  memory_netflit_in_tdata;
wire           memory_netflit_in_tvalid;
wire           memory_netflit_in_tready;
wire [511:0]   mem_ingr_buf_tdata;
wire           mem_ingr_buf_tvalid;
wire           mem_ingr_buf_tready;

 
//Cmd lookup BRAM interface wires
wire [31:0]    memory_egress_cmdlookup_in_portA_addr;
wire           memory_egress_cmdlookup_in_portA_clk;
wire [255:0]   memory_egress_cmdlookup_in_portA_din;
wire [255:0]   memory_egress_cmdlookup_in_portA_dout;
wire           memory_egress_cmdlookup_in_portA_en;
wire           memory_egress_cmdlookup_in_portA_rst;
wire [31:0]    memory_egress_cmdlookup_in_portA_we;

wire [31:0]    memory_ingress_cmdlookup_out_portA_addr;
wire           memory_ingress_cmdlookup_out_portA_clk;
wire [255:0]   memory_ingress_cmdlookup_out_portA_din;
wire [255:0]   memory_ingress_cmdlookup_out_portA_dout;
wire           memory_ingress_cmdlookup_out_portA_en;
wire           memory_ingress_cmdlookup_out_portA_rst;
wire [31:0]    memory_ingress_cmdlookup_out_portA_we;

//Data lookup BRAM0 interface wires
wire [31:0]    memory_egress_datalookup0_in_portA_addr;
wire           memory_egress_datalookup0_in_portA_clk;
wire [511:0]   memory_egress_datalookup0_in_portA_din;
wire [511:0]   memory_egress_datalookup0_in_portA_dout;
wire           memory_egress_datalookup0_in_portA_en;
wire           memory_egress_datalookup0_in_portA_rst;
wire [63:0]    memory_egress_datalookup0_in_portA_we;

wire [31:0]    memory_ingress_datalookup0_out_portA_addr;
wire           memory_ingress_datalookup0_out_portA_clk;
wire [511:0]   memory_ingress_datalookup0_out_portA_din;
wire [511:0]   memory_ingress_datalookup0_out_portA_dout;
wire           memory_ingress_datalookup0_out_portA_en;
wire           memory_ingress_datalookup0_out_portA_rst;
wire [63:0]    memory_ingress_datalookup0_out_portA_we;

//Data lookup BRAM1 interface wires
wire [31:0]    memory_egress_datalookup1_in_portA_addr;
wire           memory_egress_datalookup1_in_portA_clk;
wire [511:0]   memory_egress_datalookup1_in_portA_din;
wire [511:0]   memory_egress_datalookup1_in_portA_dout;
wire           memory_egress_datalookup1_in_portA_en;
wire           memory_egress_datalookup1_in_portA_rst;
wire [63:0]    memory_egress_datalookup1_in_portA_we;

wire [31:0]    memory_ingress_datalookup1_out_portA_addr;
wire           memory_ingress_datalookup1_out_portA_clk;
wire [511:0]   memory_ingress_datalookup1_out_portA_din;
wire [511:0]   memory_ingress_datalookup1_out_portA_dout;
wire           memory_ingress_datalookup1_out_portA_en;
wire           memory_ingress_datalookup1_out_portA_rst;
wire [63:0]    memory_ingress_datalookup1_out_portA_we;

//capptag recycle fifo interface  wires 
wire [15:0]    capptag_fifo_m_axis_tdata;
wire           capptag_fifo_m_axis_tready;
wire           capptag_fifo_m_axis_tvalid;
wire [15:0]    memory_egress_capptag_fifo_out_tdata;
wire           memory_egress_capptag_fifo_out_tready;
wire           memory_egress_capptag_fifo_out_tvalid;

//afu_tlx_data fifo interface wires
wire [511:0]  afu_tlx_data_fifo_m_axis_tdata;
wire          afu_tlx_data_fifo_m_axis_tready;
wire          afu_tlx_data_fifo_m_axis_tvalid;
wire [511:0]  memory_egress_rty_fifo_out_tdata;
wire          memory_egress_rty_fifo_out_tready;
wire          memory_egress_rty_fifo_out_tvalid;

//tl_data fifo interface wires
wire [519:0]  tl_resp_data_fifo_m_axis_tdata;
wire          tl_resp_data_fifo_m_axis_tready;
wire          tl_resp_data_fifo_m_axis_tvalid;

//tl_resp fifo interface wires to facilitate lookup
wire [255:0]  tl_resp_fifo_m_axis_tdata;
wire          tl_resp_fifo_m_axis_tready;
wire          tl_resp_fifo_m_axis_tvalid;
wire [255:0]  memory_egress_tl_fifo_resp_out_tdata;
wire          memory_egress_tl_fifo_resp_out_tready;
wire          memory_egress_tl_fifo_resp_out_tvalid;
 

wire [47:0] comp_mac   = 48'h02_00_00_00_00_00;
wire [47:0] mem_mac   = 48'h02_00_00_00_00_01;
wire [47:0] ethertype   = 32'hFF_FF_FF_FF;

wire [47:0] qsfp0_rx_src_mac   ;
wire [47:0] qsfp0_rx_dest_mac  ;
wire [47:0] qsfp1_rx_src_mac ;
wire [47:0] qsfp1_rx_dest_mac  ;


wire qsfp0_mac_match = (qsfp0_rx_src_mac == mem_mac) && (qsfp0_rx_dest_mac == comp_mac);
wire qsfp1_mac_match = (qsfp1_rx_src_mac == comp_mac) && (qsfp1_rx_dest_mac == mem_mac);

           
`ifndef TFMEMORY

dataflit_fifo TF_TLX_AFU_DATAFIFO
       (
         .m_axis_tdata              (ocx_compute_egress_in_tdata)
        ,.m_axis_tready             (ocx_compute_egress_in_tready)
        ,.m_axis_tvalid             (ocx_compute_egress_in_tvalid)
        ,.s_axis_aclk               (clock)
        ,.s_axis_aresetn            (reset_n)
        ,.s_axis_tdata              ({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ocx_tlx_cmddata_flit_in_tdata})
        ,.s_axis_tready             (ocx_tlx_cmddata_flit_in_tready)
        ,.s_axis_tvalid             (ocx_tlx_cmddata_flit_in_tvalid)
       );


thymesisflow_64B_compute_egress_adapter TF_COMPUTE_EGRESS_ADAPTER (

          .clock                  (clock)
         ,.reset_n                (reset_n)

         ,.adapter_in_cmd_tdata   ({1'b0,1'b0,1'b0,1'b0,1'b0,ocx_tlx_cmd_flit_in_tdata})  // AXI-S prot 8 byte aligned boundary
         ,.adapter_in_cmd_tvalid  (ocx_tlx_cmd_flit_in_tvalid)
         ,.adapter_in_cmd_tready  (ocx_tlx_cmd_flit_in_tready)

         ,.adapter_in_data_tdata  (ocx_compute_egress_in_tdata)
         ,.adapter_in_data_tvalid (ocx_compute_egress_in_tvalid)
         ,.adapter_in_data_tready (ocx_compute_egress_in_tready)

         ,.adapter_out_tdata      (ocx_compute_netflit_out_tdata)
         ,.adapter_out_tvalid     (ocx_compute_netflit_out_tvalid)
         ,.adapter_out_tready     (ocx_compute_netflit_out_tready)

       );
 
`endif  
//End of !TFMEMORY

// modules that implement the memory side below.
`ifndef TFCOMPUTE

wire [519:0]     ocx_tlx_data_tdata_reg;
wire             ocx_tlx_data_tvalid_reg;
wire             ocx_tlx_data_tready_reg;
<<<<<<< Updated upstream
=======
//for timing relax
wire [199:0]     ocx_tlx_cmd_tdata_reg;
wire             ocx_tlx_cmd_tvalid_reg;
wire             ocx_tlx_cmd_tready_reg;

axis_register_slice_25 ocx_tlx_cmd_tdata_regslice (
  .aclk(clock),                    // input wire aclk
  .aresetn(reset_n),              // input wire aresetn
  .m_axis_tvalid(ocx_tlx_cmd_tvalid),  // input wire s_axis_tvalid
  .m_axis_tready(ocx_tlx_cmd_tready),  // output wire s_axis_tready
  .m_axis_tdata(ocx_tlx_cmd_tdata),    // input wire [199 : 0] s_axis_tdata
  .s_axis_tvalid(ocx_tlx_cmd_tvalid_reg),  // output wire m_axis_tvalid
  .s_axis_tready(ocx_tlx_cmd_tready_reg),  // input wire m_axis_tready
  .s_axis_tdata(ocx_tlx_cmd_tdata_reg)    // output wire [199 : 0] m_axis_tdata
);
>>>>>>> Stashed changes

axis_register_slice_0 ocx_tlx_data_reg (
  .aclk(clock),                    // input wire aclk
  .aresetn(reset_n),              // input wire aresetn
  .m_axis_tvalid(ocx_tlx_data_tvalid),  // input wire s_axis_tvalid
  .m_axis_tready(ocx_tlx_data_tready),  // output wire s_axis_tready
  .m_axis_tdata(ocx_tlx_data_tdata),    // input wire [519 : 0] s_axis_tdata
  .s_axis_tvalid(ocx_tlx_data_tvalid_reg),  // output wire m_axis_tvalid
  .s_axis_tready(ocx_tlx_data_tready_reg),  // input wire m_axis_tready
  .s_axis_tdata(ocx_tlx_data_tdata_reg)    // output wire [519 : 0] m_axis_tdata
);

`ifdef DEBUG

ila_512 ila_ocx_tlx_data(
.clk(clock),
.probe0(ocx_tlx_data_tdata_reg),
.probe1(ocx_tlx_data_tvalid_reg),
.probe2(ocx_tlx_data_tready_reg)
);

ila_256 ila_ocx_tlx_cmd(
.clk(clock),
.probe0(ocx_tlx_cmd_tdata),
.probe1(ocx_tlx_cmd_tvalid),
.probe2(ocx_tlx_cmd_tready)
);


`endif


 thymesisflow_memory_ingress  TF_MEMORY_INGRESS (


            .clock                        (clock)
           ,.reset_n                      (reset_n)
           ,.active_actag                 (active_actag)


           ,.capptag_fifo_tdata           (capptag_fifo_m_axis_tdata)
           ,.capptag_fifo_tready          (capptag_fifo_m_axis_tready)
           ,.capptag_fifo_tvalid          (capptag_fifo_m_axis_tvalid)

           ,.cmdlookup_port_addr          (memory_ingress_cmdlookup_out_portA_addr)
           ,.cmdlookup_port_din           (memory_ingress_cmdlookup_out_portA_din)
           ,.cmdlookup_port_dout          (memory_ingress_cmdlookup_out_portA_dout)
           ,.cmdlookup_port_en            (memory_ingress_cmdlookup_out_portA_en)
           ,.cmdlookup_port_rst           (memory_ingress_cmdlookup_out_portA_rst)
           ,.cmdlookup_in_port_we         (memory_ingress_cmdlookup_out_portA_we)

           ,.d0lookup_port_addr           (memory_ingress_datalookup0_out_portA_addr)
           ,.d0lookup_port_din            (memory_ingress_datalookup0_out_portA_din)
           ,.d0lookup_port_dout           (memory_ingress_datalookup0_out_portA_dout)
           ,.d0lookup_port_en             (memory_ingress_datalookup0_out_portA_en)
           ,.d0lookup_port_rst            (memory_ingress_datalookup0_out_portA_rst)
           ,.d0lookup_in_port_we          (memory_ingress_datalookup0_out_portA_we)

           ,.d1lookup_port_addr           (memory_ingress_datalookup1_out_portA_addr)
           ,.d1lookup_port_din            (memory_ingress_datalookup1_out_portA_din)
           ,.d1lookup_port_dout           (memory_ingress_datalookup1_out_portA_dout)
           ,.d1lookup_port_en             (memory_ingress_datalookup1_out_portA_en)
           ,.d1lookup_port_rst            (memory_ingress_datalookup1_out_portA_rst)
           ,.d1lookup_in_port_we          (memory_ingress_datalookup1_out_portA_we)

           ,.netflit_in_tdata             (memory_netflit_in_tdata)
           ,.netflit_in_tvalid            (memory_netflit_in_tvalid)
           ,.netflit_in_tready            (memory_netflit_in_tready)

           ,.rty_in_tdata                 (afu_tlx_data_fifo_m_axis_tdata)
           ,.rty_in_tvalid                (afu_tlx_data_fifo_m_axis_tvalid)
           ,.rty_in_tready                (afu_tlx_data_fifo_m_axis_tready)

           ,.enable                       (mem_mode_enable)

           ,.tlx_cmd_tdata                (ocx_tlx_cmd_tdata_reg)
           ,.tlx_cmd_tvalid               (ocx_tlx_cmd_tvalid_reg)
           ,.tlx_cmd_tready               (ocx_tlx_cmd_tready_reg)

           ,.tlx_data_tdata               (ocx_tlx_data_tdata_reg)
           ,.tlx_data_tvalid              (ocx_tlx_data_tvalid_reg)
           ,.tlx_data_tready              (ocx_tlx_data_tready_reg)
   );


ocx_memory_egress_lookup  TF_MEMORY_EGRESS_LOOKUP
       (
         .ap_clk                        (clock)
        ,.ap_rst_n                      (reset_n)

        ,.cmdlookup_in_V_Addr_A         (memory_egress_cmdlookup_in_portA_addr)
        ,.cmdlookup_in_V_Clk_A          (memory_egress_cmdlookup_in_portA_clk)
        ,.cmdlookup_in_V_Din_A          (memory_egress_cmdlookup_in_portA_din)
        ,.cmdlookup_in_V_Dout_A         (memory_egress_cmdlookup_in_portA_dout)
        ,.cmdlookup_in_V_EN_A           (memory_egress_cmdlookup_in_portA_en)
        ,.cmdlookup_in_V_Rst_A          (memory_egress_cmdlookup_in_portA_rst)
        ,.cmdlookup_in_V_WEN_A          (memory_egress_cmdlookup_in_portA_we)

        ,.tl_fifo_resp_out_V_V_TDATA    (memory_egress_tl_fifo_resp_out_tdata)
        ,.tl_fifo_resp_out_V_V_TREADY   (memory_egress_tl_fifo_resp_out_tready)
        ,.tl_fifo_resp_out_V_V_TVALID   (memory_egress_tl_fifo_resp_out_tvalid)

        ,.tl_resp_V_V_TDATA             (ocx_tl_resp_tdata)
        ,.tl_resp_V_V_TREADY            (ocx_tl_resp_tready)
        ,.tl_resp_V_V_TVALID            (ocx_tl_resp_tvalid)
       
       );

`ifdef DEBUG

ila_256 ila_tl_fifo_resp_out(
.clk(clock),
.probe0(memory_egress_tl_fifo_resp_out_tdata),
.probe1(memory_egress_tl_fifo_resp_out_tvalid),
.probe2(memory_egress_tl_fifo_resp_out_tready)
);

ila_40 ila_tl_resp(
.clk(clock),
.probe0(ocx_tl_resp_tdata),
.probe1(ocx_tl_resp_tready),
.probe2(ocx_tl_resp_tvalid)
);


`endif 

ocx_memory_egress TF_MEMORY_EGRESS
       (
         .ap_clk                        (clock)
        ,.ap_rst_n                      (reset_n)

        ,.capptag_fifo_out_V_V_TDATA    (memory_egress_capptag_fifo_out_tdata)
        ,.capptag_fifo_out_V_V_TREADY   (memory_egress_capptag_fifo_out_tready)
        ,.capptag_fifo_out_V_V_TVALID   (memory_egress_capptag_fifo_out_tvalid)

        ,.data0lookup_in_V_Addr_A       (memory_egress_datalookup0_in_portA_addr)
        ,.data0lookup_in_V_Clk_A        (memory_egress_datalookup0_in_portA_clk)
        ,.data0lookup_in_V_Din_A        (memory_egress_datalookup0_in_portA_din)
        ,.data0lookup_in_V_Dout_A       (memory_egress_datalookup0_in_portA_dout)
        ,.data0lookup_in_V_EN_A         (memory_egress_datalookup0_in_portA_en)
        ,.data0lookup_in_V_Rst_A        (memory_egress_datalookup0_in_portA_rst)
        ,.data0lookup_in_V_WEN_A        (memory_egress_datalookup0_in_portA_we)

        ,.data1lookup_in_V_Addr_A       (memory_egress_datalookup1_in_portA_addr)
        ,.data1lookup_in_V_Clk_A        (memory_egress_datalookup1_in_portA_clk)
        ,.data1lookup_in_V_Din_A        (memory_egress_datalookup1_in_portA_din)
        ,.data1lookup_in_V_Dout_A       (memory_egress_datalookup1_in_portA_dout)
        ,.data1lookup_in_V_EN_A         (memory_egress_datalookup1_in_portA_en)
        ,.data1lookup_in_V_Rst_A        (memory_egress_datalookup1_in_portA_rst)
        ,.data1lookup_in_V_WEN_A        (memory_egress_datalookup1_in_portA_we)

        ,.data2lookup_in_V_Dout_A       (512'b0)
        ,.data3lookup_in_V_Dout_A       (512'b0)

        ,.enable_V                      (mem_mode_enable)

        ,.net_resp_out_V_V_TDATA        (memory_netflit_out_tdata)
        ,.net_resp_out_V_V_TREADY       (memory_netflit_out_tready)
        ,.net_resp_out_V_V_TVALID       (memory_netflit_out_tvalid)

        ,.rtry_timeout_V                (rty_timeout)

        ,.rty_issue_fifo_out_V_V_TDATA  (memory_egress_rty_fifo_out_tdata)
        ,.rty_issue_fifo_out_V_V_TREADY (memory_egress_rty_fifo_out_tready)
        ,.rty_issue_fifo_out_V_V_TVALID (memory_egress_rty_fifo_out_tvalid)
 
        ,.tl_fifo_data_V_V_TDATA        (tl_resp_data_fifo_m_axis_tdata)
        ,.tl_fifo_data_V_V_TREADY       (tl_resp_data_fifo_m_axis_tready)
        ,.tl_fifo_data_V_V_TVALID       (tl_resp_data_fifo_m_axis_tvalid)

        ,.tl_fifo_resp_V_V_TDATA        (tl_resp_fifo_m_axis_tdata)
        ,.tl_fifo_resp_V_V_TREADY       (tl_resp_fifo_m_axis_tready)
        ,.tl_fifo_resp_V_V_TVALID       (tl_resp_fifo_m_axis_tvalid)

       );


tl_resp_fifo TF_TL_RESP_FIFO
       (
  `ifdef TFLOOPBACK
         .axis_wr_data_count           (tl_resp_fifo_axis_data_count)
  `else
         .axis_data_count           (tl_resp_fifo_axis_data_count)
  `endif
        ,.m_axis_tdata              (tl_resp_fifo_m_axis_tdata)
        ,.m_axis_tready             (tl_resp_fifo_m_axis_tready)
        ,.m_axis_tvalid             (tl_resp_fifo_m_axis_tvalid)
        ,.s_axis_aclk               (clock)
        ,.s_axis_aresetn            (reset_n)
        ,.s_axis_tdata              (memory_egress_tl_fifo_resp_out_tdata)
        ,.s_axis_tready             (memory_egress_tl_fifo_resp_out_tready)
        ,.s_axis_tvalid             (memory_egress_tl_fifo_resp_out_tvalid)
       ); 

dataflit_fifo TF_AFU_TLX_DATA_FIFO
       (
         .m_axis_tdata              (tl_resp_data_fifo_m_axis_tdata)
        ,.m_axis_tready             (tl_resp_data_fifo_m_axis_tready)
        ,.m_axis_tvalid             (tl_resp_data_fifo_m_axis_tvalid)
        ,.s_axis_aclk               (clock)
        ,.s_axis_aresetn            (reset_n)
        ,.s_axis_tdata              (ocx_tl_resp_data_tdata)
        ,.s_axis_tready             (ocx_tl_resp_data_tready)
        ,.s_axis_tvalid             (ocx_tl_resp_data_tvalid)
       );


rty_data_fifo TF_RTY_DATA_FIFO
       (
         .m_axis_tdata              (afu_tlx_data_fifo_m_axis_tdata)
        ,.m_axis_tready             (afu_tlx_data_fifo_m_axis_tready)
        ,.m_axis_tvalid             (afu_tlx_data_fifo_m_axis_tvalid)
        ,.s_axis_aclk               (clock)
        ,.s_axis_aresetn            (reset_n)
        ,.s_axis_tdata              (memory_egress_rty_fifo_out_tdata)
        ,.s_axis_tready             (memory_egress_rty_fifo_out_tready)
        ,.s_axis_tvalid             (memory_egress_rty_fifo_out_tvalid)
       );

capptag_fifo TF_CAPPTAG_FIFO
      (
         .m_axis_tdata             (capptag_fifo_m_axis_tdata)
        ,.m_axis_tready            (capptag_fifo_m_axis_tready)
        ,.m_axis_tvalid            (capptag_fifo_m_axis_tvalid)
        ,.s_axis_aclk              (clock)
        ,.s_axis_aresetn           (reset_n)
        ,.s_axis_tdata             (memory_egress_capptag_fifo_out_tdata)
        ,.s_axis_tready            (memory_egress_capptag_fifo_out_tready)
        ,.s_axis_tvalid            (memory_egress_capptag_fifo_out_tvalid)
      );

//Lookup BRAM cmd fifo that stores flits between egress and ingress paths
cmd_lookup_bram   TF_CMD_LOOKUP_BRAM
      (
         .addra                    (memory_ingress_cmdlookup_out_portA_addr)
        ,.addrb                    (memory_egress_cmdlookup_in_portA_addr)
        ,.clka                     (clock)
        ,.clkb                     (clock)
        ,.dina                     (memory_ingress_cmdlookup_out_portA_din)
        ,.dinb                     (memory_egress_cmdlookup_in_portA_din)
        ,.douta                    (memory_ingress_cmdlookup_out_portA_dout)
        ,.doutb                    (memory_egress_cmdlookup_in_portA_dout)
        ,.ena                      (memory_ingress_cmdlookup_out_portA_en)
        ,.enb                      (memory_egress_cmdlookup_in_portA_en)
        ,.rsta                     (memory_ingress_cmdlookup_out_portA_rst)
        ,.rstb                     (memory_egress_cmdlookup_in_portA_rst)
        ,.wea                      (memory_ingress_cmdlookup_out_portA_we)
        ,.web                      (memory_egress_cmdlookup_in_portA_we)
      );

//Lookup BRAM data fifos that stores 64B flits between egress and ingress paths
data_lookup_bram   TF_DATA_LOOKUP_BRAM0
      (
         .addra                    (memory_ingress_datalookup0_out_portA_addr)
        ,.addrb                    (memory_egress_datalookup0_in_portA_addr)
        ,.clka                     (clock)
        ,.clkb                     (clock)
        ,.dina                     (memory_ingress_datalookup0_out_portA_din)
        ,.dinb                     (memory_egress_datalookup0_in_portA_din)
        ,.douta                    (memory_ingress_datalookup0_out_portA_dout)
        ,.doutb                    (memory_egress_datalookup0_in_portA_dout)
        ,.ena                      (memory_ingress_datalookup0_out_portA_en)
        ,.enb                      (memory_egress_datalookup0_in_portA_en)
        ,.rsta                     (memory_ingress_datalookup0_out_portA_rst)
        ,.rstb                     (memory_egress_datalookup0_in_portA_rst)
        ,.wea                      (memory_ingress_datalookup0_out_portA_we)
        ,.web                      (memory_egress_datalookup0_in_portA_we)
      );

data_lookup_bram   TF_DATA_LOOKUP_BRAM1
      (
         .addra                    (memory_ingress_datalookup1_out_portA_addr)
        ,.addrb                    (memory_egress_datalookup1_in_portA_addr)
        ,.clka                     (clock)
        ,.clkb                     (clock)
        ,.dina                     (memory_ingress_datalookup1_out_portA_din)
        ,.dinb                     (memory_egress_datalookup1_in_portA_din)
        ,.douta                    (memory_ingress_datalookup1_out_portA_dout)
        ,.doutb                    (memory_egress_datalookup1_in_portA_dout)
        ,.ena                      (memory_ingress_datalookup1_out_portA_en)
        ,.enb                      (memory_egress_datalookup1_in_portA_en)
        ,.rsta                     (memory_ingress_datalookup1_out_portA_rst)
        ,.rstb                     (memory_egress_datalookup1_in_portA_rst)
        ,.wea                      (memory_ingress_datalookup1_out_portA_we)
        ,.web                      (memory_egress_datalookup1_in_portA_we)
      );
  
`ifdef DEBUG

ila_512 TF_MEMORY_ROUTING_INGR_64B(
.clk(clock),
.probe0(memory_netflit_in_tdata),
.probe1(memory_netflit_in_tvalid),
.probe2(memory_netflit_in_tready)
);



ila_512 ila_memory_netflit_out(
.clk(clock),
.probe0(memory_netflit_out_tdata),
.probe1(memory_netflit_out_tvalid),
.probe2(memory_netflit_out_tready)
);
 
`endif

`endif
 

`ifdef ETH

assign qsfp0_crc_valid = qsfp0_rx_tlast;
assign qsfp0_usr_clk = clock;
assign power_on_qsfp0_rout = reset_n;
assign qsfp0_crc_ok  = !qsfp0_rx_tuser;



//--------------->QSFP0 Network Pipeline
 cmac_krnl_0_0   cmac_krnl_compute
(
  .ap_clk(clock)               ,
  .ap_rst_n(reset_n)             ,

  .axis_net_rx_tvalid(memory_netflit_in_tvalid)   ,
  .axis_net_rx_tready(1'b1)   ,
  .axis_net_rx_tdata(memory_netflit_in_tdata)    ,
  .axis_net_rx_tkeep()    ,
  .axis_net_rx_tlast()    ,
  .rx_err(), 

  .axis_net_tx_tvalid(ocx_compute_netflit_out_tvalid)   ,
  .axis_net_tx_tready(ocx_compute_netflit_out_tready)   ,
  .axis_net_tx_tdata(ocx_compute_netflit_out_tdata)    ,
  .axis_net_tx_tkeep({64{1'b1}})    ,
  .axis_net_tx_tlast(1'b1)    ,

  // Network physical
  .clk_gt_freerun(serdes_init_clock),
  .gt_rxp_in(qsfp0_rx_p),
  .gt_rxn_in(qsfp0_rx_n),
  .gt_txp_out(qsfp0_tx_p),
  .gt_txn_out(qsfp0_tx_n),
  .gt_refclk0_p(qsfp0_ref_clk_p),
  .gt_refclk0_n(qsfp0_ref_clk_n),
  .net_clk(),
  .net_rst_n(),

  .local_mac(48'h02_00_00_00_00_00),  
  .remote_mac(48'h02_00_00_00_00_01), 
  .ethertype(32'hFF_FF_FF_FF)  


);

`endif
 
`ifdef ETH
 
//--------------->QSFP1 Network Pipeline
 cmac_krnl_1_0   cmac_krnl_mem
(
  .ap_clk(clock)               ,
  .ap_rst_n(reset_n)             ,

  .axis_net_rx_tvalid(memory_netflit_in_tvalid)   ,
  .axis_net_rx_tready(1'b1)   ,
  .axis_net_rx_tdata(memory_netflit_in_tdata)    ,
  .axis_net_rx_tkeep()    ,
  .axis_net_rx_tlast()    ,
  .rx_err(), 

  .axis_net_tx_tvalid(memory_netflit_out_tvalid)   ,
  .axis_net_tx_tready(memory_netflit_out_tready)   ,
  .axis_net_tx_tdata(memory_netflit_out_tdata)    ,
  .axis_net_tx_tkeep({64{1'b1}})    ,
  .axis_net_tx_tlast(1'b1)    ,

  // Network physical
  .clk_gt_freerun(serdes_init_clock),
  .gt_rxp_in(qsfp1_rx_p),
  .gt_rxn_in(qsfp1_rx_n),
  .gt_txp_out(qsfp1_tx_p),
  .gt_txn_out(qsfp1_tx_n),
  .gt_refclk0_p(qsfp1_ref_clk_p),
  .gt_refclk0_n(qsfp1_ref_clk_n),
  .net_clk(),
  .net_rst_n(),

  .local_mac(48'h02_00_00_00_00_01),  
  .remote_mac(48'h02_00_00_00_00_00), 
  .ethertype(32'hFF_FF_FF_FF)  

);

`endif


endmodule
