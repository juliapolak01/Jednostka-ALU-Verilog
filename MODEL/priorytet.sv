module dekoder_piorytetowy (i_argA, o_result);

parameter M = 8;

    input logic[M-1:0] i_argA;
    output logic [M-1:0] o_result;

integer i;
logic s;
always@(*)
begin
  s=0;
  o_result= '0;
  for(i=0; i<=M-1; i++)
  begin
    if(i_argA[i]==1'b1 & s==0)
    begin
      o_result=M-1;
      s=1;
    end
  end
end
endmodule
            
            
