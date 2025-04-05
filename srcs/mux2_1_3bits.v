module mux2_1_3bits(sig_RegDst, rt, rd, write_reg);
input sig_RegDst;
input [2:0] rt, rd;
output reg [2:0] write_reg;

always@(*) begin
if (~sig_RegDst)
	write_reg = rt;
else
	write_reg = rd;
end

endmodule
