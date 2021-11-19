module multiplexer(
    input [3:0] d,
    output [1:0] q
);

wire not_d_3;

not (not_d_3, d[3]);
and (q[1], not_d_3, d[1]);
and (q[0], not_d_3, d[0]);

endmodule