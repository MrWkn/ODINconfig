; ModuleID = 'D:/vitis_hls_projects/odinSignals/odinsig/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define i32 @apatb_odinsigs_ir(i32* %addr_o, i32* %req_o, i32* %ack_o, i32* %AEROUT_ADDR, i32* %AEROUT_REQ, i32* %AEROUT_ACK, i32* %writeloc, i32* %pop_n, i32* %postneuron, i32* %CTRL_SCHED_POP_N, i32* %CTRL_NEURMEM_ADDR, i32* %AEROUT_CTRL_BUSY) local_unnamed_addr #0 {
entry:
  %addr_o_copy = alloca i32, align 512
  %req_o_copy = alloca i32, align 512
  %ack_o_copy = alloca i32, align 512
  %AEROUT_ADDR_copy = alloca i32, align 512
  %AEROUT_REQ_copy = alloca i32, align 512
  %AEROUT_ACK_copy = alloca i32, align 512
  %writeloc_copy = alloca i32, align 512
  %pop_n_copy = alloca i32, align 512
  %postneuron_copy = alloca i32, align 512
  %CTRL_SCHED_POP_N_copy = alloca i32, align 512
  %CTRL_NEURMEM_ADDR_copy = alloca i32, align 512
  %AEROUT_CTRL_BUSY_copy = alloca i32, align 512
  call fastcc void @copy_in(i32* %addr_o, i32* nonnull align 512 %addr_o_copy, i32* %req_o, i32* nonnull align 512 %req_o_copy, i32* %ack_o, i32* nonnull align 512 %ack_o_copy, i32* %AEROUT_ADDR, i32* nonnull align 512 %AEROUT_ADDR_copy, i32* %AEROUT_REQ, i32* nonnull align 512 %AEROUT_REQ_copy, i32* %AEROUT_ACK, i32* nonnull align 512 %AEROUT_ACK_copy, i32* %writeloc, i32* nonnull align 512 %writeloc_copy, i32* %pop_n, i32* nonnull align 512 %pop_n_copy, i32* %postneuron, i32* nonnull align 512 %postneuron_copy, i32* %CTRL_SCHED_POP_N, i32* nonnull align 512 %CTRL_SCHED_POP_N_copy, i32* %CTRL_NEURMEM_ADDR, i32* nonnull align 512 %CTRL_NEURMEM_ADDR_copy, i32* %AEROUT_CTRL_BUSY, i32* nonnull align 512 %AEROUT_CTRL_BUSY_copy)
  %0 = call i32 @apatb_odinsigs_hw(i32* %addr_o_copy, i32* %req_o_copy, i32* %ack_o_copy, i32* %AEROUT_ADDR_copy, i32* %AEROUT_REQ_copy, i32* %AEROUT_ACK_copy, i32* %writeloc_copy, i32* %pop_n_copy, i32* %postneuron_copy, i32* %CTRL_SCHED_POP_N_copy, i32* %CTRL_NEURMEM_ADDR_copy, i32* %AEROUT_CTRL_BUSY_copy)
  call fastcc void @copy_out(i32* %addr_o, i32* nonnull align 512 %addr_o_copy, i32* %req_o, i32* nonnull align 512 %req_o_copy, i32* %ack_o, i32* nonnull align 512 %ack_o_copy, i32* %AEROUT_ADDR, i32* nonnull align 512 %AEROUT_ADDR_copy, i32* %AEROUT_REQ, i32* nonnull align 512 %AEROUT_REQ_copy, i32* %AEROUT_ACK, i32* nonnull align 512 %AEROUT_ACK_copy, i32* %writeloc, i32* nonnull align 512 %writeloc_copy, i32* %pop_n, i32* nonnull align 512 %pop_n_copy, i32* %postneuron, i32* nonnull align 512 %postneuron_copy, i32* %CTRL_SCHED_POP_N, i32* nonnull align 512 %CTRL_SCHED_POP_N_copy, i32* %CTRL_NEURMEM_ADDR, i32* nonnull align 512 %CTRL_NEURMEM_ADDR_copy, i32* %AEROUT_CTRL_BUSY, i32* nonnull align 512 %AEROUT_CTRL_BUSY_copy)
  ret i32 %0
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %1, i32* %0)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %3, i32* %2)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %5, i32* %4)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %7, i32* %6)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %9, i32* %8)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %11, i32* %10)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %13, i32* %12)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %15, i32* %14)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %17, i32* %16)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %19, i32* %18)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %21, i32* %20)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %23, i32* %22)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0i32(i32* noalias align 512, i32* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i32* %0, null
  %3 = icmp eq i32* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = bitcast i32* %0 to i8*
  %6 = bitcast i32* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0i32(i32* %0, i32* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %2, i32* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %4, i32* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %6, i32* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %8, i32* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %10, i32* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %12, i32* align 512 %13)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %14, i32* align 512 %15)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %16, i32* align 512 %17)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %18, i32* align 512 %19)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %20, i32* align 512 %21)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %22, i32* align 512 %23)
  ret void
}

declare i32 @apatb_odinsigs_hw(i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*)

define i32 @odinsigs_hw_stub_wrapper(i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*) #5 {
entry:
  call void @copy_out(i32* null, i32* %0, i32* null, i32* %1, i32* null, i32* %2, i32* null, i32* %3, i32* null, i32* %4, i32* null, i32* %5, i32* null, i32* %6, i32* null, i32* %7, i32* null, i32* %8, i32* null, i32* %9, i32* null, i32* %10, i32* null, i32* %11)
  %12 = call i32 @odinsigs_hw_stub(i32* %0, i32* %1, i32* %2, i32* %3, i32* %4, i32* %5, i32* %6, i32* %7, i32* %8, i32* %9, i32* %10, i32* %11)
  call void @copy_in(i32* null, i32* %0, i32* null, i32* %1, i32* null, i32* %2, i32* null, i32* %3, i32* null, i32* %4, i32* null, i32* %5, i32* null, i32* %6, i32* null, i32* %7, i32* null, i32* %8, i32* null, i32* %9, i32* null, i32* %10, i32* null, i32* %11)
  ret i32 %12
}

declare i32 @odinsigs_hw_stub(i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
