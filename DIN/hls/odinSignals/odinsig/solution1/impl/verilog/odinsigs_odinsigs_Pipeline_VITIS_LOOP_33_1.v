// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module odinsigs_odinsigs_Pipeline_VITIS_LOOP_33_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        AEROUT_REQ,
        AEROUT_ADDR,
        AEROUT_ACK,
        AEROUT_ACK_ap_vld
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] AEROUT_REQ;
input  [31:0] AEROUT_ADDR;
output  [31:0] AEROUT_ACK;
output   AEROUT_ACK_ap_vld;

reg ap_done;
reg ap_idle;
reg[31:0] AEROUT_ACK;
reg AEROUT_ACK_ap_vld;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln35_fu_45_p2;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        if ((icmp_ln35_fu_45_p2 == 1'd1)) begin
            AEROUT_ACK = 32'd1;
        end else if ((icmp_ln35_fu_45_p2 == 1'd0)) begin
            AEROUT_ACK = 32'd0;
        end else begin
            AEROUT_ACK = 'bx;
        end
    end else begin
        AEROUT_ACK = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln35_fu_45_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((icmp_ln35_fu_45_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        AEROUT_ACK_ap_vld = 1'b1;
    end else begin
        AEROUT_ACK_ap_vld = 1'b0;
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
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
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
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_ready = 1'b0;

assign icmp_ln35_fu_45_p2 = ((AEROUT_REQ == 32'd1) ? 1'b1 : 1'b0);

endmodule //odinsigs_odinsigs_Pipeline_VITIS_LOOP_33_1
