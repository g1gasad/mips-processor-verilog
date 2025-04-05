module ALU(a, b, sig_alu_control, result, sig_zero);
input [15:0] a, b;
input [2:0] sig_alu_control;
output reg [15:0] result;
output reg sig_zero;

always@(*) begin
case(sig_alu_control)
	3'b000: result=a+b;    // add result, a, b
	3'b001: result=a-b;    // sub result, a, b
	3'b010: result=a&b;    // and result, a, b
	3'b011: result=a|b;    // or result, a, b
	3'b100: // this is for slt: set on less than
		if (a<b) result=16'd1; // if a<b, result=1
		else result=16'd0;     // else, result=1
	default: result=a+b;
endcase
end

always@(result) begin // we have added this "sig_zero" param just
if (result==16'b0)    // to check when we get 0 as result
	sig_zero=1'b1;		  // if 0, zero will be 1, denoting 0's presence
else
	sig_zero=1'b0; end
endmodule
