VLOG =  /tools/mentor/questasim/questasim/bin/vlog


VSIM = /tools/mentor/questasim/questasim/bin/vsim

all: comp_rtl comp run

comp_rtl:
	$(VLOG) +cover=bcstfex  /hwetools/work_area/frontend/Prasthuthi/uvm/FIFO_UVM_CODE/my_fifo.sv


comp: 
	$(VLOG) +incdir+/hwetools/work_area/frontend/Prasthuthi/uvm/FIFO_UVM_CODE/uvm-1.1d/src\
/hwetools/work_area/frontend/Prasthuthi/uvm/FIFO_UVM_CODE/uvm-1.1d/src/uvm_pkg.sv +define+UVM_NO_DPI fifo_top.sv  

run: 
	$(VSIM)   -coverage  -novopt fifo_top +UVM_TESTNAME=fifo_test -l vsim.log -c
       ##add wave -r 
