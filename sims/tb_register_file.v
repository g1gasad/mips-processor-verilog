module tb_register_file();

reg clk, sig_regWrite;
reg [2:0] rd_addr1, rd_addr2, wr_addr;
reg [15:0] wr_data;
wire [15:0] data1, data2;
register_file reg_file (clk, sig_regWrite, wr_addr, wr_data,
                    rd_addr1, rd_addr2, data1, data2);
always #5 clk=~clk;

initial begin
clk=0;
sig_regWrite=0; rd_addr1=3'b001; rd_addr2=3'b010;
			 wr_addr=3'b000; wr_data=16'd69; #10;
sig_regWrite=0; rd_addr1=3'b010; rd_addr2=3'b001;
			 wr_addr=3'b000; wr_data=16'd69; #10;
sig_regWrite=0; rd_addr1=3'b001; rd_addr2=3'b011;
			 wr_addr=3'b000; wr_data=16'd69; #10;
sig_regWrite=0; rd_addr1=3'b011; rd_addr2=3'b010;
			 wr_addr=3'b000; wr_data=16'd69; #10;
$finish;
end                  
endmodule
