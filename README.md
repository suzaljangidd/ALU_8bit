# ALU_8bit
8-bit ALU in Verilog with testbench (Icarus + GTKWave)
# 8-bit ALU (Arithmetic Logic Unit) — Verilog RTL Design

This project contains the RTL design and testbench for an **8-bit ALU**, implemented in **Verilog** and simulated using **Icarus Verilog (iverilog)** and **GTKWave**.

The ALU supports **8 different operations** selected using a 3-bit opcode.

---

##  Features

| Opcode | Operation | Description |
|--------|-----------|-------------|
| `000`  | ADD       | a + b |
| `001`  | SUB       | a - b |
| `010`  | AND       | a & b |
| `011`  | OR        | a \| b |
| `100`  | XOR       | a ^ b |
| `101`  | SHL       | a << 1 |
| `110`  | SHR       | a >> 1 |
| `111`  | SLT       | result = 1 if (a < b) else 0 |

---

## 📂 Project Structure

```
ALU_8bit/
│
├── src/
│   └── ALU_8bit.v
│
├── tb/
│   └── ALU_testbench.v
│
├── sim/
│   ├── ALU.vcd
│   ├── waveform.png
│   └── simulation_output.png
│
└── README.md
```

---

##  RTL Code (ALU_8bit.v)

```verilog
`timescale 1ns/1ps
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
```

---

##  Testbench (ALU_testbench.v)

```verilog
`timescale 1ns/1ps
module ALU_tb;
  reg [7:0] a, b;
  reg [2:0] opcode;
  wire [7:0] result;

  ALU_8bit UUT(.a(a), .b(b), .opcode(opcode), .result(result));

  initial begin
    $dumpfile("ALU.vcd");
    $dumpvars(0, ALU_tb);
    $monitor($time,"ns a=%b | b=%b | opcode=%b | result=%b",a,b,opcode,result);

    a = 8'd0; b = 8'd0; opcode = 3'b000; 
    #10;

    // ADD
    a = 8'hA5; b = 8'h5A; opcode = 3'b000;
    #10;

    // SUB
    a = 8'd25; b = 8'd20; opcode = 3'b001;
    #10;

    // AND
    a = 8'hAA; b = 8'h45; opcode = 3'b010;
    #10;

    // OR
    opcode = 3'b011;
    #10;

    // XOR
    opcode = 3'b100;
    #10;

    // SHIFT LEFT
    opcode = 3'b101;
    #10;

    // SHIFT RIGHT
    opcode = 3'b110;
    #10;

    // SLT
    a = 8'd10; b = 8'd5; opcode = 3'b111;
    #10;

    #10 $finish;
  end
endmodule
```

---

##  How to Run the Simulation

### **1️) Compile**
```
iverilog -o ALU_out ALU_8bit.v ALU_testbench.v
```

### **2️) Run**
```
vvp ALU_out
```

### **3️) View Waveform**
```
gtkwave ALU.vcd
```

---

##  Waveform Output  
<img width="995" height="629" alt="Waveform" src="https://github.com/user-attachments/assets/4f99f1a5-b316-41ce-9db8-948f440bb65d" />

---

##  Terminal Output  
<img width="876" height="371" alt="Simulation_output" src="https://github.com/user-attachments/assets/a7d637dc-f667-4c69-b521-64e7e49d9530" />

---

##  What I Learned

- Writing combinational logic using `always @(*)`
- Designing arithmetic and logic functions in RTL
- Creating and running Verilog testbenches
- Using Icarus Verilog for simulation
- Viewing waveforms in GTKWave
- Organizing a professional project structure for GitHub

---

##  Future Improvements

- Add carry, zero, overflow flags  
- Add rotate operations  
- Add 16-bit ALU version  
- Integrate ALU inside a CPU datapath  

---

##  Author

Suzal Jangid  
ECE Student • Aspiring VLSI / DV Engineer

