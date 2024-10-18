`include "alu.sv"

module alu_tb;

logic [7:0]a; 
logic [7:0]b;
logic [2:0]encode_op; 
logic [7:0]alu_o;

alu uut(.*);

initial begin

     // Initialize inputs
    a = 8'h91;
    b = 8'h91;
    encode_op = 3'b000;

    #10;
    a=8'h1f;
    b=8'h11;
    encode_op=3'b001;
   

    #10;
    a=8'h11;
    b=8'h01;
    encode_op=3'b010;
    
    #10;
    a=8'h11;
    b=8'h01;
    encode_op=3'b011;

    #10;
    a=8'h1f;
    b=8'h11;
    encode_op=3'b100;

    #10;
    a=8'h1f;
    b=8'h11;
    encode_op=3'b101;

    #10;
    a=8'h1f;
    b=8'h11;
    encode_op=3'b110;

    #10;
    a=8'h1f;
    b=8'h1f;
    encode_op=3'b111;


   #20 $finish;
end

initial begin
    $monitor("time=%t\t a=%h\t b=%h\t encode_op=%b alu_o=%h\t",$time,a,b,encode_op,alu_o);
    $dumpfile("alu_wavedump.vcd");
    $dumpvars(0, alu_tb);
end

endmodule
