`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:02:57 04/26/2019 
// Design Name: 
// Module Name:    clockdivider 
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
module clockdivider(clk,clk_out,clk_out2
    );

input clk;
output clk_out,clk_out2;
reg reg_clk,reg_clk2;
reg [9:0] counter;


initial
begin
counter = 10'b0;
//counter2= 4'b0;
reg_clk = 0;
end

always @(posedge clk)
begin

if(counter ==10'd1023)
begin
counter <= 10'd0;
reg_clk <= ~(reg_clk);
end
else
counter<=counter+1;
end





assign clk_out = reg_clk;
assign clk_out2 = clk;

endmodule
