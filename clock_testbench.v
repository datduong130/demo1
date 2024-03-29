`timescale 1ns/1ns

module ClockGenerator_Testbench;

    // Declare the signals
    reg CLK_IN;       // Xung clock đầu vào từ FPGA
    wire CLK_OUT;     // Xung clock 1Hz đầu ra

    // Instantiate the ClockGenerator module
    ClockGenerator uut (
        .CLK_IN(CLK_IN),
        .CLK_OUT(CLK_OUT)
    );

    // Clock generation
    always #10 CLK_IN = ~CLK_IN;  // Mô phỏng xung clock đầu vào (50 MHz)

    // Monitor
    always @(posedge CLK_OUT) begin
        $display("CLK_OUT at %0t", $time);
    end

    // Stimulus
    initial begin
        CLK_IN = 0;
        #100;  // Chờ 100 ns
        $finish; // Kết thúc mô phỏng
    end

endmodule
