module wskaznik_BF (i_argA, o_BF1);
    
    parameter BITS = 2;
    input logic [BITS-1:0] i_argA;
    output logic o_BF1;
    integer i;
    localparam integer s_BF1 = '0;
    always_comb
    begin
        for (i=1; i<BITS; i++)
        begin
            if (i_argA[i] == 1)
                s_BF1=s_BF1+1'b1;
            
        end
        if(s_BF1 == 1'b1)
            o_BF1 = s_BF1;
        else
            o_BF1 = '0;
    end
endmodule