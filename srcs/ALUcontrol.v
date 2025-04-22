`timescale 1ns / 1ps
module ALUcontrol(sig_ALUop, func, sig_alu_control);
input [1:0] sig_ALUop;
input [3:0] func;
output reg [2:0] sig_alu_control;
wire [5:0] ALUcontrolfn;

assign ALUcontrolfn = {sig_ALUop, func};

always@(ALUcontrolfn) begin
casex(ALUcontrolfn)
6'b11xxxx: sig_alu_control=3'b000;
6'b10xxxx: sig_alu_control=3'b001;
6'b01xxxx: sig_alu_control=3'b010;
6'b000000: sig_alu_control=3'b000; // add
6'b000001: sig_alu_control=3'b001; // sub
6'b000010: sig_alu_control=3'b010; // and
6'b000011: sig_alu_control=3'b011; // or 
6'b000100: sig_alu_control=3'b100; // slt
default: sig_alu_control=3'b000;
endcase
end
endmodule