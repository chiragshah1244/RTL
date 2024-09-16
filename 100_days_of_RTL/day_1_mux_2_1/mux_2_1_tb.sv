`include "mux_2_1.sv"

module mux_2_1_tb;

logic [7:0]a_i;
logic [7:0]b_i;
logic sel;
logic [7:0]y_out;

mux_2_1 uut(.a_i(a_i),.b_i(b_i),.sel(sel),.y(y_out));


/*initial begin
    a_i=0;
    b_i=1;
    sel=1;
    #5;
    sel=0; 
end*/

initial begin
    a_i=8'h00;
    b_i=8'hFF;
    sel=0;
    #5;
    for(int i =0; i<=10; i++) begin
    a_i= $urandom_range(0,8'hFF);
    b_i= $urandom_range(0,8'hFF);
    sel=$random%2;
    #5;
    end
end

initial begin
    $monitor("time=%t\t a_i=%h\t b_i=%h\t sel=%h\t y_out=%h\t",$time,a_i,b_i,sel,y_out);
    $dumpfile("mux_2_1_wavedump.vcd");
    $dumpvars(0,mux_2_1_tb);
end
endmodule

//--command to compile in iverilog--//
//iverilog -g2012 -o mux_2_1.vvp mux_2_1_tb.sv

//--command to display output and wavedump--/
//vvp mux_2_1.vvp     