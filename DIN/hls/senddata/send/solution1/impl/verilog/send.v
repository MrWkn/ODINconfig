// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="send_send,hls_ip_2021_1,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu9eg-ffvb1156-2-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.300000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=4,HLS_SYN_DSP=0,HLS_SYN_FF=961,HLS_SYN_LUT=1098,HLS_VERSION=2021_1}" *)

module send (
        ap_clk,
        ap_rst_n,
        m_axi_gmem_AWVALID,
        m_axi_gmem_AWREADY,
        m_axi_gmem_AWADDR,
        m_axi_gmem_AWID,
        m_axi_gmem_AWLEN,
        m_axi_gmem_AWSIZE,
        m_axi_gmem_AWBURST,
        m_axi_gmem_AWLOCK,
        m_axi_gmem_AWCACHE,
        m_axi_gmem_AWPROT,
        m_axi_gmem_AWQOS,
        m_axi_gmem_AWREGION,
        m_axi_gmem_AWUSER,
        m_axi_gmem_WVALID,
        m_axi_gmem_WREADY,
        m_axi_gmem_WDATA,
        m_axi_gmem_WSTRB,
        m_axi_gmem_WLAST,
        m_axi_gmem_WID,
        m_axi_gmem_WUSER,
        m_axi_gmem_ARVALID,
        m_axi_gmem_ARREADY,
        m_axi_gmem_ARADDR,
        m_axi_gmem_ARID,
        m_axi_gmem_ARLEN,
        m_axi_gmem_ARSIZE,
        m_axi_gmem_ARBURST,
        m_axi_gmem_ARLOCK,
        m_axi_gmem_ARCACHE,
        m_axi_gmem_ARPROT,
        m_axi_gmem_ARQOS,
        m_axi_gmem_ARREGION,
        m_axi_gmem_ARUSER,
        m_axi_gmem_RVALID,
        m_axi_gmem_RREADY,
        m_axi_gmem_RDATA,
        m_axi_gmem_RLAST,
        m_axi_gmem_RID,
        m_axi_gmem_RUSER,
        m_axi_gmem_RRESP,
        m_axi_gmem_BVALID,
        m_axi_gmem_BREADY,
        m_axi_gmem_BRESP,
        m_axi_gmem_BID,
        m_axi_gmem_BUSER,
        data,
        req,
        ack,
        s_axi_control_AWVALID,
        s_axi_control_AWREADY,
        s_axi_control_AWADDR,
        s_axi_control_WVALID,
        s_axi_control_WREADY,
        s_axi_control_WDATA,
        s_axi_control_WSTRB,
        s_axi_control_ARVALID,
        s_axi_control_ARREADY,
        s_axi_control_ARADDR,
        s_axi_control_RVALID,
        s_axi_control_RREADY,
        s_axi_control_RDATA,
        s_axi_control_RRESP,
        s_axi_control_BVALID,
        s_axi_control_BREADY,
        s_axi_control_BRESP,
        interrupt
);

