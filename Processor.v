//module Processor(rst, pc, alu_output, zero_flag);
module Processor(rst, pc, zero_flag);
input rst;
input [2:0] pc;
wire [15:0] instruction;
wire [1:0] sig_ALUop;
wire sig_regDst, sig_jump, sig_branch, sig_memRead, sig_memtoReg,
	 sig_memWrite, sig_ALUsrc, sig_regWrite, sign_or_zero;
wire [2:0] write_reg_addr;
wire [15:0] data1, data2;
//wire [3:0] func;
wire [2:0] sig_alu_control;
wire [2:0] alu_out_addr;
//wire [15:0] write_data_mem;
wire [15:0] read_data_out;
wire [15:0] alu_output;

output zero_flag;
wire [2:0] rdReg_addr2;
assign rdReg_addr2 = instruction[9:7];
instruction_mem ins_mem (pc, instruction);

control_signal c_sig (rst, instruction[15:13], sig_ALUop, sig_regDst, sig_jump,
					 sig_branch, sig_memRead, sig_memtoReg, sig_memWrite,
					 sig_ALUsrc, sig_regWrite, sign_or_zero);

mux2_1_3bits reg_dst (.rt(rdReg_addr2), .rd(instruction[6:4]), 
		.select(sig_regDst), .write_reg_addr(write_reg_addr));

register_file regf (.sig_regWrite(sig_regWrite), .wrReg_addr(write_reg_addr),
		 		.wr_data(alu_output), .rdReg_addr1(instruction[12:10]),
		 		.rdReg_addr2(rdReg_addr2), .data1(data1), .data2(data2));
//mux2_1_16bits mux2 (data2, sig_ALUsrc, )
ALUcontrol alucon (sig_ALUop, instruction[3:0], sig_alu_control);

ALU alu_mod (data1, data2, sig_alu_control, alu_output, zero_flag);

data_mem dm (.rst(rst), .sig_mem_write(sig_memWrite), .sig_mem_read(sig_memRead),
	 .addr(alu_output[2:0]), .write_data(data2), .read_data_out(read_data_out));

endmodule
