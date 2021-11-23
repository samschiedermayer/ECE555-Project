module mult(
  input  wire [1:0] x,
  input  wire [1:0] w,
  output wire [3:0] y
);

// adder BEGIN
wire [3:0] s;

//s[0]
assign s[0] = 1'b0;

//s[2:1]
wire x00, n00, n01, n02;

xor(x00,w[0],w[1]);
xor(s[1],x00,w[0]); //s,s[1]

nand(n00,w[0],w[1]);
nand(n01,x00,w[0]);
nand(s[2],n00,n01); //cout,s[2]

//s[3]
assign s[3] = w[1];

// adder END


// mux BEGIN
wire [3:0] mux_upper, mux_lower;

assign mux_upper = (x[0]) ? s                  : {w[1],w[1:0],1'b0};
assign mux_lower = (x[0]) ? {{2{w[1]}},w[1:0]} : 4'b0000;

assign y = (x[1]) ? mux_upper : mux_lower;

// mux END

endmodule

