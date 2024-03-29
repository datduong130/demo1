module ClockGenerator (
    input wire CLK_IN,     // Xung clock ??u vào t? FPGA
    output  wire CLK_OUT     // Xung clock 1Hz ??u ra
);

parameter CLOCK_FREQ = 50000000;  // T?n s? clock chính c?a FPGA (ví d?: 50 MHz)
parameter CLOCK_DIVIDER = CLOCK_FREQ / 2 - 1;  // T?n s? 1Hz
reg [24:0] counter;  // B? ??m cho xung 1Hz
reg clk_out_tmp = 1'b0;  // T?m th?i xung clock ??u ra

always @(posedge CLK_IN) begin
    counter <= counter + 1;
    if (counter == CLOCK_DIVIDER) begin
        clk_out_tmp <= ~clk_out_tmp;  // ??o tr?ng thái c?a xung clock ??u ra
        counter <= 0;  // ??t l?i b? ??m
    end
end

assign CLK_OUT = clk_out_tmp;  // ??a xung clock 1Hz ra ngoài

endmodule

