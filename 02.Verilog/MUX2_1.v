//! hhhh
module MUX2_1 (out, a, b,
                 sel);
  // Port declarations
  output out;
  input a, b, sel;
  wire out, a, b, sel;
  wire sel_, a1, b1;
  // The netlist
  not (sel_, sel);
  and (a1, a, sel_);
  and (b1, b, sel);
  or (out, a1, b1);
endmodule