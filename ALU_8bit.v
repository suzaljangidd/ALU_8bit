module ALU_8bit(a,b,opcode,result);
  input [7:0]a,b;
  input [2:0]opcode;
  output reg [7:0]result;

  always @ (*) begin
    case(opcode)
      3'b000 : result = a + b;           //ADD
      3'b001 : result = a - b;           //SUB
      3'b010 : result = a & b;           //AND
      3'b011 : result = a | b;           //OR
      3'b100 : result = a ^ b;           //X-OR
      3'b101 : result = a << 1;          //SHIFT LEFT
      3'b110 : result = a >> 1;          //SHIFT RIGHT
      3'b111 : result = (a < b) ? 1 : 0; //SET LESS THAN(SLT)
      default : result = 0;
    endcase
  end
endmodule
