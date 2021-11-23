module tb_top();

reg [1:0] x0, x1, w00, w01, w10, w11, w20, w21, u00, u10, u20;
wire [1:0] out;

// Top module
// Instantiation of top module
// Please replace the instantiation with the top module of your gate level model
// Look for 'test failed' in the message. If there is no such message then your output matches the golden outputs. 
top top(.x0(x0), .x1(x1), .w00(w00), .w01(w01), .w10(w10), .w11(w11), 
        .w20(w20), .w21(w21), .u00(u00), .u10(u10), .u20(u20), .out(out));

reg tb_err; // keeps track of whether or not an error has occurred in the testbench
task test_combination(
  input [1:0] new_x0,
  input [1:0] new_x1,
  input [1:0] expected_out
);
    x0 = new_x0;
    x1 = new_x1;
    #1;
    if (out !== expected_out) begin
      $display("test failed for input combination x0=%b & x1=%b. Expected out=%b, Actual out=%b",x0,x1,expected_out,out);
      tb_err = 1;
    end
endtask

initial begin
tb_err = 0;

// Below are the weights
w00 = 2'b11;
w01 = 2'b10;
w10 = 2'b01;
w11 = 2'b01;
u00 = 2'b01;
w20 = 2'b11;
w21 = 2'b11;

// Below are the biases
u20 = 2'b11;
u10 = 2'b01;

// Below are the inputs
// Inputs change every 1 unit of time
test_combination(2'b00,2'b00,2'b00);
test_combination(2'b00,2'b01,2'b00);
test_combination(2'b00,2'b10,2'b01);
test_combination(2'b00,2'b11,2'b11);

test_combination(2'b01,2'b00,2'b00);
test_combination(2'b01,2'b01,2'b00);
test_combination(2'b01,2'b10,2'b00);
test_combination(2'b01,2'b00,2'b00);

test_combination(2'b10,2'b00,2'b00);
test_combination(2'b10,2'b01,2'b00);
test_combination(2'b10,2'b10,2'b00);
test_combination(2'b10,2'b00,2'b00);

test_combination(2'b11,2'b00,2'b00);
test_combination(2'b11,2'b01,2'b00);
test_combination(2'b11,2'b10,2'b00);
test_combination(2'b11,2'b00,2'b00);

if (tb_err === 0)
  $display("Yahoo! All tests passed :)");
end

endmodule
