/* Generated by Yosys 0.9 (git sha1 1979e0b) */

module u1intou2(i_argA, o_result);
  input [1:0] i_argA;
  output [1:0] o_result;
  assign o_result[0] = i_argA[1] | i_argA[0];
  assign o_result[1] = 1'h0;
endmodule