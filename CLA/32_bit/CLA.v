module carry_lookahead_adder #(parameter WIDTH = 32)(
    input [WIDTH-1:0] a, b,
    input carry_in,
    output [WIDTH-1:0] sum,
    output carry_out
);
    wire [WIDTH-1:0] p, g;
    wire [WIDTH:0] carry;

    assign carry[0] = carry_in;

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_block
            assign p[i] = a[i] ^ b[i];
            assign g[i] = a[i] & b[i];
            assign carry[i+1] = g[i] | (p[i] & carry[i]);
            assign sum[i] = p[i] ^ carry[i];
        end
    endgenerate

    assign carry_out = carry[WIDTH];
endmodule

