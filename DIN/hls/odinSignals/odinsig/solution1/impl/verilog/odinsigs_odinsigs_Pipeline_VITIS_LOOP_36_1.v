// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module odinsigs_odinsigs_Pipeline_VITIS_LOOP_36_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        AEROUT_REQ,
        icmp_ln38,
        AEROUT_ACK,
        ap_return
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] AEROUT_REQ;
input  [0:0] icmp_ln38;
input  [31:0] AEROUT_ACK;
output  [1:0] ap_return;

reg ap_idle;
reg[1:0] ap_return;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] or_ln37_fu_70_p2;
wire   [0:0] icmp_ln37_fu_58_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [1:0] ap_phi_mux_merge_phi_fu_51_p4;
wire   [1:0] select_ln37_fu_76_p3;
wire   [0:0] icmp_ln37_1_fu_64_p2;
reg   [1:0] ap_return_preg;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_loop_init;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_return_preg = 2'd0;
#0 ap_done_reg = 1'b0;
end

odinsigs_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 2'd0;
    end else begin
        if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((icmp_ln37_fu_58_p2 == 1'd0) | (or_ln37_fu_70_p2 == 1'd1)))) begin
            ap_return_preg <= ap_phi_mux_merge_phi_fu_51_p4;
        end
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((icmp_ln37_fu_58_p2 == 1'd0) | (or_ln37_fu_70_p2 == 1'd1)))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if (((icmp_ln37_fu_58_p2 == 1'd1) & (or_ln37_fu_70_p2 == 1'd1))) begin
            ap_phi_mux_merge_phi_fu_51_p4 = select_ln37_fu_76_p3;
        end else if ((icmp_ln37_fu_58_p2 == 1'd0)) begin
            ap_phi_mux_merge_phi_fu_51_p4 = 2'd0;
        end else begin
            ap_phi_mux_merge_phi_fu_51_p4 = 'bx;
        end
    end else begin
        ap_phi_mux_merge_phi_fu_51_p4 = 'bx;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((icmp_ln37_fu_58_p2 == 1'd0) | (or_ln37_fu_70_p2 == 1'd1)))) begin
        ap_return = ap_phi_mux_merge_phi_fu_51_p4;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln37_1_fu_64_p2 = ((AEROUT_ACK != 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln37_fu_58_p2 = ((AEROUT_REQ == 32'd0) ? 1'b1 : 1'b0);

assign or_ln37_fu_70_p2 = (icmp_ln38 | icmp_ln37_1_fu_64_p2);

assign select_ln37_fu_76_p3 = ((icmp_ln37_1_fu_64_p2[0:0] == 1'b1) ? 2'd2 : 2'd1);

endmodule //odinsigs_odinsigs_Pipeline_VITIS_LOOP_36_1
