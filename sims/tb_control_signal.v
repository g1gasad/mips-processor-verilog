module tb_control_signal();

reg rst;
reg [2:0] opcode;
wire [1:0] ALUop, regDst;
wire jump, branch, memRead, memtoReg, memWrite, ALUsrc, regWrite, sign_or_zero;
control_signal csig (rst, opcode, jump, branch, memRead, memtoReg,
                 memWrite, ALUsrc, regWrite, sign_or_zero,
                 ALUop, regDst);

initial begin
rst=1; #10;
rst=0;
opcode=3'b000; #10;
opcode=3'b001; #10;
opcode=3'b010; #10;
opcode=3'b011; #10;
opcode=3'b100; #10;
opcode=3'b001; #10;
$finish;
end                 
endmodule
