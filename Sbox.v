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
module SUB(input_col,output_col,Round
    );


input  wire[31:0] input_col;
input  wire[3:0]  Round;
output wire[31:0] output_col;

//A song of Wires and Regs
wire [31:0] working_reg;

//No sub in first itration 
assign output_col = (Round == 4'b0000) ? input_col : working_reg;

wire [7:0] output_col_byte1, output_col_byte2, output_col_byte3, output_col_byte4;


sbox SBOX1(
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
sbox SBOX4(
.input_byte(input_col[31:24]),
.output_byte(output_col_byte4)
);


assign working_reg = {output_col_byte4,output_col_byte3,output_col_byte2,output_col_byte1};

endmodule
