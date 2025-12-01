`timescale 1ns/1ps
module ALU_tb;
  reg [7:0]a,b;
  reg [2:0]opcode;
  wire [7:0]result;

  //Instantiation
  ALU_8bit UUT(.a(a),.b(b),.opcode(opcode),.result(result));

  //Stimulus
  initial begin
  $dumpfile("ALU.vcd");
  $dumpvars(0,ALU_tb);
  $monitor($time,"ns a=%b | b=%b | opcode=%b | result=%b",a,b,opcode,result);
  
  a=8'd0; b=8'd0; opcode=3'b000;

  //ADD
  a=8'hA5; b=8'h5A; opcode=3'b000;
  #10;

  //SUB
  a=8'd25; b=8'd20; opcode=3'b001;
  #10;

  //AND
  a=8'hAA; b=8'h45; opcode=3'b010;
  #10;

  //OR
  opcode=3'b011;
  #10;

  //XOR
  opcode=3'b100;
  #10;
  
  //SHIFT LEFT
  opcode=3'b101;
  #10;

  //SHIFT RIGHT
  opcode=3'b110;
  #10;

  //SLT
  a=8'd10; b=8'd5; opcode=3'b111;
  #10;
  
  #10 $finish;

  end
endmodule
