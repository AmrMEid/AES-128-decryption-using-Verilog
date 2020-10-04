`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2019 11:59:23 PM
// Design Name: 
// Module Name: sbox
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


module sbox(input_byte, output_byte);

input wire [7:0] input_byte;
output wire[7:0] output_byte;

wire [5:0] selector;
wire [1:0] second_selector;
reg  [7:0] out_1, out_2, out_3, out_4;
reg  [7:0] final_out;

assign selector = input_byte[5:0];
assign second_selector = input_byte[7:6];

assign output_byte = final_out;


always@(*)
begin
    case(second_selector)
        2'b00: final_out = out_1;
        2'b01: final_out = out_2;
        2'b10: final_out = out_3;
        2'b11: final_out = out_4;
    endcase
end
/*************************************************************************/
 always@(*)
 begin  
    case(selector)
       6'h00: out_1 = 8'h52;
       6'h01: out_1 = 8'h09;
       6'h02: out_1 = 8'h6a;
       6'h03: out_1 = 8'hd5;
       6'h04: out_1 = 8'h30;
       6'h05: out_1 = 8'h36;
       6'h06: out_1 = 8'ha5;
       6'h07: out_1 = 8'h38;
       6'h08: out_1 = 8'hbf;
       6'h09: out_1 = 8'h40;
       6'h0a: out_1 = 8'ha3;
       6'h0b: out_1 = 8'h9e;
       6'h0c: out_1 = 8'h81;
       6'h0d: out_1 = 8'hf3;
       6'h0e: out_1 = 8'hd7;
       6'h0f: out_1 = 8'hfb;
       6'h10: out_1 = 8'h7c;
       6'h11: out_1 = 8'he3;
       6'h12: out_1 = 8'h39;
       6'h13: out_1 = 8'h82;
       6'h14: out_1 = 8'h9b;
       6'h15: out_1 = 8'h2f;
       6'h16: out_1 = 8'hff;
       6'h17: out_1 = 8'h87;
       6'h18: out_1 = 8'h34;
       6'h19: out_1 = 8'h8e;
       6'h1a: out_1 = 8'h43;
       6'h1b: out_1 = 8'h44;
       6'h1c: out_1 = 8'hc4;
       6'h1d: out_1 = 8'hde;
       6'h1e: out_1 = 8'he9;
       6'h1f: out_1 = 8'hcb;
       6'h20: out_1 = 8'h54;
       6'h21: out_1 = 8'h7b;
       6'h22: out_1 = 8'h94;
       6'h23: out_1 = 8'h32;
       6'h24: out_1 = 8'ha6;
       6'h25: out_1 = 8'hc2;
       6'h26: out_1 = 8'h23;
       6'h27: out_1 = 8'h3d;
       6'h28: out_1 = 8'hee;
       6'h29: out_1 = 8'h4c;
       6'h2a: out_1 = 8'h95;
       6'h2b: out_1 = 8'h0b;
       6'h2c: out_1 = 8'h42;
       6'h2d: out_1 = 8'hfa;
       6'h2e: out_1 = 8'hc3;
       6'h2f: out_1 = 8'h4e;
       6'h30: out_1 = 8'h08;
       6'h31: out_1 = 8'h2e;
       6'h32: out_1 = 8'ha1;
       6'h33: out_1 = 8'h66;
       6'h34: out_1 = 8'h28;
       6'h35: out_1 = 8'hd9;
       6'h36: out_1 = 8'h24;
       6'h37: out_1 = 8'hb2;
       6'h38: out_1 = 8'h76;
       6'h39: out_1 = 8'h5b;
       6'h3a: out_1 = 8'ha2;
       6'h3b: out_1 = 8'h49;
       6'h3c: out_1 = 8'h6d;
       6'h3d: out_1 = 8'h8b;
       6'h3e: out_1 = 8'hd1;
       6'h3f: out_1 = 8'h25;
   endcase
end

always@(*)
begin
    case(selector)
       6'h00: out_2 = 8'h72;
       6'h01: out_2 = 8'hf8;
       6'h02: out_2 = 8'hf6;
       6'h03: out_2 = 8'h64;
       6'h04: out_2 = 8'h86;
       6'h05: out_2 = 8'h68;
       6'h06: out_2 = 8'h98;
       6'h07: out_2 = 8'h16;
       6'h08: out_2 = 8'hd4;
       6'h09: out_2 = 8'ha4;
       6'h0a: out_2 = 8'h5c;
       6'h0b: out_2 = 8'hcc;
       6'h0c: out_2 = 8'h5d;
       6'h0d: out_2 = 8'h65;
       6'h0e: out_2 = 8'hb6;
       6'h0f: out_2 = 8'h92;
       6'h10: out_2 = 8'h6c;
       6'h11: out_2 = 8'h70;
       6'h12: out_2 = 8'h48;
       6'h13: out_2 = 8'h50;
       6'h14: out_2 = 8'hfd;
       6'h15: out_2 = 8'hed;
       6'h16: out_2 = 8'hb9;
       6'h17: out_2 = 8'hda;
       6'h18: out_2 = 8'h5e;
       6'h19: out_2 = 8'h15;
       6'h1a: out_2 = 8'h46;
       6'h1b: out_2 = 8'h57;
       6'h1c: out_2 = 8'ha7;
       6'h1d: out_2 = 8'h8d;
       6'h1e: out_2 = 8'h9d;
       6'h1f: out_2 = 8'h84;
       6'h20: out_2 = 8'h90;
       6'h21: out_2 = 8'hd8;
       6'h22: out_2 = 8'hab;
       6'h23: out_2 = 8'h00;
       6'h24: out_2 = 8'h8c;
       6'h25: out_2 = 8'hbc;
       6'h26: out_2 = 8'hd3;
       6'h27: out_2 = 8'h0a;
       6'h28: out_2 = 8'hf7;
       6'h29: out_2 = 8'he4;
       6'h2a: out_2 = 8'h58;
       6'h2b: out_2 = 8'h05;
       6'h2c: out_2 = 8'hb8;
       6'h2d: out_2 = 8'hb3;
       6'h2e: out_2 = 8'h45;
       6'h2f: out_2 = 8'h06;
       6'h30: out_2 = 8'hd0;
       6'h31: out_2 = 8'h2c;
       6'h32: out_2 = 8'h1e;
       6'h33: out_2 = 8'h8f;
       6'h34: out_2 = 8'hca;
       6'h35: out_2 = 8'h3f;
       6'h36: out_2 = 8'h0f;
       6'h37: out_2 = 8'h02;
       6'h38: out_2 = 8'hc1;
       6'h39: out_2 = 8'haf;
       6'h3a: out_2 = 8'hbd;
       6'h3b: out_2 = 8'h03;
       6'h3c: out_2 = 8'h01;
       6'h3d: out_2 = 8'h13;
       6'h3e: out_2 = 8'h8a;
       6'h3f: out_2 = 8'h6b;
	   endcase
	   end
	   
always@(*)
begin
    case(selector)
       6'h00: out_3 = 8'h3a;
       6'h01: out_3 = 8'h91;
       6'h02: out_3 = 8'h11;
       6'h03: out_3 = 8'h41;
       6'h04: out_3 = 8'h4f;
       6'h05: out_3 = 8'h67;
       6'h06: out_3 = 8'hdc;
       6'h07: out_3 = 8'hea;
       6'h08: out_3 = 8'h97;
       6'h09: out_3 = 8'hf2;
       6'h0a: out_3 = 8'hcf;
       6'h0b: out_3 = 8'hce;
       6'h0c: out_3 = 8'hf0;
       6'h0d: out_3 = 8'hb4;
       6'h0e: out_3 = 8'he6;
       6'h0f: out_3 = 8'h73;
       6'h10: out_3 = 8'h96;
       6'h11: out_3 = 8'hac;
       6'h12: out_3 = 8'h74;
       6'h13: out_3 = 8'h22;
       6'h14: out_3 = 8'he7;
       6'h15: out_3 = 8'had;
       6'h16: out_3 = 8'h35;
       6'h17: out_3 = 8'h85;
       6'h18: out_3 = 8'he2;
       6'h19: out_3 = 8'hf9;
       6'h1a: out_3 = 8'h37;
       6'h1b: out_3 = 8'he8;
       6'h1c: out_3 = 8'h1c;
       6'h1d: out_3 = 8'h75;
       6'h1e: out_3 = 8'hdf;
       6'h1f: out_3 = 8'h6e;
       6'h20: out_3 = 8'h47;
       6'h21: out_3 = 8'hf1;
       6'h22: out_3 = 8'h1a;
       6'h23: out_3 = 8'h71;
       6'h24: out_3 = 8'h1d;
       6'h25: out_3 = 8'h29;
       6'h26: out_3 = 8'hc5;
       6'h27: out_3 = 8'h89;
       6'h28: out_3 = 8'h6f;
       6'h29: out_3 = 8'hb7;
       6'h2a: out_3 = 8'h62;
       6'h2b: out_3 = 8'h0e;
       6'h2c: out_3 = 8'haa;
       6'h2d: out_3 = 8'h18;
       6'h2e: out_3 = 8'hbe;
       6'h2f: out_3 = 8'h1b;
       6'h30: out_3 = 8'hfc;
       6'h31: out_3 = 8'h56;
       6'h32: out_3 = 8'h3e;
       6'h33: out_3 = 8'h4b;
       6'h34: out_3 = 8'hc6;
       6'h35: out_3 = 8'hd2;
       6'h36: out_3 = 8'h79;
       6'h37: out_3 = 8'h20;
       6'h38: out_3 = 8'h9a;
       6'h39: out_3 = 8'hdb;
       6'h3a: out_3 = 8'hc0;
       6'h3b: out_3 = 8'hfe;
       6'h3c: out_3 = 8'h78;
       6'h3d: out_3 = 8'hcd;
       6'h3e: out_3 = 8'h5a;
       6'h3f: out_3 = 8'hf4;
	   endcase
	   end
	   
always@(*)
begin
    case(selector)
       6'h00: out_4 = 8'h1f;
       6'h01: out_4 = 8'hdd;
       6'h02: out_4 = 8'ha8;
       6'h03: out_4 = 8'h33;
       6'h04: out_4 = 8'h88;
       6'h05: out_4 = 8'h07;
       6'h06: out_4 = 8'hc7;
       6'h07: out_4 = 8'h31;
       6'h08: out_4 = 8'hb1;
       6'h09: out_4 = 8'h12;
       6'h0a: out_4 = 8'h10;
       6'h0b: out_4 = 8'h59;
       6'h0c: out_4 = 8'h27;
       6'h0d: out_4 = 8'h80;
       6'h0e: out_4 = 8'hec;
       6'h0f: out_4 = 8'h5f;
       6'h10: out_4 = 8'h60;
       6'h11: out_4 = 8'h51;
       6'h12: out_4 = 8'h7f;
       6'h13: out_4 = 8'ha9;
       6'h14: out_4 = 8'h19;
       6'h15: out_4 = 8'hb5;
       6'h16: out_4 = 8'h4a;
       6'h17: out_4 = 8'h0d;
       6'h18: out_4 = 8'h2d;
       6'h19: out_4 = 8'he5;
       6'h1a: out_4 = 8'h7a;
       6'h1b: out_4 = 8'h9f;
       6'h1c: out_4 = 8'h93;
       6'h1d: out_4 = 8'hc9;
       6'h1e: out_4 = 8'h9c;
       6'h1f: out_4 = 8'hef;
       6'h20: out_4 = 8'ha0;
       6'h21: out_4 = 8'he0;
       6'h22: out_4 = 8'h3b;
       6'h23: out_4 = 8'h4d;
       6'h24: out_4 = 8'hae;
       6'h25: out_4 = 8'h2a;
       6'h26: out_4 = 8'hf5;
       6'h27: out_4 = 8'hb0;
       6'h28: out_4 = 8'hc8;
       6'h29: out_4 = 8'heb;
       6'h2a: out_4 = 8'hbb;
       6'h2b: out_4 = 8'h3c;
       6'h2c: out_4 = 8'h83;
       6'h2d: out_4 = 8'h53;
       6'h2e: out_4 = 8'h99;
       6'h2f: out_4 = 8'h61;
       6'h30: out_4 = 8'h17;
       6'h31: out_4 = 8'h2b;
       6'h32: out_4 = 8'h04;
       6'h33: out_4 = 8'h7e;
       6'h34: out_4 = 8'hba;
       6'h35: out_4 = 8'h77;
       6'h36: out_4 = 8'hd6;
       6'h37: out_4 = 8'h26;
       6'h38: out_4 = 8'he1;
       6'h39: out_4 = 8'h69;
       6'h3a: out_4 = 8'h14;
       6'h3b: out_4 = 8'h63;
       6'h3c: out_4 = 8'h55;
       6'h3d: out_4 = 8'h21;
       6'h3e: out_4 = 8'h0c;
       6'h3f: out_4 = 8'h7d;
    endcase
end

endmodule
