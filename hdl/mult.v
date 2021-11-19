module mult(
  input  wire [1:0] x,
  input  wire [1:0] w,
  output wire [3:0] y
);

// intermediate sum signal
wire [2:0] s;

// adder BEGIN
wire s_nand;

assign s[0] = w[0];

xor(s[1],w[0],w[1]);
nand(s_nand,w[0],w[1]);
not(s[2],s_nand);

// adder END


// mux BEGIN
wire i0, i1;

not (i0,x[0]);
not (i1,x[1]);

// y[0]
wire nand00, nand01;

nand(nand00,    x[0],    i1,   w[0]);
nand(nand01,    x[0],  x[1],   s[0]);
nand(  y[0], nand00, nand01);

// y[1]
wire nand10, nand11, nand12;

nand(nand10,   x[0],    i1,   w[1]);
nand(nand11,     i0,  x[1],   w[0]);
nand(nand12,   x[0],  x[1],   s[1]);
nand(  y[1], nand10, nand11, nand12);

// y[3:2]
wire nand20, nor20;

nor ( nor20,   x[0],  x[1],   w[0]);
nand(nand20,   x[0],  x[1],   s[0]);
nand(  y[2],  nor20, nand20);
assign y[3] = y[2];

// mux END


endmodule

