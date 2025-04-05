module mux2_1_16bits(sig_ALUsrc, data2, immediateValue, data_out);
input sig_ALUsrc;
input [15:0] data2, immediateValue;
output reg [15:0] data_out;

always@(*) begin
if (sig_ALUsrc)
	data_out = data2;
else
	data_out = immediateValue;
end

endmodule
