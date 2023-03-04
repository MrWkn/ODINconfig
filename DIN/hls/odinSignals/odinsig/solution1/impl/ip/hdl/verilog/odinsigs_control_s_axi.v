// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module odinsigs_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 7,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle,
    input  wire [31:0]                   ap_return,
    input  wire [31:0]                   addr_o,
    input  wire                          addr_o_ap_vld,
    input  wire [31:0]                   req_o,
    input  wire                          req_o_ap_vld,
    output wire [31:0]                   ack_o,
    output wire [31:0]                   writeloc,
    input  wire [31:0]                   pop_n,
    input  wire                          pop_n_ap_vld,
    input  wire [31:0]                   postneuron,
    input  wire                          postneuron_ap_vld
);
//------------------------Address Info-------------------
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x10 : Data signal of ap_return
//        bit 31~0 - ap_return[31:0] (Read)
// 0x18 : Data signal of addr_o
//        bit 31~0 - addr_o[31:0] (Read)
// 0x1c : Control signal of addr_o
//        bit 0  - addr_o_ap_vld (Read/COR)
//        others - reserved
// 0x28 : Data signal of req_o
//        bit 31~0 - req_o[31:0] (Read)
// 0x2c : Control signal of req_o
//        bit 0  - req_o_ap_vld (Read/COR)
//        others - reserved
// 0x38 : Data signal of ack_o
//        bit 31~0 - ack_o[31:0] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of writeloc
//        bit 31~0 - writeloc[31:0] (Read/Write)
// 0x44 : reserved
// 0x48 : Data signal of pop_n
//        bit 31~0 - pop_n[31:0] (Read)
// 0x4c : Control signal of pop_n
//        bit 0  - pop_n_ap_vld (Read/COR)
//        others - reserved
// 0x58 : Data signal of postneuron
//        bit 31~0 - postneuron[31:0] (Read)
// 0x5c : Control signal of postneuron
//        bit 0  - postneuron_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL           = 7'h00,
    ADDR_GIE               = 7'h04,
    ADDR_IER               = 7'h08,
    ADDR_ISR               = 7'h0c,
    ADDR_AP_RETURN_0       = 7'h10,
    ADDR_ADDR_O_DATA_0     = 7'h18,
    ADDR_ADDR_O_CTRL       = 7'h1c,
    ADDR_REQ_O_DATA_0      = 7'h28,
    ADDR_REQ_O_CTRL        = 7'h2c,
    ADDR_ACK_O_DATA_0      = 7'h38,
    ADDR_ACK_O_CTRL        = 7'h3c,
    ADDR_WRITELOC_DATA_0   = 7'h40,
    ADDR_WRITELOC_CTRL     = 7'h44,
    ADDR_POP_N_DATA_0      = 7'h48,
    ADDR_POP_N_CTRL        = 7'h4c,
    ADDR_POSTNEURON_DATA_0 = 7'h58,
    ADDR_POSTNEURON_CTRL   = 7'h5c,
    WRIDLE                 = 2'd0,
    WRDATA                 = 2'd1,
    WRRESP                 = 2'd2,
    WRRESET                = 2'd3,
    RDIDLE                 = 2'd0,
    RDDATA                 = 2'd1,
    RDRESET                = 2'd2,
    ADDR_BITS                = 7;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [31:0]                   int_ap_return;
    reg                           int_addr_o_ap_vld;
    reg  [31:0]                   int_addr_o = 'b0;
    reg                           int_req_o_ap_vld;
    reg  [31:0]                   int_req_o = 'b0;
    reg  [31:0]                   int_ack_o = 'b0;
    reg  [31:0]                   int_writeloc = 'b0;
    reg                           int_pop_n_ap_vld;
    reg  [31:0]                   int_pop_n = 'b0;
    reg                           int_postneuron_ap_vld;
    reg  [31:0]                   int_postneuron = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_AP_RETURN_0: begin
                    rdata <= int_ap_return[31:0];
                end
                ADDR_ADDR_O_DATA_0: begin
                    rdata <= int_addr_o[31:0];
                end
                ADDR_ADDR_O_CTRL: begin
                    rdata[0] <= int_addr_o_ap_vld;
                end
                ADDR_REQ_O_DATA_0: begin
                    rdata <= int_req_o[31:0];
                end
                ADDR_REQ_O_CTRL: begin
                    rdata[0] <= int_req_o_ap_vld;
                end
                ADDR_ACK_O_DATA_0: begin
                    rdata <= int_ack_o[31:0];
                end
                ADDR_WRITELOC_DATA_0: begin
                    rdata <= int_writeloc[31:0];
                end
                ADDR_POP_N_DATA_0: begin
                    rdata <= int_pop_n[31:0];
                end
                ADDR_POP_N_CTRL: begin
                    rdata[0] <= int_pop_n_ap_vld;
                end
                ADDR_POSTNEURON_DATA_0: begin
                    rdata <= int_postneuron[31:0];
                end
                ADDR_POSTNEURON_CTRL: begin
                    rdata[0] <= int_postneuron_ap_vld;
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt         = int_gie & (|int_isr);
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
assign ack_o             = int_ack_o;
assign writeloc          = int_writeloc;
// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_ap_return
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_return <= 0;
    else if (ACLK_EN) begin
        if (ap_done)
            int_ap_return <= ap_return;
    end
end

// int_addr_o
always @(posedge ACLK) begin
    if (ARESET)
        int_addr_o <= 0;
    else if (ACLK_EN) begin
        if (addr_o_ap_vld)
            int_addr_o <= addr_o;
    end
end

// int_addr_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_addr_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (addr_o_ap_vld)
            int_addr_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_ADDR_O_CTRL)
            int_addr_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_req_o
always @(posedge ACLK) begin
    if (ARESET)
        int_req_o <= 0;
    else if (ACLK_EN) begin
        if (req_o_ap_vld)
            int_req_o <= req_o;
    end
end

// int_req_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_req_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (req_o_ap_vld)
            int_req_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_REQ_O_CTRL)
            int_req_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_ack_o[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ack_o[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ACK_O_DATA_0)
            int_ack_o[31:0] <= (WDATA[31:0] & wmask) | (int_ack_o[31:0] & ~wmask);
    end
end

// int_writeloc[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_writeloc[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WRITELOC_DATA_0)
            int_writeloc[31:0] <= (WDATA[31:0] & wmask) | (int_writeloc[31:0] & ~wmask);
    end
end

// int_pop_n
always @(posedge ACLK) begin
    if (ARESET)
        int_pop_n <= 0;
    else if (ACLK_EN) begin
        if (pop_n_ap_vld)
            int_pop_n <= pop_n;
    end
end

// int_pop_n_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_pop_n_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (pop_n_ap_vld)
            int_pop_n_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_POP_N_CTRL)
            int_pop_n_ap_vld <= 1'b0; // clear on read
    end
end

// int_postneuron
always @(posedge ACLK) begin
    if (ARESET)
        int_postneuron <= 0;
    else if (ACLK_EN) begin
        if (postneuron_ap_vld)
            int_postneuron <= postneuron;
    end
end

// int_postneuron_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_postneuron_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (postneuron_ap_vld)
            int_postneuron_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_POSTNEURON_CTRL)
            int_postneuron_ap_vld <= 1'b0; // clear on read
    end
end


//------------------------Memory logic-------------------

endmodule