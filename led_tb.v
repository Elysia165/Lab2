`timescale 1ns/1ns
module led_tb;

    reg sys_clk;
    reg sys_rst_n;
    wire led_out;

    led u_led (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .led_out(led_out)
    );
    
    defparam u_led.CNT_MAX = 25'd24;

    initial
        sys_clk = 1'b0;
    always #10 sys_clk = ~sys_clk; 

    initial begin
        $dumpfile("led_tb.vcd");
        $dumpvars(0, led_tb);
        sys_rst_n = 1'b0;
        #20;
        sys_rst_n = 1'b1;
        #1000;
        sys_rst_n = 1'b0;
        #50;
        sys_rst_n = 1'b1;
        #1000;
        $finish;
    end

    initial begin
        $timeformat(-9, 0, " ns", 6);
        $monitor("t=%t  sys_rst_n=%b  led_out=%b  cnt=%d", 
             $time, sys_rst_n, led_out, u_led.cnt);
        
    end

    endmodule