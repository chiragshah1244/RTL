`include "rise_fall_edge_dect.sv"

module rise_fall_edge_dect_tb;

logic clk,rst,a_i,out_rise,out_fall;

rise_fall_edge_dect uut(.*);

initial begin
forever #5 clk=~clk;
end

initial begin
    clk=0;
    rst=1;
    a_i=0;
    #10 rst=0;
    #10 a_i=1;
    #20 a_i=0;
    #10 a_i=1;
     rst=1;
    #10 a_i=0;
    #10 a_i=1;
    #20 a_i=0;
    rst=0;
    #10 a_i=1;
    #10 a_i=0;
    #10 a_i=1;
    #20 a_i=0;
    #10 a_i=1;
    #10 a_i=0;

   #20 $finish;

end

initial begin
    $monitor("time=%t\t clk=%b\t rst=%b\t a_i=%b\t out_rise=%b\t out_fall=%b",$time,clk,rst,a_i,out_rise,out_fall);
    $dumpfile("rise_fall_edge_dect.wavedump.vcd");
    $dumpvars(0, rise_fall_edge_dect_tb);
end

endmodule

//iverilog -g2012 -o rise_fall_edge_dect_wavedump.vvp rise_fall_edge_dect_tb.sv
//vvp rise_fall_edge_dect_wavedump.vvp   