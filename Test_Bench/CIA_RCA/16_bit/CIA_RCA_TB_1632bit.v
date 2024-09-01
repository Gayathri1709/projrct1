module carry_increment_adder_tb #(parameter WIDTH = 16);
    reg [WIDTH-1:0] a, b;
    reg carry_in;
    wire [WIDTH-1:0] sum;
    wire carry_out;

    carry_increment_adder #(WIDTH) cia (
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .sum(sum),
        .carry_out(carry_out)
    );

    initial begin
        a = 16'h1A2B; b = 16'h3C4D; carry_in = 1'b0;
        #10 a = 16'hFFFF; b = 16'h0001; carry_in = 1'b1;
        #10 $finish;
    end

    initial begin
        $monitor("Time=%0d: a=%h, b=%h, carry_in=%b, sum=%h, carry_out=%b", 
                  $time, a, b, carry_in, sum, carry_out);
    end
endmodule

// Instantiate for 32-bit
module carry_increment_adder_tb32;
    carry_increment_adder_tb #(32) testbench32 ();
endmodule

