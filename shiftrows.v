`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Snowballs
// Engineer: Amr Eid
// 
// Create Date:    17:19:34 04/19/2019 
// Design Name: 
// Module Name:    shiftrows 
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
module shiftrows(message_input,message_output_col,counter_col,Round
    );
	 
input  wire [127:0] message_input;
output wire [31:0]  message_output_col;
input  wire [3:0]   Round;
input  wire [1:0]   counter_col;

wire [31:0] firstCol,secondCol,thirdCol,fourthCol;

/* 
before shift    	after shift

16	12	8	4		16	12	8	4
15	11	7	3		3	15	11	7
14	10	6	2		6	2	14	10
13	9	5	1		9	5	1	13
*/


//if round equales 0,DON'T SHIFTROWS,out original Columns 
//Do shiftrows on mtrix and find what elements in every col in the resulted matrix 
assign firstCol  = (Round!=4'b0)? ({message_input[127:120],message_input[23:16]  ,message_input[47:40]  ,message_input[71:64]}) :message_input[127:96];
assign secondCol = (Round!=4'b0)? ({message_input[95:88]  ,message_input[119:112],message_input[15:8]   ,message_input[39:32]}) :message_input[95:64];
assign thirdCol  = (Round!=4'b0)? ({message_input[63:56]  ,message_input[87:80]  ,message_input[111:104],message_input[7:0]})   :message_input[64:32];
assign fourthCol = (Round!=4'b0)? ({message_input[31:24]  ,message_input[55:48]  ,message_input[79:72]  ,message_input[103:96]}):message_input[31:0] ;


assign message_output_col = counter_col[1] ? (counter_col[0] ? fourthCol : thirdCol) : (counter_col[0] ? secondCol : firstCol);

endmodule