parameter    ap_ST_fsm_state1 = 15'd1;
parameter    ap_ST_fsm_state2 = 15'd2;
parameter    ap_ST_fsm_state3 = 15'd4;
parameter    ap_ST_fsm_state4 = 15'd8;
parameter    ap_ST_fsm_state5 = 15'd16;
parameter    ap_ST_fsm_state6 = 15'd32;
parameter    ap_ST_fsm_state7 = 15'd64;
parameter    ap_ST_fsm_state8 = 15'd128;
parameter    ap_ST_fsm_state9 = 15'd256;
parameter    ap_ST_fsm_state10 = 15'd512;
parameter    ap_ST_fsm_state11 = 15'd1024;
parameter    ap_ST_fsm_pp0_stage0 = 15'd2048;
parameter    ap_ST_fsm_pp0_stage1 = 15'd4096;
parameter    ap_ST_fsm_state15 = 15'd8192;
parameter    ap_ST_fsm_state16 = 15'd16384;
parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_GMEM_ID_WIDTH = 1;
parameter    C_M_AXI_GMEM_ADDR_WIDTH = 64;
parameter    C_M_AXI_GMEM_DATA_WIDTH = 32;
parameter    C_M_AXI_GMEM_AWUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_ARUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_WUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_RUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_BUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_USER_VALUE = 0;
parameter    C_M_AXI_GMEM_PROT_VALUE = 0;
parameter    C_M_AXI_GMEM_CACHE_VALUE = 3;
parameter    C_M_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_GMEM_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
output   m_axi_gmem_AWVALID;
input   m_axi_gmem_AWREADY;
output  [C_M_AXI_GMEM_ADDR_WIDTH - 1:0] m_axi_gmem_AWADDR;
output  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_AWID;
output  [7:0] m_axi_gmem_AWLEN;
output  [2:0] m_axi_gmem_AWSIZE;
output  [1:0] m_axi_gmem_AWBURST;
output  [1:0] m_axi_gmem_AWLOCK;
output  [3:0] m_axi_gmem_AWCACHE;
output  [2:0] m_axi_gmem_AWPROT;
output  [3:0] m_axi_gmem_AWQOS;
output  [3:0] m_axi_gmem_AWREGION;
output  [C_M_AXI_GMEM_AWUSER_WIDTH - 1:0] m_axi_gmem_AWUSER;
output   m_axi_gmem_WVALID;
input   m_axi_gmem_WREADY;
output  [C_M_AXI_GMEM_DATA_WIDTH - 1:0] m_axi_gmem_WDATA;
output  [C_M_AXI_GMEM_WSTRB_WIDTH - 1:0] m_axi_gmem_WSTRB;
output   m_axi_gmem_WLAST;
output  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_WID;
output  [C_M_AXI_GMEM_WUSER_WIDTH - 1:0] m_axi_gmem_WUSER;
output   m_axi_gmem_ARVALID;
input   m_axi_gmem_ARREADY;
output  [C_M_AXI_GMEM_ADDR_WIDTH - 1:0] m_axi_gmem_ARADDR;
output  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_ARID;
output  [7:0] m_axi_gmem_ARLEN;
output  [2:0] m_axi_gmem_ARSIZE;
output  [1:0] m_axi_gmem_ARBURST;
output  [1:0] m_axi_gmem_ARLOCK;
output  [3:0] m_axi_gmem_ARCACHE;
output  [2:0] m_axi_gmem_ARPROT;
output  [3:0] m_axi_gmem_ARQOS;
output  [3:0] m_axi_gmem_ARREGION;
output  [C_M_AXI_GMEM_ARUSER_WIDTH - 1:0] m_axi_gmem_ARUSER;
input   m_axi_gmem_RVALID;
output   m_axi_gmem_RREADY;
input  [C_M_AXI_GMEM_DATA_WIDTH - 1:0] m_axi_gmem_RDATA;
input   m_axi_gmem_RLAST;
input  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_RID;
input  [C_M_AXI_GMEM_RUSER_WIDTH - 1:0] m_axi_gmem_RUSER;
input  [1:0] m_axi_gmem_RRESP;
input   m_axi_gmem_BVALID;
output   m_axi_gmem_BREADY;
input  [1:0] m_axi_gmem_BRESP;
input  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_BID;
input  [C_M_AXI_GMEM_BUSER_WIDTH - 1:0] m_axi_gmem_BUSER;
output  [31:0] data;
output  [31:0] req;
input  [31:0] ack;
input   s_axi_control_AWVALID;
output   s_axi_control_AWREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_AWADDR;
input   s_axi_control_WVALID;
output   s_axi_control_WREADY;
input  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_WDATA;
input  [C_S_AXI_CONTROL_WSTRB_WIDTH - 1:0] s_axi_control_WSTRB;
input   s_axi_control_ARVALID;
output   s_axi_control_ARREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_ARADDR;
output   s_axi_control_RVALID;
input   s_axi_control_RREADY;
output  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_RDATA;
output  [1:0] s_axi_control_RRESP;
output   s_axi_control_BVALID;
input   s_axi_control_BREADY;
output  [1:0] s_axi_control_BRESP;
output   interrupt;

 reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [14:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
wire   [63:0] data_ptr;
reg   [31:0] data_1_data_reg;
reg   [31:0] data_1_data_in;
reg    data_1_vld_reg;
reg    data_1_vld_in;
reg    data_1_ack_in;
reg   [31:0] req_1_data_reg;
reg   [31:0] req_1_data_in;
reg    req_1_vld_reg;
reg    req_1_vld_in;
reg    req_1_ack_in;
reg   [31:0] ack_0_data_reg;
reg    ack_0_vld_reg;
reg    ack_0_ack_out;
wire   [31:0] read_loc;
reg   [31:0] read_loc_0_data_reg;
reg    read_loc_0_vld_reg;
reg    read_loc_0_ack_out;
reg    gmem_blk_n_AR;
wire    ap_CS_fsm_state3;
reg    gmem_blk_n_R;
wire    ap_CS_fsm_state10;
reg   [63:0] data_ptr_read_reg_177;
reg   [63:0] gmem_addr_reg_182;
wire    ap_CS_fsm_state2;
reg    ap_enable_reg_pp0_iter0;
wire    ap_CS_fsm_state11;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state13_pp0_stage1_iter0;
wire    ap_block_pp0_stage1_subdone;
wire   [0:0] icmp_ln14_fu_171_p2;
reg    ap_condition_pp0_exit_iter0_state13;
reg    ap_enable_reg_pp0_iter1;
wire    gmem_AWREADY;
wire    gmem_WREADY;
reg    gmem_ARVALID;
wire    gmem_ARREADY;
wire    gmem_RVALID;
reg    gmem_RREADY;
wire   [31:0] gmem_RDATA;
wire    gmem_RLAST;
wire   [0:0] gmem_RID;
wire   [0:0] gmem_RUSER;
wire   [1:0] gmem_RRESP;
wire    gmem_BVALID;
wire   [1:0] gmem_BRESP;
wire   [0:0] gmem_BID;
wire   [0:0] gmem_BUSER;
wire  signed [63:0] sext_ln12_1_fu_161_p1;
wire    ap_CS_fsm_state15;
wire    ap_block_pp0_stage1_11001;
wire    ap_block_pp0_stage1_01001;
wire   [33:0] shl_ln_fu_134_p3;
wire  signed [63:0] sext_ln12_fu_142_p1;
wire   [63:0] add_ln12_fu_146_p2;
wire   [61:0] trunc_ln_fu_151_p4;
wire    ap_block_pp0_stage1;
wire    ap_CS_fsm_state16;
reg    ap_block_state16;
reg   [14:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state15_blk;
reg    ap_ST_fsm_state16_blk;
wire    ap_block_state12_pp0_stage0_iter0;
wire    ap_block_state14_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_subdone;
wire    ap_block_pp0_stage0_11001;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;
wire   [31:0] ap_return;

// power-on initialization
initial begin
#0 ap_CS_fsm = 15'd1;
#0 data_1_data_reg = 32'd0;
#0 data_1_vld_reg = 1'b0;
#0 req_1_data_reg = 32'd0;
#0 req_1_vld_reg = 1'b0;
#0 ack_0_data_reg = 32'd0;
#0 ack_0_vld_reg = 1'b0;
#0 read_loc_0_data_reg = 32'd0;
#0 read_loc_0_vld_reg = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

send_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
control_s_axi_U(
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_return(32'd1),
    .data_ptr(data_ptr),
    .read_loc(read_loc)
);

send_gmem_m_axi #(
    .CONSERVATIVE( 0 ),
    .USER_DW( 32 ),
    .USER_AW( 64 ),
    .USER_MAXREQS( 5 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_GMEM_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_GMEM_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_GMEM_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_GMEM_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_GMEM_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_GMEM_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_GMEM_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_GMEM_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_GMEM_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_GMEM_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_GMEM_CACHE_VALUE ))
gmem_m_axi_U(
    .AWVALID(m_axi_gmem_AWVALID),
    .AWREADY(m_axi_gmem_AWREADY),
    .AWADDR(m_axi_gmem_AWADDR),
    .AWID(m_axi_gmem_AWID),
    .AWLEN(m_axi_gmem_AWLEN),
    .AWSIZE(m_axi_gmem_AWSIZE),
    .AWBURST(m_axi_gmem_AWBURST),
    .AWLOCK(m_axi_gmem_AWLOCK),
    .AWCACHE(m_axi_gmem_AWCACHE),
    .AWPROT(m_axi_gmem_AWPROT),
    .AWQOS(m_axi_gmem_AWQOS),
    .AWREGION(m_axi_gmem_AWREGION),
    .AWUSER(m_axi_gmem_AWUSER),
    .WVALID(m_axi_gmem_WVALID),
    .WREADY(m_axi_gmem_WREADY),
    .WDATA(m_axi_gmem_WDATA),
    .WSTRB(m_axi_gmem_WSTRB),
    .WLAST(m_axi_gmem_WLAST),
    .WID(m_axi_gmem_WID),
    .WUSER(m_axi_gmem_WUSER),
    .ARVALID(m_axi_gmem_ARVALID),
    .ARREADY(m_axi_gmem_ARREADY),
    .ARADDR(m_axi_gmem_ARADDR),
    .ARID(m_axi_gmem_ARID),
    .ARLEN(m_axi_gmem_ARLEN),
    .ARSIZE(m_axi_gmem_ARSIZE),
    .ARBURST(m_axi_gmem_ARBURST),
    .ARLOCK(m_axi_gmem_ARLOCK),
    .ARCACHE(m_axi_gmem_ARCACHE),
    .ARPROT(m_axi_gmem_ARPROT),
    .ARQOS(m_axi_gmem_ARQOS),
    .ARREGION(m_axi_gmem_ARREGION),
    .ARUSER(m_axi_gmem_ARUSER),
    .RVALID(m_axi_gmem_RVALID),
    .RREADY(m_axi_gmem_RREADY),
    .RDATA(m_axi_gmem_RDATA),
    .RLAST(m_axi_gmem_RLAST),
    .RID(m_axi_gmem_RID),
    .RUSER(m_axi_gmem_RUSER),
    .RRESP(m_axi_gmem_RRESP),
    .BVALID(m_axi_gmem_BVALID),
    .BREADY(m_axi_gmem_BREADY),
    .BRESP(m_axi_gmem_BRESP),
    .BID(m_axi_gmem_BID),
    .BUSER(m_axi_gmem_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(gmem_ARVALID),
    .I_ARREADY(gmem_ARREADY),
    .I_ARADDR(gmem_addr_reg_182),
    .I_ARID(1'd0),
    .I_ARLEN(32'd1),
    .I_ARSIZE(3'd0),
    .I_ARLOCK(2'd0),
    .I_ARCACHE(4'd0),
    .I_ARQOS(4'd0),
    .I_ARPROT(3'd0),
    .I_ARUSER(1'd0),
    .I_ARBURST(2'd0),
    .I_ARREGION(4'd0),
    .I_RVALID(gmem_RVALID),
    .I_RREADY(gmem_RREADY),
    .I_RDATA(gmem_RDATA),
    .I_RID(gmem_RID),
    .I_RUSER(gmem_RUSER),
    .I_RRESP(gmem_RRESP),
    .I_RLAST(gmem_RLAST),
    .I_AWVALID(1'b0),
    .I_AWREADY(gmem_AWREADY),
    .I_AWADDR(64'd0),
    .I_AWID(1'd0),
    .I_AWLEN(32'd0),
    .I_AWSIZE(3'd0),
    .I_AWLOCK(2'd0),
    .I_AWCACHE(4'd0),
    .I_AWQOS(4'd0),
    .I_AWPROT(3'd0),
    .I_AWUSER(1'd0),
    .I_AWBURST(2'd0),
    .I_AWREGION(4'd0),
    .I_WVALID(1'b0),
    .I_WREADY(gmem_WREADY),
    .I_WDATA(32'd0),
    .I_WID(1'd0),
    .I_WUSER(1'd0),
    .I_WLAST(1'b0),
    .I_WSTRB(4'd0),
    .I_BVALID(gmem_BVALID),
    .I_BREADY(1'b0),
    .I_BRESP(gmem_BRESP),
    .I_BID(gmem_BID),
    .I_BUSER(gmem_BUSER)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state13) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state11)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state13) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state13);
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((1'b1 == ap_CS_fsm_state11)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) & (1'b1 == ack_0_ack_out) & (1'b1 == 1'b1) & (1'b1 == ack_0_vld_reg)) | (~((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) & (1'b0 == ack_0_vld_reg) & (1'b1 == 1'b1)))) begin
        ack_0_data_reg <= ack;
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) & (1'b1 == 1'b1) & (data_1_vld_in == 1'b1) & (data_1_vld_reg == 1'b1)) | (~((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) & (data_1_vld_in == 1'b1) & (data_1_vld_reg == 1'b0)))) begin
        data_1_data_reg <= data_1_data_in;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        data_ptr_read_reg_177 <= data_ptr;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        gmem_addr_reg_182 <= sext_ln12_1_fu_161_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) & (read_loc_0_ack_out == 1'b1) & (1'b1 == 1'b1) & (read_loc_0_vld_reg == 1'b1)) | (~((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) & (1'b1 == 1'b1) & (read_loc_0_vld_reg == 1'b0)))) begin
        read_loc_0_data_reg <= read_loc;
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) & (1'b1 == 1'b1) & (req_1_vld_in == 1'b1) & (req_1_vld_reg == 1'b1)) | (~((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) & (req_1_vld_in == 1'b1) & (req_1_vld_reg == 1'b0)))) begin
        req_1_data_reg <= req_1_data_in;
    end
end

always @ (*) begin
    if (((~((data_1_ack_in == 1'b0) | (req_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state16)) | ((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        ack_0_ack_out = 1'b1;
    end else begin
        ack_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((gmem_RVALID == 1'b0)) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

always @ (*) begin
    if (((data_1_ack_in == 1'b0) | (req_1_ack_in == 1'b0))) begin
        ap_ST_fsm_state16_blk = 1'b1;
    end else begin
        ap_ST_fsm_state16_blk = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((gmem_ARREADY == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((icmp_ln14_fu_171_p2 == 1'd0)) begin
        ap_condition_pp0_exit_iter0_state13 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state13 = 1'b0;
    end
end

always @ (*) begin
    if ((~((data_1_ack_in == 1'b0) | (req_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state16))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((data_1_ack_in == 1'b0) | (req_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state16))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((data_1_vld_reg == 1'b0) | ((1'b1 == 1'b1) & (data_1_vld_reg == 1'b1)))) begin
        data_1_ack_in = 1'b1;
    end else begin
        data_1_ack_in = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state15)) begin
        data_1_data_in = 32'd0;
    end else if (((gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
        data_1_data_in = gmem_RDATA;
    end else begin
        data_1_data_in = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state15) | ((gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state10)))) begin
        data_1_vld_in = 1'b1;
    end else begin
        data_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((gmem_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        gmem_ARVALID = 1'b1;
    end else begin
        gmem_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
        gmem_RREADY = 1'b1;
    end else begin
        gmem_RREADY = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        gmem_blk_n_AR = m_axi_gmem_ARREADY;
    end else begin
        gmem_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        gmem_blk_n_R = m_axi_gmem_RVALID;
    end else begin
        gmem_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (~((data_1_ack_in == 1'b0) | (req_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state16)))) begin
        read_loc_0_ack_out = 1'b1;
    end else begin
        read_loc_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if (((req_1_vld_reg == 1'b0) | ((1'b1 == 1'b1) & (req_1_vld_reg == 1'b1)))) begin
        req_1_ack_in = 1'b1;
    end else begin
        req_1_ack_in = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state15)) begin
        req_1_data_in = 32'd0;
    end else if (((icmp_ln14_fu_171_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        req_1_data_in = 32'd1;
    end else begin
        req_1_data_in = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state15) | ((icmp_ln14_fu_171_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        req_1_vld_in = 1'b1;
    end else begin
        req_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((gmem_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            if (((gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((~((icmp_ln14_fu_171_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((icmp_ln14_fu_171_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state15;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            if ((~((data_1_ack_in == 1'b0) | (req_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state16))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state16;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln12_fu_146_p2 = ($signed(sext_ln12_fu_142_p1) + $signed(data_ptr_read_reg_177));

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state16 = ((data_1_ack_in == 1'b0) | (req_1_ack_in == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign data = data_1_data_reg;

assign icmp_ln14_fu_171_p2 = ((ack_0_data_reg == 32'd0) ? 1'b1 : 1'b0);

assign req = req_1_data_reg;

assign sext_ln12_1_fu_161_p1 = $signed(trunc_ln_fu_151_p4);

assign sext_ln12_fu_142_p1 = $signed(shl_ln_fu_134_p3);

assign shl_ln_fu_134_p3 = {{read_loc_0_data_reg}, {2'd0}};

assign trunc_ln_fu_151_p4 = {{add_ln12_fu_146_p2[63:2]}};

endmodule //send
