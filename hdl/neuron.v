module neuron(
    input x0, x1,
    input w0, w1, w2,
    output out
);

wire [3:0] mult1_out, mult2_out;
wire [3:0] adder1_out, adder2_out;

mult imult_1(.x(x0), .w(w0), .out(mult1_out));
mult imult_2(.x(x1), .w(w1), .out(mult2_out));

adder iadder(.A(mult1_out), .B(mult2_out), .C(1'b0), .S(adder1_out));
adder iadder(.A(adder1_out), .B(w2), .C(1'b0), .S(adder2_out));

multiplexer imultiplexer(.d(adder_2_out), .q(out));


endmodule

