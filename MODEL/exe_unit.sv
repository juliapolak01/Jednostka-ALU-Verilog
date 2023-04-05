module exe_unit (i_argB,
    i_argA,
    i_oper,
    o_result,
    o_VF,
    o_ZF,
    o_PF,
    o_BF
    
);


parameter M = 8;
parameter N = 4;
input logic [M-1:0] i_argA, i_argB;
input logic [N-1:0] i_oper;
output logic [M-1:0] o_result;
logic [M-1:0] s_gray, s_crc4, s_u1intou2, s_licz1, s_term, s_priorytet, s_crc3;
output logic o_VF, o_ZF, o_PF, o_BF; 
integer jedynki;
integer i;

u2intoGray#(.BITS(M)) u2intoGray(.i_data(i_argA), .o_gray(s_gray));
u1intou2#(.BITS(M)) u1intou2(.i_argA(i_argA), .o_result(s_u1intou2));
crc4_eval#(.WCODE(M), .WPOLY(4)) crc4_eval(.i_data(i_argA), .i_poly(i_argB[3:0]), .i_crc(3'b000), .o_crc(s_crc4));
crc3_eval#(.WCODE(M), .WPOLY(4)) crc3_eval(.i_data(i_argA), .i_poly(i_argB[3:0]), .i_crc(3'b000), .o_crc(s_crc3));
zliczanie_1#(.BITS(M)) zliczanie(.i_argA(i_argA), .i_argB(i_argB), .o_result(s_licz1));
thermometer2U2#(.LEN(M)) termometr(.i_argA(i_argA), .o_result(s_term));
dekoder_piorytetowy#(.M(M)) dekoder_piorytetowy(.i_argA(i_argA), .o_result(s_priorytet));



always_comb begin : main

    o_BF = 0;
    o_VF = 0;
    o_ZF = 0;
    o_PF = 0;
    jedynki = 0;

    case (i_oper)
        4'b0000: {o_VF, o_result} = i_argA + i_argB; 
        4'b0001: o_result = i_argA ^ i_argB;
        4'b0010: o_result = ~(i_argA ^ i_argB);
        4'b0011: o_result = (i_argA >>> i_argB);
        4'b0100: o_result = (i_argA <<< i_argB);
        4'b0101: o_result = s_gray; 
        4'b0110: o_result = s_u1intou2;
        4'b0111: o_result = s_crc4;
        4'b1000: o_result = s_crc3;
        4'b1001: o_result = s_licz1;
        4'b1100: o_result = s_term;
        4'b1011: o_result = s_priorytet;
        default: o_result  = '0;
    endcase

 //znacznik_ZF
    begin
    if (o_result=='0)
    o_ZF=1;
    end

// flaga BF1
for( i=0; i<M; i=i+1)begin 
		if(o_result[i] == 1)begin
			jedynki = jedynki + 1;
		end
	end
	if(jedynki == 1)begin
		o_BF = 1'b1;
	end


 //znacznik_NF
   jedynki = 0;

    for (i = 0; i<M; i=i+1) begin
        if (o_result[i] == 1) begin
            jedynki = jedynki + 1;
        end
    end

    if (jedynki % 2 == 1) begin
        o_PF = 1'b1;
    end

end



endmodule

