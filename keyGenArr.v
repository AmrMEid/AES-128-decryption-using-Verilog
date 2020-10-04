`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:21 04/25/2019 
// Design Name: 
// Module Name:    keyGenArr 
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
module keyGenArr(Key,outKey,clk, Round
);
input wire [127:0] Key;
input wire [3:0] Round;
input wire clk; 
output wire [127:0] outKey;


wire [127:0] Gen_Key; 
reg  [127:0] targetKey ,prevKey;
reg  [127:0] keyArr [0:10];
reg  [1:0 ] trival; 
reg  [3:0]  reg_counter;
integer index;

Keygen GeneratingKey (.prev_key(prevKey) , .output_key(Gen_Key) ,.reg_counter(reg_counter) );

initial 
begin
prevKey = 128'b0;
trival = 2'b00;
reg_counter = 4'b0001;
targetKey =128'b0;
for ( index = 0; index <= 10; index = index+1 )
			keyArr[index] <= 128'b0;
end

					
					
				
always @ ( posedge clk )
begin 

case (trival)
 
2'b00 ://first key 
			begin
				prevKey <= Key;
				keyArr[0] <= Key;
				trival <= trival+1'b1;
			end
			
2'b01 ://key expansion
			begin
				if (reg_counter >= 1 &&  reg_counter<= 10)
				begin
					keyArr[reg_counter] <= Gen_Key;
					prevKey <= Gen_Key;
					reg_counter <= reg_counter + 1'b1;
				end
		
				else 
				begin 
					trival <= trival+1'b1;
				end
			end 	
/*			
2'b10: //output of key inverse 	
		begin
				targetKey <= keyArr[10-Round];
		end 
*/				
default : 
				//targetKey <= keyArr[0]; 
				trival <= trival;
				
				
endcase
end

always @ ( posedge clk) 
begin
	targetKey <= keyArr[10-Round];
end

assign outKey = targetKey; 
endmodule
