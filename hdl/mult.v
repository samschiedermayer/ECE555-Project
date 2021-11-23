module mult(
  input  wire [1:0] x,
  input  wire [1:0] w,
  output wire [3:0] y
);

// intermediate signals
wire [3:0] s;
wire [3:0] w_ext;
assign w_ext = {{2{w[1]}},w[1:0]};

// adder BEGIN

//s[0]
assign s[0] = 1'b0;

//s[1]
wire x00, n00, n01, n02;

xor(x00,w_ext[0],w_ext[1]);
xor(s[1],x00,w_ext[0]); //s

nand(n00,w_ext[0],w_ext[1]);
nand(n01,x00,w_ext[0]);
nand(n02,n00,n01); //cout

//s[2]
wire x10, n10, n11, n12;

xor(x10,w_ext[1],w_ext[2]);
xor(s[2],x10,n02); //s

nand(n10,w_ext[1],w_ext[2]);
nand(n11,x10,n02);
nand(n12,n10,n11); //cout

//s[3]
wire x20;

xor(x20,w_ext[2],w_ext[3]);
xor(s[3],x20,n12); //s

// adder END


// mux BEGIN

wire [3:0] mux_upper, mux_lower;

assign mux_upper = (x[0]) ? s     : {w_ext[2:0],1'b0};
assign mux_lower = (x[0]) ? w_ext : 4'b0000;

assign y = (x[1]) ? mux_upper : mux_lower;

// mux END

endmodule

