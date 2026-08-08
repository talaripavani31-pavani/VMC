//====================================================
// Vending Machine Controller
// Product Price = 15 units
// Coin Inputs: 5 and 10 units
// FSM Based Design
//====================================================

module vending_machine(
    input clk,
    input reset,
    input coin5,
    input coin10,
    output reg dispense,
    output reg change
);

parameter S0  = 2'b00;   // 0 amount
parameter S5  = 2'b01;   // 5 amount
parameter S10 = 2'b10;   // 10 amount
parameter S15 = 2'b11;   // Product dispense

reg [1:0] state, next_state;


// State Register
always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= S0;
    else
        state <= next_state;
end


// Next State Logic
always @(*)
begin

    case(state)

        S0:
        begin
            if(coin5)
                next_state = S5;
            else if(coin10)
                next_state = S10;
            else
                next_state = S0;
        end


        S5:
        begin
            if(coin5)
                next_state = S10;
            else if(coin10)
                next_state = S15;
            else
                next_state = S5;
        end


        S10:
        begin
            if(coin5)
                next_state = S15;
            else if(coin10)
                next_state = S15;
            else
                next_state = S10;
        end


        S15:
            next_state = S0;


        default:
            next_state = S0;

    endcase

end


// Output Logic
always @(*)
begin

    dispense = 0;
    change = 0;

    if(state == S15)
        dispense = 1;

end


endmodule