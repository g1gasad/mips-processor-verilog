module tb_register_file();

reg regWrite;
reg [3:0] rdReg_addr1, rdReg_addr2, wrReg_addr;
reg [15:0] wr_data;
wire [15:0] data1, data2;
register_file rf (regWrite, wrReg_addr, wr_data,
                    rdReg_addr1, rdReg_addr2,
                    data1, data2);
initial begin
regWrite=0; rdReg_addr1=4'b0010; rdReg_addr2=4'b0000;
			 wrReg_addr=4'b0000; wr_data=16'd69; #10;
regWrite=1; rdReg_addr1=4'b0000; rdReg_addr2=4'b0000;
			 wrReg_addr=4'b0010; wr_data=16'd69; #10;
regWrite=0; rdReg_addr1=4'b0010; rdReg_addr2=4'b0000;
			 wrReg_addr=4'b0000; wr_data=16'd69; #10;
regWrite=1; rdReg_addr1=4'b0100; rdReg_addr2=4'b0000;
			 wrReg_addr=4'b0000; wr_data=16'd69; #10;
$finish;
end                  
endmodule
