module vending (
    input clk,
    input reset,
    input [1:0] coinn, // 01 = 5rs and 10 = 10rs
    output reg out,
    output reg[1:0] changee
);
parameter a0 = 2'b00; 
parameter a1 = 2'b01; // 5rs 
parameter a2 = 2'b10; // 10rs 
    reg[1:0] state, Nextstate;
    always @(posedge clk or reset == 1) begin
        if (reset) begin
            state = a0;
            out = 0;
            changee = 2'b00;
        end else begin
            state = Nextstate;
        end
        case (state)        
            a0:
            if(coinn==2'b00) begin
                Nextstate = a0; 
                out = 0;
                changee = 2'b00;
            end else if(coinn == 2'b01) begin
                Nextstate = a1; 
                out = 0;
                changee = 2'b00;
            end else if(coinn == 2'b10) begin
                Nextstate = a2; 
                out = 0;
                changee = 2'b00;
            end
            a1:
            if(coinn ==2'b00) begin
                Nextstate=a1;
                out=0;
                changee=2'b00;
            end
            else if(coinn == 2'b01) begin
                Nextstate = a2; 
                out = 0;
                changee = 2'b00;
            end else if(coinn == 2'b10) begin
                Nextstate = a0; 
                out = 1; 
                changee = 2'b00; 
            end
            a2:
            if(coinn == 2'b00) begin
                Nextstate = a2; 
                out = 0;
                changee = 2'b00;
            end else if(coinn == 2'b01) begin
                Nextstate = a0; 
                out = 1; 
                changee = 2'b00; 
            end else if(coinn == 2'b10) begin
                Nextstate = a1; 
                out = 1; 
                changee = 2'b01; 
            end
        endcase
    end    
endmodule