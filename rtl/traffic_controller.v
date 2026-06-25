module traffic_controller(
    input clk,
    input rst,
    output reg [2:0] ns,
    output reg [2:0] ew
);

    // =========================
    // State Encoding (FSM)
    // =========================
    localparam NS_GREEN  = 2'd0;
    localparam NS_YELLOW = 2'd1;
    localparam EW_GREEN  = 2'd2;
    localparam EW_YELLOW = 2'd3;

    reg [1:0] state;
    reg [5:0] timer;

    // =========================
    // State Transition Logic
    // =========================
    always @(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            state <= NS_GREEN;
            timer <= 0;
        end
        else
        begin
            timer <= timer + 1;

            case (state)

                NS_GREEN: begin
                    if (timer == 30) begin
                        state <= NS_YELLOW;
                        timer <= 0;
                    end
                end

                NS_YELLOW: begin
                    if (timer == 5) begin
                        state <= EW_GREEN;
                        timer <= 0;
                    end
                end

                EW_GREEN: begin
                    if (timer == 30) begin
                        state <= EW_YELLOW;
                        timer <= 0;
                    end
                end

                EW_YELLOW: begin
                    if (timer == 5) begin
                        state <= NS_GREEN;
                        timer <= 0;
                    end
                end

                default: begin
                    state <= NS_GREEN;
                    timer <= 0;
                end

            endcase
        end
    end

    // =========================
    // Output Logic
    // =========================
    always @(*)
    begin
        case (state)

            NS_GREEN: begin
                ns = 3'b001; // Green
                ew = 3'b100; // Red
            end

            NS_YELLOW: begin
                ns = 3'b010; // Yellow
                ew = 3'b100; // Red
            end

            EW_GREEN: begin
                ns = 3'b100; // Red
                ew = 3'b001; // Green
            end

            EW_YELLOW: begin
                ns = 3'b100; // Red
                ew = 3'b010; // Yellow
            end

            default: begin
                ns = 3'b100;
                ew = 3'b100;
            end

        endcase
    end

endmodule
