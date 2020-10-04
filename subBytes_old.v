`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:25 04/19/2019 
// Design Name: 
// Module Name:    Sbox 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
///////////ame: sub_bytes
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module subBytes(
    input [31:0] input_col,
    output [31:0] output_col
    );

//A song of Wires and Regs
reg [31:0] working_reg;

assign output_col = working_reg;

wire [7:0] output_col_byte1, output_col_byte2, output_col_byte3, output_col_byte4;
sbox SBOX(
.input_byte(input_col[7:0]),
.output_byte(output_col_byte1)
);
sbox SBOX2(
.input_byte(input_col[15:8]),
.output_byte(output_col_byte2)
);

sbox SBOX3(
.input_byte(input_col[23:16]),
.output_byte(output_col_byte3)
);
sbox SBO4(
.input_byte(input_col[31:24]),
.output_byte(output_col_byte4)
);
/*
initial
begin
    working_reg = 0;
end
*/

always@(*)
begin
    working_reg[7:0]   = output_col_byte1;
    working_reg[15:8]  = output_col_byte2;
    working_reg[23:16] = output_col_byte3;
    working_reg[31:24] = output_col_byte4;
end    
    
endmodule
