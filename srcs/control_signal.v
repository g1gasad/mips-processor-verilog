module control_signal(rst, opcode, ALUop, regDst, jump, branch, memRead, memtoReg, memWrite,
		   ALUsrc, regWrite, sign_or_zero);
input rst;
input [2:0] opcode;
output reg [1:0] ALUop;
output reg regDst, jump, branch, memRead, memtoReg, memWrite,
		   ALUsrc, regWrite, sign_or_zero;
always@(*) begin
if (rst==1'b1) begin
	ALUop <= 2'b00;
	regDst <= 1'b0;
    jump <= 1'b0;
    branch <= 1'b0;
    memRead <= 1'b0;
    memtoReg <= 1'b0;
    memWrite <= 1'b0;
    ALUsrc <= 1'b0;
    regWrite <= 1'b0;
    sign_or_zero <= 1'b1; end 
else begin
case(opcode)
3'b000: begin // add, sub, and, or
		regDst <= 1'b1;
		jump <= 1'b0;
		branch <= 1'b0;
        memRead <= 1'b0;
        memtoReg <= 1'b0;
        ALUop <= 2'b00;
		memWrite <= 1'b0;
        ALUsrc <= 1'b0;
        regWrite <= 1'b1;
        
        sign_or_zero <= 1'b1; end
        
3'b001: begin // slti
        ALUop <= 2'b00;
        regDst <= 2'b01;
        jump <= 1'b0;
        branch <= 1'b1;
        memRead <= 1'b0;
        memtoReg <= 1'b0;
        memWrite <= 1'b0;
        ALUsrc <= 1'b0;
        regWrite <= 1'b0;
        sign_or_zero <= 1'b0; end
                
3'b010: begin // j
        ALUop <= 2'b01;
        regDst <= 2'b00;
        jump <= 1'b1;
        branch <= 1'b0;
        memRead <= 1'b0;
        memtoReg <= 1'b0;
        memWrite <= 1'b0;
        ALUsrc <= 1'b0;
        regWrite <= 1'b0;
        sign_or_zero <= 1'b1; end
                
3'b011: begin // jal
        ALUop <= 2'b01;
        regDst <= 2'b01;
        jump <= 1'b1;
        branch <= 1'b0;
        memRead <= 1'b0;
        memtoReg <= 1'b1;
        memWrite <= 1'b0;
        ALUsrc <= 1'b0;
        regWrite <= 1'b1;
        sign_or_zero <= 1'b1; end
                
3'b100: begin // lw
        ALUop <= 2'b10;
        regDst <= 2'b00;
        jump <= 1'b0;
        branch <= 1'b0;
        memRead <= 1'b1;
        memtoReg <= 1'b1;
        memWrite <= 1'b0;
        ALUsrc <= 1'b1;
        regWrite <= 1'b1;
        sign_or_zero <= 1'b1; end
                
3'b101: begin // sw 
        ALUop <= 2'b10;
        regDst <= 2'b01;
        jump <= 1'b0;
        branch <= 1'b0;
        memRead <= 1'b0;
        memtoReg <= 1'b0;
        memWrite <= 1'b0;
        ALUsrc <= 1'b0;
        regWrite <= 1'b0;
        sign_or_zero <= 1'b1; end
                
3'b110: begin // beq
        ALUop <= 2'b11;
        regDst <= 2'b00;
        jump <= 1'b0;
        branch <= 1'b0;
        memRead <= 1'b0;
        memtoReg <= 1'b0;
        memWrite <= 1'b0;
        ALUsrc <= 1'b0;
        regWrite <= 1'b0;
        sign_or_zero <= 1'b1; end
                
3'b111: begin // addi
        ALUop <= 2'b11;
        regDst <= 2'b01;
        jump <= 1'b0;
        branch <= 1'b0;
        memRead <= 1'b0;
        memtoReg <= 1'b0;
        memWrite <= 1'b0;
        ALUsrc <= 1'b1;
        regWrite <= 1'b1;
        sign_or_zero <= 1'b1; end
                
default: begin
        ALUop <= 2'b00;
        regDst <= 2'b00;
        jump <= 1'b0;
        branch <= 1'b0;
        memRead <= 1'b0;
        memtoReg <= 1'b0;
        memWrite <= 1'b0;
        ALUsrc <= 1'b0;
        regWrite <= 1'b0;
        sign_or_zero <= 1'b1; end
        
endcase
end
end

endmodule
