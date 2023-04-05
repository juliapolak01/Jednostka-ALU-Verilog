module u1intou2 (i_argA,
                //i_argB,
                o_result);

parameter BITS = 2;
input logic signed [BITS-1:0] i_argA;
//input logic signed [BITS 1:0] i_argB;
output logic signed [BITS-1:0] o_result;
//integer ;
always @(*)
    begin 
        if(i_argA[BITS-1] == 0)
        begin
            o_result = i_argA;
        end
        else    //(i_argA[BITS == 1])
        begin
            o_result = (i_argA >> 1);
        end
    end
endmodule



