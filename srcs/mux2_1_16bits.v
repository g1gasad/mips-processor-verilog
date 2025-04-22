`timescale 1ns / 1ps

module mux2_1_16bits(a, b, select, data_out);
input select;
input [15:0] a, b;
output reg [15:0] data_out;

always@(*) begin
if (select)
	data_out <= b;
else
	data_out <= a;
end

endmodule
