module tb_mux2_1_3bit();

reg sig_RegDst;
reg [2:0] rt, rd;
wire [2:0] write_reg;
mux2_1_3bits mux (sig_RegDst, rt, rd, write_reg);

initial begin
rt=3'b001; rd=3'b111; sig_RegDst=0; #10; // expected: 1
rt=3'b001; rd=3'b111; sig_RegDst=1; #10; // expected: 7
rt=3'b001; rd=3'b111; sig_RegDst=0; #10; // expected: 1
rt=3'b001; rd=3'b111; sig_RegDst=1; #10; // expected: 7
$finish;
end
endmodule
