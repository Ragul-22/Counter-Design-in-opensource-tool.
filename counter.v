// Simple 4-bit synchronous counter
module counter(
    input  clk,       // clock
    input  rst_n,     // active-low reset
    output reg [3:0] count  // 4-bit output
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        count <= 4'b0000;   // reset to 0
    else
        count <= count + 1;  // increment
end

endmodule
