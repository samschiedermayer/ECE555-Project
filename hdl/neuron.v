module neuron(
    input x0, x1,
    input w0, w1, w2,
    output [1:0] out
);

// Declaration of Signals
wire [3:0] mult1_out, mult2_out;
wire [3:0] adder1_out, adder2_out;
wire not_d_3;

// Multiplexers
mult imult_1(.x(x0), .w(w0), .out(mult1_out));
mult imult_2(.x(x1), .w(w1), .out(mult2_out));

// Adders
adder iadder_1(.A(mult1_out), .B(mult2_out), .C(1'b0), .S(adder1_out));
adder iadder_2(.A(adder1_out), .B(w2), .C(1'b0), .S(adder2_out));

// Multiplexer
not (not_d_3, adder2_out[3]);
and (out[1], not_d_3, adder2_out[1]);
and (out[0], not_d_3, adder2_out[0]);

endmodule

