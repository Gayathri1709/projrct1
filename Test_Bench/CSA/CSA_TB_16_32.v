module carry_save_adder_tb #(parameter WIDTH = 16);
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
        a = 16'h1A2B; b = 16'h3C4D; c = 16'h5E6F;
        #10 a = 16'hFFFF; b = 16'h0001; c = 16'h0001;
        #10 $finish;
    end

    initial begin
        $monitor("Time=%0d: a=%h, b=%h, c=%h, sum=%h, carry_out=%b", 
                  $time, a, b, c, sum, carry_out);
    end
endmodule

// Instantiate for 32-bit
module carry_save_adder_tb32;
    carry_save_adder_tb #(32) testbench32 ();
endmodule

