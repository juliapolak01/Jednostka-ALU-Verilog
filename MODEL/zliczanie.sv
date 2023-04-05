module zliczanie_1 (i_argA, i_argB, o_result);

parameter BITS = 2;
parameter LEN = BITS*2;
logic [BITS-1:0] licz;
input logic signed [BITS-1:0] i_argA, i_argB;
output logic [BITS-1:0] o_result;
logic [BITS-1:0] wynik;
integer i;

always_comb 
    begin
    wynik = '0;
    licz = {i_argA, i_argB};
        for ( i=0; i<BITS; i=i+1)
        begin 
            if (licz[i]==1)
            begin
                wynik=wynik+1'b1;
            end
        end
        o_result=wynik;
    end
endmodule
