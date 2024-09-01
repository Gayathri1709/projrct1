module carry_save_adder #(parameter WIDTH = 8)(
    input  [WIDTH-1:0] a, b, c,
    output [WIDTH-1:0] sum,
    output carry_out
);
    wire [WIDTH-1:0] temp_sum, temp_carry;

    assign temp_sum = a ^ b ^ c;
    assign temp_carry = (a & b) | (b & c) | (c & a);
    assign sum = temp_sum;
    assign carry_out = temp_carry[WIDTH-1];
endmodule

