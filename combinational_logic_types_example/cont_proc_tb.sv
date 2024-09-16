`include"cont_proc.sv"

module cont_proc_tb;
logic a,b,c,y;
logic d;

logic u,v,w;
logic p;

cont_proc uut(.*);

initial begin
    a=0;
    b=1;
    c=0;

    u=0;
    v=1;
    w=0;
    
end

initial begin
    $monitor("time=%t \t a=%b \t b=%b \t c=%b \t d=%b \t y=%b \t" ,$time,a,b,c,d,y);

end

initial begin
     //   $monitor("time=%t \t u=%b \t v=%b \t w=%b \t p=%b \t" ,$time,u,v,w,p);

end

endmodule  


//--command to compile in iverilog--//
//iverilog -g2012 -o cont_proc_tb.vvp cont_proc_tb.sv

//--command to display output--/
//vvp cont_proc_tb.vvp   