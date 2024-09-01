module ripple_carry_adder #(parameter WIDTH = 32)(
    input [WIDTH-1:0] a, b,
    input carry_in,
    output [WIDTH-1:0] sum,
    output carry_out
);
    wire [WIDTH:0] carry;
    assign carry[0] = carry_in;

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_block
            assign sum[i] = a[i] ^ b[i] ^ carry[i];
            assign carry[i+1] = (a[i] & b[i]) | (carry[i] & (a[i] ^ b[i]));
        end
    endgenerate
    assign carry_out = carry[WIDTH];
endmodule

module carry_increment_adder #(parameter WIDTH = 32)(
    input [WIDTH-1:0] a, b,
    input carry_in,
    output [WIDTH-1:0] sum,
    output carry_out
);
    wire [WIDTH-1:0] intermediate_sum;
    wire carry_intermediate;

    ripple_carry_adder #(WIDTH) rca (
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .sum(intermediate_sum),
        .carry_out(carry_intermediate
    );

    assign sum = intermediate_sum + 1'b1;
    assign carry_out = carry_intermediate;
endmodule

