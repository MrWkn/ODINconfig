-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity odinsigs is
generic (
    C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER := 7;
    C_S_AXI_CONTROL_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    AEROUT_ADDR : IN STD_LOGIC_VECTOR (31 downto 0);
    AEROUT_REQ : IN STD_LOGIC_VECTOR (31 downto 0);
    AEROUT_ACK : OUT STD_LOGIC_VECTOR (31 downto 0);
    CTRL_SCHED_POP_N : IN STD_LOGIC_VECTOR (31 downto 0);
    CTRL_NEURMEM_ADDR : IN STD_LOGIC_VECTOR (31 downto 0);
    AEROUT_CTRL_BUSY : IN STD_LOGIC_VECTOR (31 downto 0);
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH/8-1 downto 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    interrupt : OUT STD_LOGIC );
end;


architecture behav of odinsigs is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "odinsigs_odinsigs,hls_ip_2021_1,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu9eg-ffvb1156-2-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.000000,HLS_SYN_LAT=2,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=623,HLS_SYN_LUT=510,HLS_VERSION=2021_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_start : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_ready : STD_LOGIC;
    signal addr_o_1_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal addr_o_1_vld_reg : STD_LOGIC := '0';
    signal addr_o_1_vld_in : STD_LOGIC;
    signal addr_o_1_ack_in : STD_LOGIC;
    signal req_o_1_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal req_o_1_vld_reg : STD_LOGIC := '0';
    signal req_o_1_vld_in : STD_LOGIC;
    signal req_o_1_ack_in : STD_LOGIC;
    signal ack_o : STD_LOGIC_VECTOR (31 downto 0);
    signal ack_o_0_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ack_o_0_vld_reg : STD_LOGIC := '0';
    signal ack_o_0_ack_out : STD_LOGIC;
    signal AEROUT_ADDR_0_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal AEROUT_ADDR_0_vld_reg : STD_LOGIC := '0';
    signal AEROUT_ADDR_0_ack_out : STD_LOGIC;
    signal AEROUT_REQ_0_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal AEROUT_REQ_0_vld_reg : STD_LOGIC := '0';
    signal AEROUT_REQ_0_ack_out : STD_LOGIC;
    signal AEROUT_ACK_1_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal AEROUT_ACK_1_vld_reg : STD_LOGIC := '0';
    signal AEROUT_ACK_1_vld_in : STD_LOGIC;
    signal AEROUT_ACK_1_ack_in : STD_LOGIC;
    signal writeloc : STD_LOGIC_VECTOR (31 downto 0);
    signal pop_n_1_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal pop_n_1_vld_reg : STD_LOGIC := '0';
    signal pop_n_1_vld_in : STD_LOGIC;
    signal pop_n_1_ack_in : STD_LOGIC;
    signal postneuron_1_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal postneuron_1_vld_reg : STD_LOGIC := '0';
    signal postneuron_1_vld_in : STD_LOGIC;
    signal postneuron_1_ack_in : STD_LOGIC;
    signal CTRL_SCHED_POP_N_0_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal CTRL_SCHED_POP_N_0_vld_reg : STD_LOGIC := '0';
    signal CTRL_SCHED_POP_N_0_ack_out : STD_LOGIC;
    signal CTRL_NEURMEM_ADDR_0_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal CTRL_NEURMEM_ADDR_0_vld_reg : STD_LOGIC := '0';
    signal CTRL_NEURMEM_ADDR_0_ack_out : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_block_state3 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;
    signal ap_return : STD_LOGIC_VECTOR (31 downto 0);

    component odinsigs_control_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC;
        ap_return : IN STD_LOGIC_VECTOR (31 downto 0);
        addr_o : IN STD_LOGIC_VECTOR (31 downto 0);
        addr_o_ap_vld : IN STD_LOGIC;
        req_o : IN STD_LOGIC_VECTOR (31 downto 0);
        req_o_ap_vld : IN STD_LOGIC;
        ack_o : OUT STD_LOGIC_VECTOR (31 downto 0);
        writeloc : OUT STD_LOGIC_VECTOR (31 downto 0);
        pop_n : IN STD_LOGIC_VECTOR (31 downto 0);
        pop_n_ap_vld : IN STD_LOGIC;
        postneuron : IN STD_LOGIC_VECTOR (31 downto 0);
        postneuron_ap_vld : IN STD_LOGIC );
    end component;



