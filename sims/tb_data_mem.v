module tb_data_mem();
reg rst, sig_mem_write, sig_mem_read;
reg [2:0] addr;
reg [15:0] write_data;
wire [15:0] read_data_out;
data_mem d_mem (rst, sig_mem_write, sig_mem_read, addr, write_data, read_data_out);

initial begin
rst=1; #10;
rst=0;
sig_mem_write=0; sig_mem_read=1; addr=3'b000; write_data=16'd55; #10; // E: 69
sig_mem_write=0; sig_mem_read=1; addr=3'b010; write_data=16'd55; #10; // 9
sig_mem_write=1; sig_mem_read=0; addr=3'b110; write_data=16'd55; #10; // write 55 at 6th
sig_mem_write=0; sig_mem_read=1; addr=3'b110; write_data=16'd55; #10; // read 6th
sig_mem_write=1; sig_mem_read=1; addr=3'b0; write_data=16'd55; #10;
sig_mem_write=0; sig_mem_read=0; addr=3'b0; write_data=16'd55; #10;
$finish;
end
endmodule
