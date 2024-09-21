module SR_tb;
    reg clk, rst_n;
    reg s, r;
    wire q, q_bar;

    // Instantiate the SR Flip-Flop module
    SR_ff sr (.clk(clk), .rst_n(rst_n), .s(s), .r(r), .q(q), .q_bar(q_bar));

    // Clock generation: toggle clock every 2 units of time
    always #2 clk = ~clk;

    // Initial stimulus
    initial begin
        clk = 0; 
        rst_n = 0;
        $display("rst_n= %b ---> q=%b , q_bar=%b", rst_n, q, q_bar);
        
        #3 rst_n = 1;
        $display("rst_n= %b ---> q=%b , q_bar=%b", rst_n, q, q_bar);

        // Apply different input combinations to the SR Flip-Flop
        drive(2'b00);
        drive(2'b01);
        drive(2'b10);
        drive(2'b11);

        #5;
        $finish;
    end

    // Drive task to apply stimulus to the SR flip-flop
    task drive(input reg [1:0] ip);
    begin
        @(posedge clk);  // Wait for the positive edge of the clock
        {s, r} = ip;     // Assign the input values to s and r
        #1;              // Delay to allow changes to propagate
        $display("s=%b, r=%b --> q=%b, q_bar=%b", s, r, q, q_bar);
        end
    endtask

    // Dump waveform for post-simulation viewing
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1, SR_tb);
    end

endmodule
