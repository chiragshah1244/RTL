//synthesize into 2:1 mux(hardware discribed for implementing 2:1 mux) : Synthesis is the process of converting a high-level description of design (Verilog/VHDL) into an optimized gate-level representation.

module cont_proc(
input logic a,
input logic b,
input logic c,
input logic u, //
input logic v, //
input logic w, //
output logic d,                                  
output logic y,
output logic p); //

//continuous assignment
assign d = a&b;
assign y = d|c; 

//procedural assignment
always_comb begin 
    p = u&v;
    p = p|w; 
end

endmodule 

