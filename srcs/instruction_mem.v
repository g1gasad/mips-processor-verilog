module instruction_mem(pc, instruction);
input [2:0] pc;
output reg [15:0] instruction;
reg [15:0] instn_memory [0:7];

initial begin
// Bitwise Distribution:     3   3   3   3    4   = 16 total bits
//                          op  rs  rt  rd  func
	instn_memory[0]  <= 16'b000_001_010_000_0000; // add r0, r1, r2
	instn_memory[1]  <= 16'b000_001_010_000_0001; // sub r0, r1, r2
	instn_memory[2]  <= 16'b000_001_010_000_0010; // and r0, r1, r2
	instn_memory[3]  <= 16'b000_001_010_000_0011; // or  r0, r1, r2
	instn_memory[4]  <= 16'b001_001_010_000_0100; // slt
	instn_memory[5]  <= 16'b000_000_000_000_0000;
	instn_memory[6]  <= 16'b000_000_000_000_0000;
	instn_memory[7]  <= 16'b000_000_000_000_0000;
//	instn_memory[8]  <= 16'b000_000_000_000_0000;
//	instn_memory[9]  <= 16'b000_000_000_000_0000;
//	instn_memory[10] <= 16'b000_000_000_000_0000;
//	instn_memory[11] <= 16'b000_000_000_000_0000;
//	instn_memory[12] <= 16'b000_000_000_000_0000;
//	instn_memory[13] <= 16'b000_000_000_000_0000;
//	instn_memory[14] <= 16'b000_000_000_000_0000;
//	instn_memory[15] <= 16'b000_000_000_000_0000;
end
always@(*) begin
	instruction <= instn_memory[pc]; end
endmodule