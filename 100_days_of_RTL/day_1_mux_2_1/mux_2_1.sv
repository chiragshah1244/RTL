//2:1 mux 

module mux_2_1 (
    input logic [7:0] a_i,
    input logic [7:0] b_i,
    input logic sel,
    output logic [7:0] y
);

//if sel==0 y=b_i & if sel==1 y=a_i

assign y = sel ? a_i : b_i;

/*always_comb begin
case (sel)
    1'b0    : y=b_i;
    1'b1    : y=a_i; 
    default : y=1'bx; 
endcase
end*/

endmodule