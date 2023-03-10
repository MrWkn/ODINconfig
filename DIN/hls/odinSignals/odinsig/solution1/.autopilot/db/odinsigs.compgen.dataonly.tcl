# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
ap_start {
	mailbox_input_ctrl 0
	mailbox_output_ctrl 0
	auto_restart_enabled 1
	auto_restart_counter_num 0
	auto_restart_counter_offset 16
	auto_restart_counter_size 32
}
ap_done { }
ap_ready { }
ap_idle { }
ap_return { 
	dir o
	width 32
	depth 1
	mode ap_ctrl_hs
	offset 16
	offset_end 0
}
addr_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 24
	offset_end 31
}
req_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 40
	offset_end 47
}
ack_o { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
writeloc { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 64
	offset_end 71
}
pop_n { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 72
	offset_end 79
}
postneuron { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 88
	offset_end 95
}
}
dict set axilite_register_dict control $port_control


