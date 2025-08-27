module Tesla_testbench;
parameter STOP =2'b00 ;
parameter ACCELERATE =2'b01 ;
parameter DECELERATE =2'b10 ;
parameter MIN_DISTANCE =7'd40 ;
    reg [7:0] speed_limit=8'd60, car_speed;
    reg [6:0] leading_distance;
    reg clk, rst;
    wire unlock_doors, accelerate_car;

    Tesla #(STOP,ACCELERATE,DECELERATE,MIN_DISTANCE)dut (
        .speed_limit(speed_limit),
        .car_speed(car_speed),
        .leading_distance(leading_distance),
        .clk(clk),
        .rst(rst),
        .unlock_doors(unlock_doors),
        .accelerate_car(accelerate_car)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        @(negedge clk);
        rst = 0;

        // Test accelerate
        @(negedge clk); car_speed = 8'd10; leading_distance = 7'd50;
        @(negedge clk); car_speed = 8'd30; leading_distance = 7'd45;
        @(negedge clk); car_speed = 8'd61; leading_distance = 7'd45; 
        @(negedge clk); car_speed = 8'd30; leading_distance = 7'd30; 
        @(negedge clk); car_speed = 8'd0;  leading_distance = 7'd50;

        @(negedge clk); $stop;
    end

    initial begin
        $monitor(" rst=%b | speed_limit=%d | car_speed=%d | leading_distance=%d | unlock_doors=%b | accelerate_car=%b"
                 , rst, speed_limit, car_speed, leading_distance, unlock_doors, accelerate_car);
    end
endmodule