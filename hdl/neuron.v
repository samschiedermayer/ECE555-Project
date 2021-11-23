module neuron(
    input [1:0] x0, x1,
    input [1:0] w0, w1, w2,
    output [1:0] out
);

// Declaration of Signals
wire [3:0] mult1_out, mult2_out;
wire [3:0] adder1_out, adder2_out;
wire not_d_3;

// Multipliers
mult imult_1(.x(x0), .w(w0), .y(mult1_out));
mult imult_2(.x(x1), .w(w1), .y(mult2_out));

// Adders
adder iadder_1(.A(mult1_out), .B(mult2_out), .Sum(adder1_out));
adder iadder_2(.A(adder1_out), .B({{2{w2[1]}},w2}),.Sum(adder2_out));

// Multiplexer
not (not_d_3, adder2_out[3]);
and (out[1], not_d_3, adder2_out[1]);
and (out[0], not_d_3, adder2_out[0]);

endmodule

