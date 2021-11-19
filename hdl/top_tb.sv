module tb_top();

reg [1:0] x0, x1, w00, w01, w10, w11, w20, w21, u00, u10, u20;
wire [1:0] out;

// Top module
// Instantiation of top module
// Please replace the instantiation with the top module of your gate level model
// Look for 'test failed' in the message. If there is no such message then your output matches the golden outputs. 
top top(.x0(x0), .x1(x1), .w00(w00), .w01(w01), .w10(w10), .w11(w11), 
        .w20(w20), .w21(w21), .u00(u00), .u10(u10), .u20(u20), .out(out));



initial begin

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

x0 = 2'b00;
x1 = 2'b00;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=00 & x1=00");


x0 = 2'b00;
x1 = 2'b01;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=00 & x1=01");

x0 = 2'b00;
x1 = 2'b10;

#1
// display message if output not matched
if(out != 2'b01)  
    $display("test failed for input combination x0=00 & x1=10");

x0 = 2'b00;
x1 = 2'b11;

#1
// display message if output not matched
if(out != 2'b11)  
    $display("test failed for input combination x0=00 & x1=11");

x0 = 2'b01;
x1 = 2'b00;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=01 & x1=00");

x0 = 2'b01;
x1 = 2'b01;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=01 & x1=01");

x0 = 2'b01;
x1 = 2'b10;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=01 & x1=10");

x0 = 2'b01;
x1 = 2'b11;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=01 & x1=11");

x0 = 2'b10;
x1 = 2'b00;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=10 & x1=00");

x0 = 2'b10;
x1 = 2'b01;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=10 & x1=01");

x0 = 2'b10;
x1 = 2'b10;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=10 & x1=10");

x0 = 2'b10;
x1 = 2'b11;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=10 & x1=11");

x0 = 2'b11;
x1 = 2'b00;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=11 & x1=00");

x0 = 2'b11;
x1 = 2'b01;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=11 & x1=01");

x0 = 2'b11;
x1 = 2'b10;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=11 & x1=10");

x0 = 2'b11;
x1 = 2'b11;

#1
// display message if output not matched
if(out != 2'b00)  
    $display("test failed for input combination x0=11 & x1=11");

$display("YAHOO! Tests passed!");
$stop();

end

endmodule
