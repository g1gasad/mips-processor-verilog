module register_file(sig_regWrite, wrReg_addr, wr_data,
                    rdReg_addr1, rdReg_addr2,
                    data1, data2);
input sig_regWrite;
input [2:0] rdReg_addr1, rdReg_addr2, wrReg_addr;
input [15:0] wr_data;
output reg [15:0] data1, data2;
reg [15:0] reg_file_ram [0:7];

initial begin
	reg_file_ram[0]  <= 16'b0000000000000001;
	reg_file_ram[1]  <= 16'b0000000000001110; // 14
	reg_file_ram[2]  <= 16'b0000000000000100; // 4
	reg_file_ram[3]  <= 16'b0000000001000101; // 69
	reg_file_ram[4]  <= 16'b0000000000000000;
	reg_file_ram[5]  <= 16'b0000000000000000;
	reg_file_ram[6]  <= 16'b0000000001000000;
	reg_file_ram[7]  <= 16'b0000000001000010;
end
always@(*) begin
	if (sig_regWrite)
		reg_file_ram[wrReg_addr] <= wr_data;
	else begin
		data1 <= reg_file_ram[rdReg_addr1];
		data2 <= reg_file_ram[rdReg_addr2]; end
end
endmodule