begin
    control_s_axi_U : component odinsigs_control_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CONTROL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CONTROL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_control_AWVALID,
        AWREADY => s_axi_control_AWREADY,
        AWADDR => s_axi_control_AWADDR,
        WVALID => s_axi_control_WVALID,
        WREADY => s_axi_control_WREADY,
        WDATA => s_axi_control_WDATA,
        WSTRB => s_axi_control_WSTRB,
        ARVALID => s_axi_control_ARVALID,
        ARREADY => s_axi_control_ARREADY,
        ARADDR => s_axi_control_ARADDR,
        RVALID => s_axi_control_RVALID,
        RREADY => s_axi_control_RREADY,
        RDATA => s_axi_control_RDATA,
        RRESP => s_axi_control_RRESP,
        BVALID => s_axi_control_BVALID,
        BREADY => s_axi_control_BREADY,
        BRESP => s_axi_control_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle,
        ap_return => ap_const_lv32_1,
        addr_o => addr_o_1_data_reg,
        addr_o_ap_vld => addr_o_1_vld_reg,
        req_o => req_o_1_data_reg,
        req_o_ap_vld => req_o_1_vld_reg,
        ack_o => ack_o,
        writeloc => writeloc,
        pop_n => pop_n_1_data_reg,
        pop_n_ap_vld => pop_n_1_vld_reg,
        postneuron => postneuron_1_data_reg,
        postneuron_ap_vld => postneuron_1_vld_reg);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    AEROUT_ACK_1_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    AEROUT_ADDR_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    AEROUT_REQ_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    CTRL_NEURMEM_ADDR_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    CTRL_SCHED_POP_N_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    ack_o_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;

    addr_o_1_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_0 = addr_o_1_vld_reg) and (ap_const_logic_1 = addr_o_1_vld_in))) then 
                addr_o_1_vld_reg <= ap_const_logic_1;
            elsif (((ap_const_logic_0 = addr_o_1_vld_in) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = addr_o_1_vld_reg))) then 
                addr_o_1_vld_reg <= ap_const_logic_0;
            end if; 
        end if;
    end process;

    pop_n_1_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (pop_n_1_vld_in = ap_const_logic_1) and (pop_n_1_vld_reg = ap_const_logic_0))) then 
                pop_n_1_vld_reg <= ap_const_logic_1;
            elsif (((ap_const_logic_1 = ap_const_logic_1) and (pop_n_1_vld_in = ap_const_logic_0) and (pop_n_1_vld_reg = ap_const_logic_1))) then 
                pop_n_1_vld_reg <= ap_const_logic_0;
            end if; 
        end if;
    end process;

    postneuron_1_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (postneuron_1_vld_in = ap_const_logic_1) and (postneuron_1_vld_reg = ap_const_logic_0))) then 
                postneuron_1_vld_reg <= ap_const_logic_1;
            elsif (((ap_const_logic_1 = ap_const_logic_1) and (postneuron_1_vld_in = ap_const_logic_0) and (postneuron_1_vld_reg = ap_const_logic_1))) then 
                postneuron_1_vld_reg <= ap_const_logic_0;
            end if; 
        end if;
    end process;

    req_o_1_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (req_o_1_vld_in = ap_const_logic_1) and (req_o_1_vld_reg = ap_const_logic_0))) then 
                req_o_1_vld_reg <= ap_const_logic_1;
            elsif (((ap_const_logic_1 = ap_const_logic_1) and (req_o_1_vld_in = ap_const_logic_0) and (req_o_1_vld_reg = ap_const_logic_1))) then 
                req_o_1_vld_reg <= ap_const_logic_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = AEROUT_ACK_1_vld_in) and (ap_const_logic_1 = AEROUT_ACK_1_vld_reg)) or (not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_0 = AEROUT_ACK_1_vld_reg) and (ap_const_logic_1 = AEROUT_ACK_1_vld_in)))) then
                AEROUT_ACK_1_data_reg <= ack_o_0_data_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = AEROUT_ADDR_0_ack_out) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = AEROUT_ADDR_0_vld_reg)) or (not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_0 = AEROUT_ADDR_0_vld_reg) and (ap_const_logic_1 = ap_const_logic_1)))) then
                AEROUT_ADDR_0_data_reg <= AEROUT_ADDR;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = AEROUT_REQ_0_ack_out) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = AEROUT_REQ_0_vld_reg)) or (not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_0 = AEROUT_REQ_0_vld_reg) and (ap_const_logic_1 = ap_const_logic_1)))) then
                AEROUT_REQ_0_data_reg <= AEROUT_REQ;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = CTRL_NEURMEM_ADDR_0_ack_out) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = CTRL_NEURMEM_ADDR_0_vld_reg)) or (not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_0 = CTRL_NEURMEM_ADDR_0_vld_reg) and (ap_const_logic_1 = ap_const_logic_1)))) then
                CTRL_NEURMEM_ADDR_0_data_reg <= CTRL_NEURMEM_ADDR;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = CTRL_SCHED_POP_N_0_ack_out) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = CTRL_SCHED_POP_N_0_vld_reg)) or (not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_0 = CTRL_SCHED_POP_N_0_vld_reg) and (ap_const_logic_1 = ap_const_logic_1)))) then
                CTRL_SCHED_POP_N_0_data_reg <= CTRL_SCHED_POP_N;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ack_o_0_ack_out) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = ack_o_0_vld_reg)) or (not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_0 = ack_o_0_vld_reg) and (ap_const_logic_1 = ap_const_logic_1)))) then
                ack_o_0_data_reg <= ack_o;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = addr_o_1_vld_in) and (ap_const_logic_1 = addr_o_1_vld_reg)) or (not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_0 = addr_o_1_vld_reg) and (ap_const_logic_1 = addr_o_1_vld_in)))) then
                addr_o_1_data_reg <= AEROUT_ADDR_0_data_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_const_logic_1) and (pop_n_1_vld_in = ap_const_logic_1) and (pop_n_1_vld_reg = ap_const_logic_1)) or (not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (pop_n_1_vld_in = ap_const_logic_1) and (pop_n_1_vld_reg = ap_const_logic_0)))) then
                pop_n_1_data_reg <= CTRL_SCHED_POP_N_0_data_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_const_logic_1) and (postneuron_1_vld_in = ap_const_logic_1) and (postneuron_1_vld_reg = ap_const_logic_1)) or (not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (postneuron_1_vld_in = ap_const_logic_1) and (postneuron_1_vld_reg = ap_const_logic_0)))) then
                postneuron_1_data_reg <= CTRL_NEURMEM_ADDR_0_data_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_const_logic_1) and (req_o_1_vld_in = ap_const_logic_1) and (req_o_1_vld_reg = ap_const_logic_1)) or (not(((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) and (req_o_1_vld_in = ap_const_logic_1) and (req_o_1_vld_reg = ap_const_logic_0)))) then
                req_o_1_data_reg <= AEROUT_REQ_0_data_reg;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, addr_o_1_ack_in, req_o_1_ack_in, AEROUT_ACK_1_ack_in, pop_n_1_ack_in, postneuron_1_ack_in, ap_CS_fsm_state3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                if ((not(((req_o_1_ack_in = ap_const_logic_0) or (ap_const_logic_0 = addr_o_1_ack_in) or (ap_const_logic_0 = AEROUT_ACK_1_ack_in) or (postneuron_1_ack_in = ap_const_logic_0) or (pop_n_1_ack_in = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    AEROUT_ACK <= AEROUT_ACK_1_data_reg;

    AEROUT_ACK_1_ack_in_assign_proc : process(AEROUT_ACK_1_vld_reg)
    begin
        if (((ap_const_logic_0 = AEROUT_ACK_1_vld_reg) or ((ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = AEROUT_ACK_1_vld_reg)))) then 
            AEROUT_ACK_1_ack_in <= ap_const_logic_1;
        else 
            AEROUT_ACK_1_ack_in <= ap_const_logic_0;
        end if; 
    end process;


    AEROUT_ACK_1_vld_in_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            AEROUT_ACK_1_vld_in <= ap_const_logic_1;
        else 
            AEROUT_ACK_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;


    AEROUT_ADDR_0_ack_out_assign_proc : process(addr_o_1_ack_in, req_o_1_ack_in, AEROUT_ACK_1_ack_in, pop_n_1_ack_in, postneuron_1_ack_in, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (not(((req_o_1_ack_in = ap_const_logic_0) or (ap_const_logic_0 = addr_o_1_ack_in) or (ap_const_logic_0 = AEROUT_ACK_1_ack_in) or (postneuron_1_ack_in = ap_const_logic_0) or (pop_n_1_ack_in = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            AEROUT_ADDR_0_ack_out <= ap_const_logic_1;
        else 
            AEROUT_ADDR_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    AEROUT_REQ_0_ack_out_assign_proc : process(addr_o_1_ack_in, req_o_1_ack_in, AEROUT_ACK_1_ack_in, pop_n_1_ack_in, postneuron_1_ack_in, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (not(((req_o_1_ack_in = ap_const_logic_0) or (ap_const_logic_0 = addr_o_1_ack_in) or (ap_const_logic_0 = AEROUT_ACK_1_ack_in) or (postneuron_1_ack_in = ap_const_logic_0) or (pop_n_1_ack_in = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            AEROUT_REQ_0_ack_out <= ap_const_logic_1;
        else 
            AEROUT_REQ_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    CTRL_NEURMEM_ADDR_0_ack_out_assign_proc : process(addr_o_1_ack_in, req_o_1_ack_in, AEROUT_ACK_1_ack_in, pop_n_1_ack_in, postneuron_1_ack_in, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (not(((req_o_1_ack_in = ap_const_logic_0) or (ap_const_logic_0 = addr_o_1_ack_in) or (ap_const_logic_0 = AEROUT_ACK_1_ack_in) or (postneuron_1_ack_in = ap_const_logic_0) or (pop_n_1_ack_in = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            CTRL_NEURMEM_ADDR_0_ack_out <= ap_const_logic_1;
        else 
            CTRL_NEURMEM_ADDR_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    CTRL_SCHED_POP_N_0_ack_out_assign_proc : process(addr_o_1_ack_in, req_o_1_ack_in, AEROUT_ACK_1_ack_in, pop_n_1_ack_in, postneuron_1_ack_in, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (not(((req_o_1_ack_in = ap_const_logic_0) or (ap_const_logic_0 = addr_o_1_ack_in) or (ap_const_logic_0 = AEROUT_ACK_1_ack_in) or (postneuron_1_ack_in = ap_const_logic_0) or (pop_n_1_ack_in = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            CTRL_SCHED_POP_N_0_ack_out <= ap_const_logic_1;
        else 
            CTRL_SCHED_POP_N_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    ack_o_0_ack_out_assign_proc : process(addr_o_1_ack_in, req_o_1_ack_in, AEROUT_ACK_1_ack_in, pop_n_1_ack_in, postneuron_1_ack_in, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (not(((req_o_1_ack_in = ap_const_logic_0) or (ap_const_logic_0 = addr_o_1_ack_in) or (ap_const_logic_0 = AEROUT_ACK_1_ack_in) or (postneuron_1_ack_in = ap_const_logic_0) or (pop_n_1_ack_in = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            ack_o_0_ack_out <= ap_const_logic_1;
        else 
            ack_o_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    addr_o_1_ack_in_assign_proc : process(addr_o_1_vld_reg)
    begin
        if (((ap_const_logic_0 = addr_o_1_vld_reg) or ((ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = addr_o_1_vld_reg)))) then 
            addr_o_1_ack_in <= ap_const_logic_1;
        else 
            addr_o_1_ack_in <= ap_const_logic_0;
        end if; 
    end process;


    addr_o_1_vld_in_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            addr_o_1_vld_in <= ap_const_logic_1;
        else 
            addr_o_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(addr_o_1_ack_in, req_o_1_ack_in, AEROUT_ACK_1_ack_in, pop_n_1_ack_in, postneuron_1_ack_in)
    begin
        if (((req_o_1_ack_in = ap_const_logic_0) or (ap_const_logic_0 = addr_o_1_ack_in) or (ap_const_logic_0 = AEROUT_ACK_1_ack_in) or (postneuron_1_ack_in = ap_const_logic_0) or (pop_n_1_ack_in = ap_const_logic_0))) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state3_assign_proc : process(addr_o_1_ack_in, req_o_1_ack_in, AEROUT_ACK_1_ack_in, pop_n_1_ack_in, postneuron_1_ack_in)
    begin
                ap_block_state3 <= ((req_o_1_ack_in = ap_const_logic_0) or (ap_const_logic_0 = addr_o_1_ack_in) or (ap_const_logic_0 = AEROUT_ACK_1_ack_in) or (postneuron_1_ack_in = ap_const_logic_0) or (pop_n_1_ack_in = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(addr_o_1_ack_in, req_o_1_ack_in, AEROUT_ACK_1_ack_in, pop_n_1_ack_in, postneuron_1_ack_in, ap_CS_fsm_state3)
    begin
        if ((not(((req_o_1_ack_in = ap_const_logic_0) or (ap_const_logic_0 = addr_o_1_ack_in) or (ap_const_logic_0 = AEROUT_ACK_1_ack_in) or (postneuron_1_ack_in = ap_const_logic_0) or (pop_n_1_ack_in = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(addr_o_1_ack_in, req_o_1_ack_in, AEROUT_ACK_1_ack_in, pop_n_1_ack_in, postneuron_1_ack_in, ap_CS_fsm_state3)
    begin
        if ((not(((req_o_1_ack_in = ap_const_logic_0) or (ap_const_logic_0 = addr_o_1_ack_in) or (ap_const_logic_0 = AEROUT_ACK_1_ack_in) or (postneuron_1_ack_in = ap_const_logic_0) or (pop_n_1_ack_in = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    pop_n_1_ack_in_assign_proc : process(pop_n_1_vld_reg)
    begin
        if (((pop_n_1_vld_reg = ap_const_logic_0) or ((ap_const_logic_1 = ap_const_logic_1) and (pop_n_1_vld_reg = ap_const_logic_1)))) then 
            pop_n_1_ack_in <= ap_const_logic_1;
        else 
            pop_n_1_ack_in <= ap_const_logic_0;
        end if; 
    end process;


    pop_n_1_vld_in_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            pop_n_1_vld_in <= ap_const_logic_1;
        else 
            pop_n_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;


    postneuron_1_ack_in_assign_proc : process(postneuron_1_vld_reg)
    begin
        if (((postneuron_1_vld_reg = ap_const_logic_0) or ((ap_const_logic_1 = ap_const_logic_1) and (postneuron_1_vld_reg = ap_const_logic_1)))) then 
            postneuron_1_ack_in <= ap_const_logic_1;
        else 
            postneuron_1_ack_in <= ap_const_logic_0;
        end if; 
    end process;


    postneuron_1_vld_in_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            postneuron_1_vld_in <= ap_const_logic_1;
        else 
            postneuron_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;


    req_o_1_ack_in_assign_proc : process(req_o_1_vld_reg)
    begin
        if (((req_o_1_vld_reg = ap_const_logic_0) or ((ap_const_logic_1 = ap_const_logic_1) and (req_o_1_vld_reg = ap_const_logic_1)))) then 
            req_o_1_ack_in <= ap_const_logic_1;
        else 
            req_o_1_ack_in <= ap_const_logic_0;
        end if; 
    end process;


    req_o_1_vld_in_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            req_o_1_vld_in <= ap_const_logic_1;
        else 
            req_o_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

end behav;