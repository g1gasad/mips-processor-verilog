module tb_Processor();
reg rst, clk, pc_manual_override;
reg [2:0] manual_pc;
wire [15:0] data1;
wire [2:0] rdReg_addr1, rdReg_addr2;
wire zero_flag;

Processor prcsr (clk, rst, manual_pc,
				 pc_manual_override, zero_flag,
				 data1, rdReg_addr1, rdReg_addr2);
always #5 clk=~clk;

initial begin
clk=0; rst = 1; pc_manual_override = 0; manual_pc = 3'b000; #10;
rst = 0; #40;
//Exp results: 
pc_manual_override = 1; manual_pc = 3'b011; #10;

pc_manual_override = 0;
#30;
$finish;
end
endmodule