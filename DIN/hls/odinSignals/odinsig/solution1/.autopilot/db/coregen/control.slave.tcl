dict set slaves control {ports {ap_start {type ap_ctrl width 1} ap_done {type ap_ctrl width 1} ap_ready {type ap_ctrl width 1} ap_idle {type ap_ctrl width 1} ap_return {type ap_return width 32} addr_o {type o_ap_vld width 32} req_o {type o_ap_vld width 32} ack_o {type i_ap_none width 32} writeloc {type i_ap_none width 32} pop_n {type o_ap_vld width 32} postneuron {type o_ap_vld width 32}} mems {} has_ctrl 1}
set datawidth 32