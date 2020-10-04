`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:02:04 04/25/2019 
// Design Name: 
// Module Name:    Top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Top( //clk_p,clk_n
            input clk
    );
//input wire clk_p;
//input wire clk_n; 

reg  [127:0] decryptedMessage;
reg [127:0]  Key;
wire [127:0] Message; 

//wire clk;
//wire clk;

//wire [127:0] key_debug;
//wire [127:0] msg_debug;
wire[127:0] roundKey,messageFirst,AddedMessage;
wire [31:0] colMessageShiftRows,colMessageSubbytes,colMessageXor;
wire clk_divided,clk_divided2; 
reg [127:0] intermediateMessage, message_before_round;
wire [31:0] colMessage;
reg [3:0] Round,generatingKeyIndex; 
reg [2:0] iteration; /* to Get 4 columns of message */ 
reg delay_reg;


localparam firstIteration   = 3'b000;
localparam seconedIteration = 3'b001;
localparam thirdIteration   = 3'b010;
localparam fourthIteration  = 3'b011;


initial 
begin 
decryptedMessage = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
Key = 128'h000102030405060708090a0b0c0d0e0f;
Round = 4'b0; 
generatingKeyIndex = 4'b0;
iteration = 3'b000;
intermediateMessage = 128'd0;
message_before_round = 128'd0;
delay_reg = 1;
end 

/*BEGIN CODE */ 

//assign msg_debug =  decryptedMessage;
//assign key_debug =  Key;
//assign clk = clk_a;

assign AddedMessage = (Round == 4'b0000 ) ? decryptedMessage:message_before_round;
assign Message = message_before_round;
clockdivider FrequencyDivider (.clk(clk),.clk_out(clk_divided),.clk_out2(clk_divided2));
	
keyGenArr GettingKey ( .Key(Key),.outKey(roundKey),.clk(clk_divided2),.Round(Round));	
				
shiftrows ShifftingRows (.message_input(AddedMessage),.message_output_col(colMessageShiftRows), .counter_col(iteration[1:0]), .Round(Round));
SUB SubBytes(.input_col(colMessageShiftRows) , .output_col(colMessageSubbytes),.Round(Round));
XOR_unit addingRoundKey(.inputData(colMessageSubbytes), .outputData(colMessageXor) ,.key(roundKey) , .messageCounterCol(iteration[1:0])); 
mixCol advancedMultiplication(.Col(colMessageXor),.output_Col(colMessage),.Round(Round));


always@ (posedge clk_divided ) 
begin
//if (delay_reg > 0)
//    begin 
    case (iteration)
    
        firstIteration:
                            intermediateMessage[127:96]= colMessage;
        seconedIteration:
                            intermediateMessage[95:64] = colMessage;	  
        thirdIteration:
                            intermediateMessage[63:32]= colMessage;
        fourthIteration:
                            intermediateMessage[31:0] = colMessage;
    						
	endcase 
//end
end

									

always@ (posedge clk_divided)
begin
    if (generatingKeyIndex <= 4'd9)
        begin 	
            generatingKeyIndex <= generatingKeyIndex + 1'b1;		
        end
end

always@( posedge clk_divided )  /* This clk must be its width much longer than other clk in modules */ 															/* Ten Edges For Generating Key */														/* Register + And gate and use its output instead of if condition */ 
begin
	if ( generatingKeyIndex == 4'd10)  /* Starting the Algorithm need in one round 4 iteration to end the messsage */ 
	begin 
        if (Round <= 4'b1010)
        begin
			if (iteration <= 3'b010)
				iteration <= iteration + 1'b1;
			else
			begin
				iteration <= 3'b000;
				message_before_round <= intermediateMessage;
				Round <= Round + 1'b1;		
			end
        end
        else if (Round == 4'b1011) 
		begin
			Round <= 4'b1011;
		end
        end
        
end 
	
/*
always @(posedge clk_divided)
begin
if ((iteration <= 3'b010) && delay_reg == 0)
    delay_reg = 1;
else
    delay_reg = 0;

end*/
/*
assign intermediateMessage[127:96]  = (iteration == 2'b00 ) ? colMessage : intermediateMessage[127:96];
assign intermediateMessage[95:64]  = (iteration == 2'b01 ) ? colMessage : intermediateMessage[95:64];
assign intermediateMessage[63:32]  = (iteration == 2'b10 ) ? colMessage : intermediateMessage[63:32];
assign intermediateMessage[31:0]  = (iteration == 2'b11 ) ? colMessage : intermediateMessage[31:0]; */ 

endmodule
