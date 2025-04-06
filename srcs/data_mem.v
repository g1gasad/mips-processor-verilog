module data_mem(rst, sig_mem_write, sig_mem_read, addr, write_data, read_data_out);
input rst, sig_mem_write, sig_mem_read;
input [2:0] addr;
input [15:0] write_data;
output reg [15:0] read_data_out;
reg [15:0] data_mem_block [0:7];
always@(*) begin
	if(rst) begin
		data_mem_block[0] <= 16'b0000000001000101;
		data_mem_block[1] <= 16'b0000000000000110;
		data_mem_block[2] <= 16'b0000000000001001;
		data_mem_block[3] <= 16'b0000000000000000;
		data_mem_block[4] <= 16'b0000000000000000;
		data_mem_block[5] <= 16'b0000000000000000;
		data_mem_block[6] <= 16'b0000000000000000;
		data_mem_block[7] <= 16'b0000000000000000;
		read_data_out 	  <= 16'bxxxxxxxxxxxxxxxx; end
	else begin
		if (addr<=3'b111) begin
			if (sig_mem_write==1'b1 && sig_mem_read==1'b0) begin
				data_mem_block[addr] <= write_data;
//				read_data_out <= 16'bxxxxxxxxxxxxxxxx;
			end
			else if (sig_mem_write==1'b0 && sig_mem_read==1'b1)
				read_data_out <= data_mem_block[addr];
			else
				read_data_out <= 16'bxxxxxxxxxxxxxxxx; 
		end
		else
			read_data_out <= 16'bxxxxxxxxxxxxxxxx;
	end 
end
endmodule
