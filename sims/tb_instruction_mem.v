module tb_instruction_mem();

reg [3:0] pc;
wire [15:0] instruction;
instruction_mem im (pc, instruction);

initial begin
pc=4'b0000; #10;
pc=4'b0001; #10;
pc=4'b0010; #10;
pc=4'b0011; #10;
pc=4'b1011; #10;
pc=4'b0111; #10;
$finish;
end
endmodule
