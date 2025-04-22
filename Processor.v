`timescale 1ns / 1ps

module Processor(clk, rst, manual_pc, pc_manual_override, zero_flag, data1, rdReg_addr1, rdReg_addr2);
input clk, rst, pc_manual_override;
input [2:0] manual_pc;
reg [2:0] pc;
wire [15:0] instruction;
wire [1:0] sig_ALUop;
wire sig_regDst, sig_jump, sig_branch, sig_memRead, sig_memtoReg,
	 sig_memWrite, sig_ALUsrc, sig_regWrite, sign_or_zero;
wire [2:0] write_reg_addr;
output [15:0] data1;
wire [15:0] data2, mux_alusrc_dataout;
wire [2:0] sig_alu_control;
wire [2:0] alu_out_addr;
wire [15:0] read_data_out;
wire [15:0] alu_output;
wire [15:0] zero_ext_imm;

output [2:0] rdReg_addr1, rdReg_addr2;
output zero_flag;
// Program Counter (PC) logic
always@(posedge clk or posedge rst) begin
    if (rst)
        pc <= 3'b000; // Reset PC to 0 on reset
    else if (pc_manual_override)
        pc <= manual_pc; // Override PC with manual value
    else
        pc <= pc + 1; // Increment PC (or modify based on control logic)
end

instruction_mem ins_mem (pc, instruction);

assign rdReg_addr1 = instruction[12:10],
	   rdReg_addr2 = instruction[9:7];
assign zero_ext_imm = {9'b000000000, instruction[6:0]};

control_signal c_sig (rst, instruction[15:13], sig_ALUop, sig_regDst, sig_jump,
					 sig_branch, sig_memRead, sig_memtoReg, sig_memWrite,
					 sig_ALUsrc, sig_regWrite, sign_or_zero);
					 
ALUcontrol alucon (sig_ALUop, instruction[3:0], sig_alu_control);

mux2_1_3bits reg_dst (.rt(rdReg_addr2), .rd(instruction[6:4]), 
		.select(sig_regDst), .write_reg_addr(write_reg_addr));

register_file regf (.clk(clk), .sig_regWrite(sig_regWrite), .wr_addr(write_reg_addr),
		 		.wr_data(alu_output), .rd_addr1(rdReg_addr1),
		 		.rd_addr2(rdReg_addr2), .data1(data1), .data2(data2));

mux2_1_16bits alu_src (.a(data2), .b(zero_ext_imm), .select(sig_ALUsrc),
		.data_out(mux_alusrc_dataout));

ALU alu_mod (data1, mux_alusrc_dataout, sig_alu_control, alu_output, zero_flag);

data_mem dm (.clk(clk), .sig_mem_write(sig_memWrite), .sig_mem_read(sig_memRead),
	 .addr(alu_output[2:0]), .write_data(data2), .read_data_out(read_data_out));

endmodule
