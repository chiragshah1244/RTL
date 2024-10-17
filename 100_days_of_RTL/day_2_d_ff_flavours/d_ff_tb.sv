`include "d_ff.sv"

module d_ff_tb;

logic clk,rst,d_i,q_norst_o,q_syncrst_o,q_asyncrst_o;

d_ff uut (.*);

always #5 clk=~clk;

initial begin 
        
        /*
        clk = 0;
        rst = 1; d_i = 0;      // Apply rst
        #10 rst = 0;         // Deassert rst
        #10 d_i = 1;             // Apply d_i = 1
        #10 d_i = 0;             // Apply d_i = 0
        #10 d_i = 1;             // Apply d_i = 1
        #20 $finish;         */  // End_i simulation 

        clk=0; d_i=1;  rst=0;
        #7 rst = 1;

        #15 rst = 0;         
        #5 d_i = 1;             
        #5 d_i = 0;             
        #8 d_i = 1; 
        #10 d_i = 0; 
        rst = 1;
        #5 d_i = 0; 
        #5 d_i = 0;   
        rst = 0;  
        #20 d_i = 1; 
        #5 d_i = 0; 
        #5 d_i = 1;

   /* clk = 0;
    rst = 1'b1;
    d_i = 1'b0;
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
    d_i = 1'b1;
    @(posedge clk);
    @(posedge clk);
    @(negedge clk);
    rst = 1'b1;
    @(posedge clk);
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
    @(posedge clk); */

    $finish;
end

initial begin
    $monitor("time=%t\t clk=%b\t rst=%b\t d_i=%b\t q_norst_o=%b\t q_syncrst_o=%b\t q_asyncrst_o=%b\t" ,$time,clk,rst,d_i,q_norst_o,q_syncrst_o,q_asyncrst_o);
    $dumpfile("d_ff_wavedump.vcd");
    $dumpvars(0, d_ff_tb);

end

 endmodule

 //iverilog -g2012 -o d_ff_wavedump.vvp d_ff_tb.sv
 //vvp d_ff_wavedump.vvp  
