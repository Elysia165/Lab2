`timescale 1ns / 1ns

module led (
    input sys_clk,
    input sys_rst_n,
    output reg led_out
);
parameter CNT_MAX = 25'd24_999_999;
    reg [24:0] cnt;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) 
            cnt <= 25'd0;
         else if (cnt == CNT_MAX)
            cnt <= 25'd0;
         else 
            cnt <= cnt + 1'b1;
        
    end
        
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) 
            led_out <= 1'b0;
        else if (cnt == CNT_MAX)
            led_out <= ~led_out;
            else
            led_out <= led_out;
    end
    
endmodule