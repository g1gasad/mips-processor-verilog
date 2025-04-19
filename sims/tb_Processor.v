module tb_Processor();

reg rst;
reg [2:0] pc;
//wire [15:0] aluResult;
wire [15:0] data1;
wire zero_flag;
wire [2:0] rdReg_addr1, rdReg_addr2;
Processor prcsr (rst, pc, zero_flag, data1, rdReg_addr1, rdReg_addr2);
//always #5 clk=~clk;

initial begin
$monitor("rdReg_addr1: %d | val: %d", rdReg_addr1, data1);
rst=1; #10;
rst=0; 
//pc=3'd0; #50; // exp res = 18
//pc=3'd1; #50; // exp res = 10
//pc=3'd2; #50; // exp res = 4
//pc=3'd3; #50; // exp res = 14
pc=3'd5; #50; // res = 100
pc=3'd4; #50; // exp res = 0
$finish;
end
endmodule
