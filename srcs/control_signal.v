module control_signal(rst, opcode, sig_ALUop, sig_regDst, sig_jump, sig_branch, sig_memRead,
                 sig_memtoReg, sig_memWrite, sig_ALUsrc, sig_regWrite, sign_or_zero);
input rst;
input [2:0] opcode;
output reg [1:0] sig_ALUop;
output reg sig_regDst, sig_jump, sig_branch, sig_memRead, sig_memtoReg, sig_memWrite,
		   sig_ALUsrc, sig_regWrite, sign_or_zero;
always@(*) begin
if (rst==1'b1) begin
    sig_ALUop <= 2'b00;
    sig_regDst <= 1'b0;
    sig_jump <= 1'b0;
    sig_branch <= 1'b0;
    sig_memRead <= 1'b0;
    sig_memtoReg <= 1'b0;
    sig_memWrite <= 1'b0;
    sig_ALUsrc <= 1'b0;
    sig_regWrite <= 1'b0;
    sign_or_zero <= 1'b1; end 
else begin
case(opcode)
3'b000: begin // add, sub, and, or
	sig_regDst <= 1'b1;
	sig_jump <= 1'b0;
	sig_branch <= 1'b0;
        sig_memRead <= 1'b0;
        sig_memtoReg <= 1'b0;
        sig_ALUop <= 2'b00;
	sig_memWrite <= 1'b0;
        sig_ALUsrc <= 1'b0;
        sig_regWrite <= 1'b1;
        
        sign_or_zero <= 1'b1; end
        
3'b001: begin // slt
        sig_ALUop <= 2'b00;
        sig_regDst <= 1'b1;
        sig_jump <= 1'b0;
        sig_branch <= 1'b0;
        sig_memRead <= 1'b0;
        sig_memtoReg <= 1'b0;
        sig_memWrite <= 1'b0;
        sig_ALUsrc <= 1'b0;
        sig_regWrite <= 1'b1;
        sign_or_zero <= 1'b1; end
                
3'b010: begin // j
        sig_ALUop <= 2'b01;
        sig_regDst <= 1'b0;
        sig_jump <= 1'b1;
        sig_branch <= 1'b0;
        sig_memRead <= 1'b0;
        sig_memtoReg <= 1'b0;
        sig_memWrite <= 1'b0;
        sig_ALUsrc <= 1'b0;
        sig_regWrite <= 1'b0;
        sign_or_zero <= 1'b1; end
                
3'b011: begin // jal
        sig_ALUop <= 2'b01;
        sig_regDst <= 1'b1;
        sig_jump <= 1'b1;
        sig_branch <= 1'b0;
        sig_memRead <= 1'b0;
        sig_memtoReg <= 1'b1;
        sig_memWrite <= 1'b0;
        sig_ALUsrc <= 1'b0;
        sig_regWrite <= 1'b1;
        sign_or_zero <= 1'b1; end
                
3'b100: begin // lw
        sig_ALUop <= 2'b10;
        sig_regDst <= 1'b0;
        sig_jump <= 1'b0;
        sig_branch <= 1'b0;
        sig_memRead <= 1'b1;
        sig_memtoReg <= 1'b1;
        sig_memWrite <= 1'b0;
        sig_ALUsrc <= 1'b1;
        sig_regWrite <= 1'b1;
        sign_or_zero <= 1'b1; end
                
3'b101: begin // sw 
        sig_ALUop <= 2'b10;
        sig_regDst <= 1'b1;
        sig_jump <= 1'b0;
        sig_branch <= 1'b0;
        sig_memRead <= 1'b0;
        sig_memtoReg <= 1'b0;
        sig_memWrite <= 1'b0;
        sig_ALUsrc <= 1'b0;
        sig_regWrite <= 1'b0;
        sign_or_zero <= 1'b1; end
                
3'b110: begin // beq
        sig_ALUop <= 2'b11;
        sig_regDst <= 2'b00;
        sig_jump <= 1'b0;
        sig_branch <= 1'b0;
        sig_memRead <= 1'b0;
        sig_memtoReg <= 1'b0;
        sig_memWrite <= 1'b0;
        sig_ALUsrc <= 1'b0;
        sig_regWrite <= 1'b0;
        sign_or_zero <= 1'b1; end
                
3'b111: begin // addi
        sig_ALUop <= 2'b11;
        sig_regDst <= 1'b0;
        sig_jump <= 1'b0;
        sig_branch <= 1'b0;
        sig_memRead <= 1'b0;
        sig_memtoReg <= 1'b0;
        sig_memWrite <= 1'b0;
        sig_ALUsrc <= 1'b1;
        sig_regWrite <= 1'b1;
        sign_or_zero <= 1'b1; end
                
default: begin
        sig_ALUop <= 2'b00;
        sig_regDst <= 1'b0;
        sig_jump <= 1'b0;
        sig_branch <= 1'b0;
        sig_memRead <= 1'b0;
        sig_memtoReg <= 1'b0;
        sig_memWrite <= 1'b0;
        sig_ALUsrc <= 1'b0;
        sig_regWrite <= 1'b0;
        sign_or_zero <= 1'b1; end
        
endcase
end
end

endmodule
