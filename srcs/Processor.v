//module Processor(rst, pc, alu_output, zero_flag);
module Processor(rst, pc, zero_flag);
input rst;
input [2:0] pc;
wire [15:0] instruction;
wire [1:0] sig_ALUop;
wire sig_regDst, sig_jump, sig_branch, sig_memRead, sig_memtoReg,
	 sig_memWrite, sig_ALUsrc, sig_regWrite, sign_or_zero;
//wire [2:0] mux_wrReg_addr;
wire [15:0] data1, data2;
//wire [3:0] func;
wire [2:0] sig_alu_control;
wire [2:0] alu_out_addr;
//wire [15:0] write_data_mem;
//output reg [15:0] read_data_out;
wire [15:0] alu_output;
output zero_flag;

instruction_mem ins_mem (pc, instruction);

control_signal c_sig (rst, instruction[15:13], sig_ALUop, sig_regDst, sig_jump,
					 sig_branch, sig_memRead, sig_memtoReg, sig_memWrite,
					 sig_ALUsrc, sig_regWrite, sign_or_zero);

//mux2_1_3bits mux1 (rdReg_addr2, wrReg_addr, sig_regDst, mux_wrReg_addr);

register_file regf (.sig_regWrite(sig_regWrite), .wrReg_addr(instruction[6:4]),
		 		.wr_data(alu_output), .rdReg_addr1(instruction[12:10]),
		 		.rdReg_addr2(instruction[9:7]), .data1(data1), .data2(data2));
//mux2_1_16bits mux2 (data2, sig_ALUsrc, )
ALUcontrol alucon (sig_ALUop, instruction[3:0], sig_alu_control);

ALU alu_mod (data1, data2, sig_alu_control, alu_output, zero_flag);

//data_mem dm (.rst(rst), .sig_memWrite(sig_memWrite), .sig_memRead(sig_memRead),
//	 .addr(alu_output[2:0]), .write_data(data2), .read_data_out(read_data_out));

endmodule
