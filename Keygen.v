`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:20 04/25/2019 
// Design Name: 
// Module Name:    Key_gen 
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
module Keygen(prev_key,output_key,reg_counter
    );
	 
input  [127:0] prev_key ;
input  [3:0] reg_counter;
output [127:0] output_key ;


wire   [31:0] new_col_4, prev_col_1 ,prev_col_2 ,prev_col_3 , prev_col_4 , First , Seconed , Third , Fourth;
wire   [31:0] rcon;
reg    [7 : 0] rcon_bits ;



assign prev_col_1=prev_key[127:96];
assign prev_col_2=prev_key[95:64];
assign prev_col_3=prev_key[63:32];
assign prev_col_4={prev_key[23:0],prev_key[31:24]};

ssbox Mapping (.input_col(prev_col_4),.output_col(new_col_4));


//zero extinsion
assign rcon={rcon_bits,24'h000000};

assign First = new_col_4^rcon^prev_col_1;
assign Seconed =First^prev_col_2;
assign Third   = Seconed^prev_col_3;
assign Fourth  = Third^prev_key[31:0];

assign output_key={First,Seconed,Third,Fourth};

/*
initial 
begin
			rcon_bits[7:0]= 8'h01; 			
end 
*/
	
always @(*)
begin
	case(reg_counter)
	
	4'h1:begin
				rcon_bits[7:0]=8'h01;
		 end
	
	4'h2:begin
				rcon_bits[7:0]=8'h02;
		 end
	
	4'h3:begin
				rcon_bits[7:0]=8'h04;
		end

	4'h4:begin
				rcon_bits[7:0]=8'h08;
		 end

	4'h5:begin
				rcon_bits[7:0]=8'h10;
		 end

	4'h6:begin
				rcon_bits[7:0]=8'h20;
		end
			 
	4'h7:begin
				rcon_bits[7:0]=8'h40;
		 end
			 
	4'h8:begin
				rcon_bits[7:0]=8'h80;
		 end
			 
	4'h9:begin
				rcon_bits[7:0]=8'h1b;
		 end
			 
	4'hA:begin
				rcon_bits[7:0]=8'h36;
		 end
		 
	default:
			rcon_bits = 0;
endcase
end

endmodule 
