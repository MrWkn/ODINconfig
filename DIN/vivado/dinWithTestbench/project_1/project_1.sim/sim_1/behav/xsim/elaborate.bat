@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Mon May 02 22:15:56 +0800 2022
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab -wto d3b18fe71a4b48818bfbe90a36a508e4 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L dist_mem_gen_v8_0_13 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot test_tb_behav xil_defaultlib.test_tb xil_defaultlib.glbl -log elaborate.log"
call xelab  -wto d3b18fe71a4b48818bfbe90a36a508e4 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L dist_mem_gen_v8_0_13 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot test_tb_behav xil_defaultlib.test_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0