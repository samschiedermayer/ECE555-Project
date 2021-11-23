module mult_tb;

logic signed [1:0] w;
logic [1:0] x;
logic [3:0] y;

mult_working iDut(.x(x),.w(w),.y(y));

logic tb_err; // keeps track of whether or not an error has occurred in the testbench
task test_combination(
  input [1:0] new_x,
  input [1:0] new_w,
  input [3:0] expected_y
);
  x = new_x;
  w = new_w;
  #1;
  if (y !== expected_y) begin
    $display("test failed for input combination x=%b & w=%b. Expected out=%b, Actual out=%b",x,w,expected_y,y);
    tb_err = 1;
  end
endtask


initial begin
  tb_err = 0;

  test_combination(2'b00,2'b00,4'b0000);
  test_combination(2'b00,2'b01,4'b0000);
  test_combination(2'b00,2'b10,4'b0000);
  test_combination(2'b00,2'b11,4'b0000);

  test_combination(2'b01,2'b00,4'b0000);
  test_combination(2'b01,2'b01,4'b0001);
  test_combination(2'b01,2'b10,4'b1110);
  test_combination(2'b01,2'b11,4'b1111);

  test_combination(2'b10,2'b00,4'b0000);
  test_combination(2'b10,2'b01,4'b0010);
  test_combination(2'b10,2'b10,4'b1100);
  test_combination(2'b10,2'b11,4'b1110);

  test_combination(2'b11,2'b00,4'b0000);
  test_combination(2'b11,2'b01,4'b0011);
  test_combination(2'b11,2'b10,4'b1010);
  test_combination(2'b11,2'b11,4'b1101);

  if (tb_err === 0)
    $display("Yahoo! All tests passed :)");
end

endmodule

