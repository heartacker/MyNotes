// -- FPGA Project: What is an FPGA?
// -- Verilog example code for Adder on FPGA

//! this is description
//! **wavedrom**
//! { signal: [
//!   { name: "clk",         wave: "p.....|..." },
//!   { name: "Data",        wave: "x.345x|=.x", data: ["head", "body", "tail", "data > 0"] },
//!   { name: "Request",     wave: "0.1..0|1.0" },
//!   {},
//!   { name: "Acknowledge", wave: "1.....|01." }
//! ]}
//! {
//! signal: [
//!   { name: "Alfa1", wave: "01.zx=ud.23.456789" },
//!   { name: "Alfa2", wave: "10.zx=ud.23.456789" }
//! ]
//!}
//!  { assign:[
//!    ["z", ["~&",
//!      ["~^", ["~", "p0"], ["~", "q0"]],
//!      ["~^", ["~", "p1"], ["~", "q1"]],
//!      ["~^", ["~", "p2"], ["~", "q2"]],
//!      "...",
//!      ["~^", ["~", "p7"], ["~", "q7"]],
//!      ["~","~en"]
//!    ]]
//!  ]}
module fpga4student_adder(input A,B,Ci,output S,Co);
  wire tmp1,tmp2,tmp3;  //FPGA projects
  xor u1(tmp1,A,B);  // Verilog projects
  and u2(tmp2,A,B);
  and u3(tmp3,tmp1,Ci);
  or u4(Co,tmp2,tmp3);
  xor u5(S,tmp1,Ci);
endmodule
