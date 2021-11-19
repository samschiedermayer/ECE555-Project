module top(
	input  [1:0] x0, x1, 
	input  [1:0] w00, w01, w10, w11, w20, w21, 
	input  [1:0] u00, u10, u20, 
	output [1:0] out
);

// Instantiation of an MLP module
// mlp mlp(x0, x1, w00, w01, w10, w11, w20, w21, u00, u10, u20, out);

wire [3:0] y0, y1;

// Neuron 0
neuron n0(.x0(x0), .x1(x1), .w0(w00), .w1(w10), .w2(w20), .out(y0));

// Neuron 1
neuron n1(.x0(x0), .x1(x1), .w0(w01), .w1(w11), .w2(w21), .out(y1));

// Neuron Out
neuron mlp_out(.x0(y0), .x1(y1), .w0(u00), .w1(u10), .w2(u20), .out(out)); // Neuron 1

endmodule
