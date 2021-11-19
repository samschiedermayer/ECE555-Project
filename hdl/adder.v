module adder(A, B, Sum);

	input [3:0] A;
	input [3:0] B;
//	input Cin;
//	output G, P;
	output [3:0] Sum;
	//output Cout;
	
	
	////////////////////////
	//Connections for PFAs//
	////////////////////////
	wire p1;
	wire p2;
	wire p3;
	//wire p4;
	
	wire c2;
	wire c3;
	wire c4;
	
	wire g1;
	wire g2;
	wire g3;
	//wire g4;
	
	wire [3:0] temp_sum;
	
	assign Sum = temp_sum;
	//assign Cout = g4;
	
	////////////////////////////
	//Instantiate PFAs        //
	////////////////////////////
	
	//pfa bit0(.A(A[0]), .B(B[0]), .Cin(Cin), .S(temp_sum[0]), .P(p1), .G(g1));
	
	wire prop1;
	wire gen1;
	wire sum1;
	
	assign prop1 = A[0] ^ B[0];
	assign gen1 = A[0] & B[0];
	assign sum1 = prop1;
	
	assign p1 = prop1;
	assign g1 = gen1;
	assign temp_sum[0] = sum1;

	//pfa bit1(.A(A[1]), .B(B[1]), .Cin(c2), .S(temp_sum[1]), .P(p2), .G(g2));
	
	wire prop2;
	wire gen2;
	wire sum2;
	
	assign prop2 = A[1] ^ B[1];
	assign gen2 = A[1] & B[1];
	assign sum2 = prop2 ^ c2;
	
	assign p2 = prop2;
	assign g2 = gen2;
	assign temp_sum[1] = sum2;

	//pfa bit2(.A(A[2]), .B(B[2]), .Cin(c3), .S(temp_sum[2]), .P(p3), .G(g3));

	wire prop3;
	wire gen3;
	wire sum3;
	
	assign prop3 = A[2] ^ B[2];
	assign gen3 = A[2] & B[2];
	assign sum3 = prop3 ^ c3;
	
	assign p3 = prop3;
	assign g3 = gen3;
	assign temp_sum[2] = sum3;
	
	//pfa bit3(.A(A[3]), .B(B[3]), .Cin(c4), .S(temp_sum[3]), .P(p4), .G(g4));
	
	wire prop4;
	//wire gen4;
	wire sum4;
	
	assign prop4 = A[3] ^ B[3];
	//assign gen4 = A[3] & B[3];
	assign sum4 = prop4 ^ c4;
	
	//assign p4 = prop4;
	//assign g4 = gen4;
	assign temp_sum[3] = sum4;

	////////////////////////////
	//CLA logic               //
	////////////////////////////
	
	wire and1;
	wire and2;
	wire and3;
	wire and4;
	wire and5;
	wire and6;
	
	assign and1 = 1'b0; //Cin & p1;
	assign and2 = g1 & p2;
	assign and3 = 1'b0; //Cin & p1 & p2;
	assign and4 = g2 & p3;
	assign and5 = p3 & p2 & g1;
	assign and6 = 1'b0; //Cin & p1 & p2 & p3;
	
	assign c2 = and1 | g1;
	assign c3 = g2 | and2 | and3;
	assign c4 = g3 | and4 | and5 | and6;
	
	//////////////////////////////////////
	//CLA Logic for 16bit pass through  //not needed for Neuron project
	//////////////////////////////////////

	//assign P = p1&p2&p3&p4;
	//assign G = (g4 == 1'b1) ? 1'b1 : (g3 & p4) ? 1'b1 : (g2 & p3 & p4) ? 1'b1 : (g1 & p2 & p3 & p4) ? 1'b1 : 1'b0;













	

endmodule
