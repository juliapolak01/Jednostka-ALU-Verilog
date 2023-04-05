module u2intoGray (i_data, o_gray);

    parameter BITS = 4;
    input  logic signed [BITS-1:0] i_data;
    output logic signed [BITS-1:0] o_gray;

    always @(*)
    begin
        if (i_data[BITS-1] == 1) begin // zwrocenie kodu bledu jezeli liczba na wejsciu jest ujemna
            o_gray = '1;
        end else
        begin
            o_gray  = i_data ^ (i_data >> 1);
        end
    end

endmodule



