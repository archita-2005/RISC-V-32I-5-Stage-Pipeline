module tb();

    reg clk = 0;
    reg rst;

    // Clock: 100 ns period
    always begin
        clk = ~clk;
        #50;
    end

    // Reset
    initial begin
        rst <= 1'b1;     // Assert reset
        #200;
        rst <= 1'b0;     // Release reset
        #1000;
        $finish;
    end

    // VCD waveform
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end

    // DUT
    Pipeline_top dut (
        .clk(clk),
        .rst(rst)
    );

endmodule