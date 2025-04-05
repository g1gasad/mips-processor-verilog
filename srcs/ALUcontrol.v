module ALUcontrol(sig_ALUop, func, alu_control);
input [1:0] sig_ALUop;
input [3:0] func;
output reg [2:0] alu_control;
wire [5:0] ALUcontrolfn;

assign ALUcontrolfn = {sig_ALUop, func};

always@(ALUcontrolfn) begin
casex(ALUcontrolfn)
6'b11xxxx: alu_control=3'b000;
6'b10xxxx: alu_control=3'b001;
6'b01xxxx: alu_control=3'b010;
6'b000000: alu_control=3'b011;
6'b000001: alu_control=3'b000;
6'b000010: alu_control=3'b001;
6'b000011: alu_control=3'b010;
6'b000100: alu_control=3'b100;
default: alu_control=3'b000;
endcase
end

endmodule
