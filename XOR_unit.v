`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:51 04/19/2019 
// Design Name: 
// Module Name:    XOR_unit 
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
module XOR_unit(inputData,outputData,key,messageCounterCol 
    );
	 
input [31:0]  inputData;
input [127:0] key;
input [1:0]   messageCounterCol;
output[31:0]  outputData;

wire [31:0] firstCol,secondCol,thirdCol,fourthCol;

assign firstCol  =key[127:96]^inputData;
assign secondCol =key[95:64] ^inputData;
assign thirdCol  =key[63:32] ^inputData;
assign fourthCol =key[31:0]  ^inputData;

//choose which output depends on which col  
assign outputData = messageCounterCol[1] ? (messageCounterCol[0] ? fourthCol : thirdCol) : (messageCounterCol[0] ? secondCol : firstCol);



endmodule
