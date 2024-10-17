/*design different flavours of D flipflop using sv constructs. 

d_i           => The input to the flop D-pin
q_norst_o     => Output from the non-resettable flop
q_syncrst_o   => Output from the flop with synchronous reset
q_asyncrst_o  => Output from the flop with asynchronous reset */

module d_ff (
    input logic clk,
    input logic rst,
    input logic d_i,

    output logic q_norst_o,
    output logic q_syncrst_o,
    output logic q_asyncrst_o 
);

 always_ff @(posedge clk)
    q_norst_o <= d_i;

  // Sync reset
  always_ff @(posedge clk)
    if (rst)
      q_syncrst_o <= 1'b0;
    else
      q_syncrst_o <= d_i;

  // Async reset
  always_ff @(posedge clk or posedge rst)
    if (rst)
      q_asyncrst_o <= 1'b0;
    else
      q_asyncrst_o <= d_i;


 endmodule


 