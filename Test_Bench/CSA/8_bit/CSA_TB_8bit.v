module carry_save_adder_tb;
    parameter WIDTH = 8;
    reg [WIDTH-1:0] a, b, c;
    wire [WIDTH-1:0] sum;
    wire carry_out;

    carry_save_adder #(WIDTH) csa (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .carry_out(carry_out)
    );

    initial begin
        a = 8'b00011011; b = 8'b00110101; c = 8'b01010101;
        #10 a = 8'b11111111; b = 8'b00000001; c = 8'b00000001;
        #10 $finish;
    end

    initial begin
        $monitor("Time=%0d: a=%b, b=%b, c=%b, sum=%b, carry_out=%b", 
                  $time, a, b, c, sum, carry_out);
    end
endmodule

