
all:
	vlog *.v
	vlog *.sv

test:
	vsim -c -do "run;exit" mult_tb
	vsim -c -do "run;exit" tb_top
