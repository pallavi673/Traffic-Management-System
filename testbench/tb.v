module tb;

    reg clk;
    reg rst;

    wire [2:0] ns;
    wire [2:0] ew;

    // Instantiate DUT
    traffic_controller uut (
        .clk(clk),
        .rst(rst),
        .ns(ns),
        .ew(ew)
    );

    // Clock generation (10 time units period)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;

        #20 rst = 0;

        #1000 $stop;
    end

endmodule
