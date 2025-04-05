module Processor(rst, pc, aluResult);
input rst;
input [2:0] pc;
wire [15:0] instruction;

wire [2:0] opcode = [15:13] instruction; // This is incorrect, use assing statement
wire [1:0] sig_ALUop;
wire sig_regDst, sig_jump, sig_branch, sig_memRead, sig_memtoReg, sig_memWrite,
		   sig_ALUsrc, sig_regWrite, sign_or_zero;

output reg [15:0] aluResult;

instruction_mem ins_mem (pc, instruction);

control_signal c_sig (rst, opcode, sig_ALUop, sig_regDst, sig_jump, sig_branch, sig_memRead,
                 sig_memtoReg, sig_memWrite, sig_ALUsrc, sig_regWrite, sign_or_zero);


endmodule
