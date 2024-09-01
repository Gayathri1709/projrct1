module carry_lookahead_adder_tb;
    parameter WIDTH = 8;
    reg [WIDTH-1:0] a, b;
    reg carry_in;
    wire [WIDTH-1:0] sum;
    wire carry_out;

    carry_lookahead_adder #(WIDTH) cla (
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .sum(sum),
        .carry_out(carry_out)
    );

    initial begin
        a = 8'b00011011; b = 8'b00110101; carry_in = 1'b0;
        #10 a = 8'b11111111; b = 8'b00000001; carry_in = 1'b1;
        #10 $finish;
    end

    initial begin
        $monitor("Time=%0d: a=%b, b=%b, carry_in=%b, sum=%b, carry_out=%b", 
                  $time, a, b, carry_in, sum, carry_out);
    end
endmodule

