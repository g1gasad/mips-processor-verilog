module mux2_1_3bits(rt, rd, select, write_reg_addr);
input select;
input [2:0] rt, rd;
output reg [2:0] write_reg_addr;

always@(*) begin
if (~select)
	write_reg_addr <= rt;
else
	write_reg_addr <= rd;
end

endmodule
