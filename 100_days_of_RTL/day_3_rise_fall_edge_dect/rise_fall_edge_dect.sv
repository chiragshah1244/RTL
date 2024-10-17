// Design and verify a rising and falling edge detector

module rise_fall_edge_dect (
    input wire clk,
    input wire rst,
    input wire a_i,

    output logic out_rise,
    output logic out_fall
); 

logic prev_a_i;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
    out_rise <= 1'b0;
    out_fall <= 1'b0;
    prev_a_i <= 1'b0;
    end

    else 
    begin
    out_rise <= (~prev_a_i) & a_i; //for rise edge -> previous value = 0 ,current value -> 1
    out_fall <= prev_a_i & (~a_i); //for fall edge -> previous value = 1 ,current value -> 0
    end
end

always @(posedge clk or posedge rst)
begin
    prev_a_i <= a_i;
end

/*
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
    //out_rise <= 1'b0;
    //out_fall <= 1'b0;
    prev_a_i <= 1'b0;
    end
    else 
    prev_a_i <= a_i;
end

//assign statements execute in parallel with always block
assign out_rise = (~prev_a_i) & a_i; //for rise edge -> previous value = 0 ,current value -> 1
assign out_fall = prev_a_i & (~a_i); //for fall edge -> previous value = 1 ,current value -> 0

//The prev_a_i signal is updated on the clock edge, 
//and the assign statements continuously monitor the values of prev_a_i and a_i, 
//and the outputs (out_rise and out_fall) are updated whenever these signals change.
*/

endmodule