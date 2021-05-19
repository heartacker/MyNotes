// fpga4student.com
// FPGA projects, VHDL projects, Verilog projects
// Verilog code for RISC Processor
// Verilog code for ALU
module ALU(
           input  [15:0] a,  //src1
           input  [15:0] b,  //src2
           input  [2:0] alu_control, //function sel

           output reg [15:0] result,  //result
           output zero
       );

always @(*)
begin
    case(alu_control)
        3'b000: result = a + b; // add
        3'b001: result = a - b; // sub
        3'b010: result = ~a;
        3'b011: result = a<<b;
        3'b100: result = a>>b;
        3'b101: result = a & b; // and
        3'b110: result = a | b; // or
        3'b111: begin
            if (a<b)
                result = 16'd1;
            else
                result = 16'd0;
        end
        default:result = a + b; // add
    endcase
end
assign zero = (result==16'd0) ? 1'b1: 1'b0;

endmodule
