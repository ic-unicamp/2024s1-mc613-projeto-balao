module bcd(
	input [19:0] num2,
	input [19:0] num1,
	output reg [6:0] HEX0,
	output reg [6:0] HEX1,
	output reg [6:0] HEX2,
	output reg [6:0] HEX3,
	output reg [6:0] HEX4,
	output reg [6:0] HEX5
);

reg [19:0] bin;
integer i;
reg [23:0] bcd = 0;
reg [3:0] d0=0;
reg [3:0] d1=0;
reg [3:0] d2=0;
reg [3:0] d3=0;
reg [3:0] d4=0;
reg [3:0] d5=0;

always @(*) begin
		bcd = 0;
		bin = num1;
		
		for (i=0;i<20;i=i+1) begin					//Iterate once for each bit in input number
		  if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
			if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
			if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
			if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
			if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 3;
			if (bcd[23:20] >= 5) bcd[23:20] = bcd[23:20] + 3;
			bcd = {bcd[22:0],bin[19-i]};				//Shift one bit, and shift in proper bit from input 
		end
		
		d0 = bcd[3:0];
		d1 = bcd[7:4];
		d2 = bcd[11:8];
		
		
		bcd = 0;
		bin = num2;
		
		for (i=0;i<20;i=i+1) begin					//Iterate once for each bit in input number
		  if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
		  if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
		  if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
			if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
			if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 3;
			if (bcd[23:20] >= 5) bcd[23:20] = bcd[23:20] + 3;
			bcd = {bcd[22:0],bin[19-i]};				//Shift one bit, and shift in proper bit from input 
		end
		
		d3 = bcd[3:0];
		d4 = bcd[7:4];
		d5 = bcd[11:8];
end

always @(*) begin

	case(d0)

		4'b0000: HEX0 = 7'b1000000; // 0
		4'b0001: HEX0 = 7'b1111001; // 1
		4'b0010: HEX0 = 7'b0100100; // 2
		4'b0011: HEX0 = 7'b0110000; // 3
		4'b0100: HEX0 = 7'b0011001; // 4
		4'b0101: HEX0 = 7'b0010010; // 5
		4'b0110: HEX0 = 7'b0000010; // 6
		4'b0111: HEX0 = 7'b1111000; // 7
		4'b1000: HEX0 = 7'b0000000; // 8
		4'b1001: HEX0 = 7'b0011000; // 9
		default: HEX0= 7'b1111111; // Entrada inválida
	endcase
	
	case(d1)

		4'b0000: HEX1 = 7'b1000000; // 0
		4'b0001: HEX1 = 7'b1111001; // 1
		4'b0010: HEX1 = 7'b0100100; // 2
		4'b0011: HEX1 = 7'b0110000; // 3
		4'b0100: HEX1 = 7'b0011001; // 4
		4'b0101: HEX1 = 7'b0010010; // 5
		4'b0110: HEX1 = 7'b0000010; // 6
		4'b0111: HEX1 = 7'b1111000; // 7
		4'b1000: HEX1 = 7'b0000000; // 8
		4'b1001: HEX1 = 7'b0011000; // 9
		default: HEX1= 7'b1111111; // Entrada inválida
	endcase
	
	case(d2)

		4'b0000: HEX2 = 7'b1000000; // 0
		4'b0001: HEX2 = 7'b1111001; // 1
		4'b0010: HEX2 = 7'b0100100; // 2
		4'b0011: HEX2 = 7'b0110000; // 3
		4'b0100: HEX2 = 7'b0011001; // 4
		4'b0101: HEX2 = 7'b0010010; // 5
		4'b0110: HEX2 = 7'b0000010; // 6
		4'b0111: HEX2 = 7'b1111000; // 7
		4'b1000: HEX2 = 7'b0000000; // 8
		4'b1001: HEX2 = 7'b0011000; // 9
		default: HEX2= 7'b1111111; // Entrada inválida
	endcase
	
	case(d3)

		4'b0000: HEX3 = 7'b1000000; // 0
		4'b0001: HEX3 = 7'b1111001; // 1
		4'b0010: HEX3 = 7'b0100100; // 2
		4'b0011: HEX3 = 7'b0110000; // 3
		4'b0100: HEX3 = 7'b0011001; // 4
		4'b0101: HEX3 = 7'b0010010; // 5
		4'b0110: HEX3 = 7'b0000010; // 6
		4'b0111: HEX3= 7'b1111000; // 7
		4'b1000: HEX3 = 7'b0000000; // 8
		4'b1001: HEX3 = 7'b0011000; // 9
		default: HEX3= 7'b1111111; // Entrada inválida
	endcase
	
	case(d4)

		4'b0000: HEX4 = 7'b1000000; // 0
		4'b0001: HEX4 = 7'b1111001; // 1
		4'b0010: HEX4 = 7'b0100100; // 2
		4'b0011: HEX4 = 7'b0110000; // 3
		4'b0100: HEX4 = 7'b0011001; // 4
		4'b0101: HEX4 = 7'b0010010; // 5
		4'b0110: HEX4 = 7'b0000010; // 6
		4'b0111: HEX4 = 7'b1111000; // 7
		4'b1000: HEX4 = 7'b0000000; // 8
		4'b1001: HEX4 = 7'b0011000; // 9
		default: HEX4= 7'b1111111; // Entrada inválida
	endcase
	
	case(d5)

		4'b0000: HEX5 = 7'b1000000; // 0
		4'b0001: HEX5 = 7'b1111001; // 1
		4'b0010: HEX5 = 7'b0100100; // 2
		4'b0011: HEX5 = 7'b0110000; // 3
		4'b0100: HEX5 = 7'b0011001; // 4
		4'b0101: HEX5 = 7'b0010010; // 5
		4'b0110: HEX5 = 7'b0000010; // 6
		4'b0111: HEX5 = 7'b1111000; // 7
		4'b1000: HEX5 = 7'b0000000; // 8
		4'b1001: HEX5 = 7'b0011000; // 9
		default: HEX5=  7'b1111111; // Entrada inválida
	endcase
	
	 
end

endmodule

module display(
	input [3:0] d0,
	input [3:0] d1,
	input [3:0] d2,
	input [3:0] d3,
	input [3:0] d4,
	input [3:0] d5,
	output reg [6:0] digito0, // digito da direita
   output reg [6:0] digito1,
   output reg [6:0] digito2,
   output reg [6:0] digito3,
   output reg [6:0] digito4,
   output reg [6:0] digito5 // digito da esquerda
);

always @(*) begin

	case(d0)

		4'b0000: digito0 = 7'b1000000; // 0
		4'b0001: digito0 = 7'b1111001; // 1
		4'b0010: digito0 = 7'b0100100; // 2
		4'b0011: digito0 = 7'b0110000; // 3
		4'b0100: digito0 = 7'b0011001; // 4
		4'b0101: digito0 = 7'b0010010; // 5
		4'b0110: digito0 = 7'b0000010; // 6
		4'b0111: digito0 = 7'b1111000; // 7
		4'b1000: digito0 = 7'b0000000; // 8
		4'b1001: digito0 = 7'b0011000; // 9
		default: digito0= 7'b1111111; // Entrada inválida
	endcase
	
	case(d1)

		4'b0000: digito1 = 7'b1000000; // 0
		4'b0001: digito1 = 7'b1111001; // 1
		4'b0010: digito1 = 7'b0100100; // 2
		4'b0011: digito1 = 7'b0110000; // 3
		4'b0100: digito1 = 7'b0011001; // 4
		4'b0101: digito1 = 7'b0010010; // 5
		4'b0110: digito1 = 7'b0000010; // 6
		4'b0111: digito1 = 7'b1111000; // 7
		4'b1000: digito1 = 7'b0000000; // 8
		4'b1001: digito1 = 7'b0011000; // 9
		default: digito1= 7'b1111111; // Entrada inválida
	endcase
	
	case(d2)

		4'b0000: digito2 = 7'b1000000; // 0
		4'b0001: digito2 = 7'b1111001; // 1
		4'b0010: digito2 = 7'b0100100; // 2
		4'b0011: digito2 = 7'b0110000; // 3
		4'b0100: digito2 = 7'b0011001; // 4
		4'b0101: digito2 = 7'b0010010; // 5
		4'b0110: digito2 = 7'b0000010; // 6
		4'b0111: digito2 = 7'b1111000; // 7
		4'b1000: digito2 = 7'b0000000; // 8
		4'b1001: digito2 = 7'b0011000; // 9
		default: digito2= 7'b1111111; // Entrada inválida
	endcase
	
	case(d3)

		4'b0000: digito3 = 7'b1000000; // 0
		4'b0001: digito3 = 7'b1111001; // 1
		4'b0010: digito3 = 7'b0100100; // 2
		4'b0011: digito3 = 7'b0110000; // 3
		4'b0100: digito3 = 7'b0011001; // 4
		4'b0101: digito3 = 7'b0010010; // 5
		4'b0110: digito3 = 7'b0000010; // 6
		4'b0111: digito3= 7'b1111000; // 7
		4'b1000: digito3 = 7'b0000000; // 8
		4'b1001: digito3 = 7'b0011000; // 9
		default: digito3= 7'b1111111; // Entrada inválida
	endcase
	
	case(d4)

		4'b0000: digito4 = 7'b1000000; // 0
		4'b0001: digito4 = 7'b1111001; // 1
		4'b0010: digito4 = 7'b0100100; // 2
		4'b0011: digito4 = 7'b0110000; // 3
		4'b0100: digito4 = 7'b0011001; // 4
		4'b0101: digito4 = 7'b0010010; // 5
		4'b0110: digito4 = 7'b0000010; // 6
		4'b0111: digito4 = 7'b1111000; // 7
		4'b1000: digito4 = 7'b0000000; // 8
		4'b1001: digito4 = 7'b0011000; // 9
		default: digito4= 7'b1111111; // Entrada inválida
	endcase
	
	case(d5)

		4'b0000: digito5 = 7'b1000000; // 0
		4'b0001: digito5 = 7'b1111001; // 1
		4'b0010: digito5 = 7'b0100100; // 2
		4'b0011: digito5 = 7'b0110000; // 3
		4'b0100: digito5 = 7'b0011001; // 4
		4'b0101: digito5 = 7'b0010010; // 5
		4'b0110: digito5 = 7'b0000010; // 6
		4'b0111: digito5 = 7'b1111000; // 7
		4'b1000: digito5 = 7'b0000000; // 8
		4'b1001: digito5 = 7'b0011000; // 9
		default: digito5=  7'b1111111; // Entrada inválida
	endcase
	
	 
end

endmodule




module vga_mod (  
    input [9:0] sx,
    input [9:0] sy,
    output reg  vga_hs,     
    output reg  vga_vs,     
    output vga_blank_n,  
    output vga_sync_n
);
	assign vga_sync_n = 0; assign vga_blank_n = 1;	
	
   // horizontal timings
    parameter HA_END = 639;           
    parameter HS_STA = HA_END + 16;    
    parameter HS_END = HS_STA + 96;   

    // vertical timings
    parameter VA_END = 479;           
    parameter VS_STA = VA_END + 10;   
    parameter VS_END = VS_STA + 2;    

	 always @(*) begin
      vga_hs = ~(sx >= HS_STA && sx < HS_END);  
      vga_vs = ~(sy >= VS_STA && sy < VS_END);  		
    end
	 
	 
endmodule

module pong (
    input wire clk,   // pixel clock (25 MHz)
    input key_LEFT2,
    input key_RIGHT2,
    input key_LEFT1,
    input key_RIGHT1,
	 input key_START,
    output VGA_HS,     // horizontal sync
    output VGA_VS,     // vertical sync
    output VGA_BLANK_N,  // data enable (low in blanking interval)
    output VGA_SYNC_N,
    output reg [7:0] VGA_R,
    output reg [7:0] VGA_G,
    output reg [7:0] VGA_B,
    output VGA_CLK,
	 output [6:0] HEX0,
	 output [6:0] HEX1,
	 output [6:0] HEX2,
	 output [6:0] HEX3,
	 output [6:0] HEX4,
	 output [6:0] HEX5
);

reg rst_vga=0;
reg [19:0] count = 0;
reg clk_mov = 0;
reg vga_clk = 0;
reg [19:0] maior = 0;
reg [19:0] placar = 0;
integer meta = 20'b01111111111111111111;

assign VGA_CLK = vga_clk;

always @(posedge clk) begin
	clk_mov = 0;
	if(rst_vga) begin
		vga_clk = 0;
	end else begin
		vga_clk = ~vga_clk;
		count = count + 1;
	end
	if (count == meta) begin
		count = 0;
		clk_mov = 1;
	end
	
end
	 
reg [9:0] sx = 0;  // horizontal screen position
reg [9:0] sy = 0;  // vertical screen position
	 
    // calculate horizontal and vertical screen position
always @(posedge vga_clk) begin
        if (sx == 799) begin  
            sx <= 0;
            sy <= (sy == 524) ? 0 : sy + 1;
        end else begin
            sx <= sx + 1;
        end
        if (rst_vga) begin
            sx <= 0;
            sy <= 0;
        end
    end

	// sx é a coluna, sy é a linha
reg square=0,p=0, barra1 = 0, barra2 = 0;

reg [9:0] barra1_x = 580;  
reg [9:0] barra1_y = 240;
reg [9:0] barra2_x = 60;  
reg [9:0] barra2_y = 240; 
 
parameter largura = 4;
reg estado = 0;

always@(posedge VGA_CLK) begin
	p = (sy >= 0 && sy < 480 && sx >=0 && sx < 640);
   square = (sy >= (bola_y-largura) && sy<(bola_y+largura) && sx>=(bola_x-largura) && sx<(bola_x+largura));		  
	barra1 = (sy >= (barra1_y-42) && sy<(barra1_y+42) && sx>=(barra1_x-2) && sx<(barra1_x+2));		
	barra2 = (sy >= (barra2_y-42) && sy<(barra2_y+42) && sx>=(barra2_x-2) && sx<(barra2_x+2));
	
	VGA_R = (p && (square || barra1 || barra2)) ? 255 : 0;
	VGA_G = (p && (square || barra1 || barra2)) ? 255 : 0;
	VGA_B = (p && (square || barra1 || barra2)) ? 255 : 0;
end
//PARTE QUE CONTROLA A barra1
 always@(posedge clk_mov) begin

	 if(~key_RIGHT1) begin
		  if (barra1_y + 42 < 480) begin
			barra1_y = barra1_y+2;
		  end
	 end
	 if (~key_LEFT1) begin
			if (barra1_y - 42 > 0) begin
			barra1_y = barra1_y-2;
		  end
	 end
	 if(~key_RIGHT2) begin
		  if (barra2_y + 42 < 480) begin
			barra2_y = barra2_y+2;
		  end
	 end
	 if (~key_LEFT2) begin
			if (barra2_y - 42 > 0) begin
			barra2_y = barra2_y-2;
		  end
	 end
	 
	 if (estado_jogo == 0) begin
		barra1_x = 580;
		barra1_y = 240;
		barra2_x = 60;
		barra2_y = 240;
	 end
				
 end

reg [9:0] bola_x = 320;  // qx coluna square
reg [9:0] bola_y = 240;  // qy linha square
reg [9:0] vx = 1;
reg [9:0] vy = 1;

reg [1:0] estado_x = 2; //estado que indica se ta indo pra direita, pra esquerda ou reto
reg estado_y = 0; //estado que indica se ta indo pra cima ou pra baixo
reg estado_jogo = 0; //0 significa que ta tudo parado e 1 significa que o jogo ta rolando

//PARTE QUE CONTROLA O MOVIMENTO DA BOLA NO JOGO
always@(posedge clk_mov) begin
	
	if (key_START) begin
		estado_jogo = 1;
	end
	
	if (estado_jogo) begin
		case(estado_x)
		
			2'b00: begin //bolinha indo horizontalmente
			
				if(estado_y == 0) begin // ta indo pra direita
					if (bola_x + largura < barra1_x - 2) begin
						bola_x = bola_x + vx; //continua indo pra direita
					end
					else if ((bola_x + largura == barra1_x - 2) && ((bola_y + largura < barra1_y - 42) || (bola_y - largura > barra1_y + 42))) begin //morreu
						estado_jogo = 0;
						maior = maior + 1;
					end
					else begin
						 estado_y = 1; //bateu na barra1 e foi pra esquerda agora
						 
						 meta = meta - 10000;	 
					end
					
				end
				else begin // indo pra esquerda
					if (bola_x - largura > barra2_x + 2) begin
						bola_x = bola_x - vx; //continua indo pra esquerda
					end
					else if ((bola_x - largura == barra2_x + 2) && ((bola_y + largura < barra2_y - 42) || (bola_y - largura > barra2_y + 42))) begin //acabou
						estado_jogo = 0;
						placar = placar + 1;
					end
					else begin
						 estado_y = 0; //bateu na barra2 e foi pra direita agora
						 
						 meta = meta - 10000;
					end
				end	
				
				if ((bola_x + largura) == (barra1_x - 2)) begin //ta no nivel da barra1, entao preciso ver a mudanca de direcao
					if (((bola_y + largura) >= (barra1_y - 42)) && ((bola_y + largura) <= (barra1_y - 14))) begin //bateu no primeiro terco da barra1
						estado_x = 1;
					end
					else if (((bola_y + largura) >= (barra1_y - 14)) && ((bola_y + largura) <= (barra1_y + 14))) begin //bateu no segundo terco da barra1
						estado_x = 0;
					end
					else if (((bola_y - largura) >= (barra1_y + 14)) && ((bola_y - largura) <= (barra1_y + 42))) begin //bateu no terceiro terco da barra1
						estado_x = 2;
					end
				end
				else if ((bola_x - largura) == (barra2_x + 2)) begin
					if (((bola_y + largura) >= (barra2_y - 42)) && ((bola_y + largura) <= (barra2_y - 14))) begin //bateu no primeiro terco da barra1
						estado_x = 1;
					end
					else if (((bola_y + largura) >= (barra2_y - 14)) && ((bola_y + largura) <= (barra2_y + 14))) begin //bateu no primeiro terco da barra1
						estado_x = 0;
					end
					else if (((bola_y - largura) >= (barra2_y + 14)) && ((bola_y - largura) <= (barra2_y + 42))) begin //bateu no primeiro terco da barra1
						estado_x = 2;
					end
					
				end
				
			end
			
			2'b01: begin //bolinha indo pra cima
				
				if(estado_y == 0) begin // ta indo pra direita
					if (bola_x + largura < barra1_x - 2) begin
						bola_x = bola_x + vx; //continua indo pra direita
					end
					else if ((bola_x + largura == barra1_x - 2) && ((bola_y + largura < barra1_y - 42) || (bola_y - largura > barra1_y + 42))) begin //morreu
						estado_jogo = 0;
						maior = maior + 1;
					end
					else begin
						 estado_y = 1; //bateu na barra1 e foi pra esquerda agora
						 
						 meta = meta - 10000;	 
					end
					
				end
				else begin // indo pra esquerda
					if (bola_x - largura > barra2_x + 2) begin
						bola_x = bola_x - vx; //continua indo pra esquerda
					end
					else if ((bola_x - largura == barra2_x + 2) && ((bola_y + largura < barra2_y - 42) || (bola_y - largura > barra2_y + 42))) begin //acabou
						estado_jogo = 0;
						placar = placar + 1;
					end
					else begin
						 estado_y = 0; //bateu na barra2 e foi pra direita agora
						 
						 meta = meta - 10000;
					end
				end
				
				if ((bola_x + largura) == (barra1_x - 2)) begin //ta no nivel da barra1, entao preciso ver a mudanca de direcao
					if (((bola_y + largura) >= (barra1_y - 42)) && ((bola_y + largura) <= (barra1_y - 14))) begin //bateu no primeiro terco da barra1
						estado_x = 1;
					end
					else if (((bola_y + largura) >= (barra1_y - 14)) && ((bola_y + largura) <= (barra1_y + 14))) begin //bateu no primeiro terco da barra1
						estado_x = 0;
					end
					else if (((bola_y - largura) >= (barra1_y + 14)) && ((bola_y - largura) <= (barra1_y + 42))) begin //bateu no primeiro terco da barra1
						estado_x = 2;
					end
				end
				
				else if ((bola_x - largura) == (barra2_x + 2)) begin
					if (((bola_y + largura) >= (barra2_y - 42)) && ((bola_y + largura) <= (barra2_y - 14))) begin //bateu no primeiro terco da barra1
						estado_x = 1;
					end
					else if (((bola_y + largura) >= (barra2_y - 14)) && ((bola_y + largura) <= (barra2_y + 14))) begin //bateu no primeiro terco da barra1
						estado_x = 0;
					end
					else if (((bola_y - largura) >= (barra2_y + 14)) && ((bola_y - largura) <= (barra2_y + 42))) begin //bateu no primeiro terco da barra1
						estado_x = 2;
					end
					
				end else begin
					if ((bola_y - largura) > 0) begin
						bola_y = bola_y - vy;
					end
					else begin
						estado_x = 2;
					end
				end
			
			end
			
			2'b10: begin // indo pra baixo
				
				if(estado_y == 0) begin // ta indo pra direita
					if (bola_x + largura < barra1_x - 2) begin
						bola_x = bola_x + vx; //continua indo pra direita
					end
					else if ((bola_x + largura == barra1_x - 2) && ((bola_y + largura < barra1_y - 42) || (bola_y - largura > barra1_y + 42))) begin //morreu
						estado_jogo = 0;
						maior = maior + 1;
					end
					else begin
						 estado_y = 1; //bateu na barra1 e foi pra esquerda agora
						 
						 meta = meta - 10000;	 
					end
					
				end
				else begin // indo pra esquerda
					if (bola_x - largura > barra2_x + 2) begin
						bola_x = bola_x - vx; //continua indo pra esquerda
					end
					else if ((bola_x - largura == barra2_x + 2) && ((bola_y + largura < barra2_y - 42) || (bola_y - largura > barra2_y + 42))) begin //acabou
						estado_jogo = 0;
						placar = placar + 1;
					end
					else begin
						 estado_y = 0; //bateu na barra2 e foi pra direita agora
						 
						 meta = meta - 10000;
					end
				end	
				
				if ((bola_x + largura) == (barra1_x - 2)) begin //ta no nivel da barra1, entao preciso ver a mudanca de direcao
					if (((bola_y + largura) >= (barra1_y - 42)) && ((bola_y + largura) <= (barra1_y - 14))) begin //bateu no primeiro terco da barra1
						estado_x = 1;
					end
					else if (((bola_y + largura) >= (barra1_y - 14)) && ((bola_y + largura) <= (barra1_y + 14))) begin //bateu no primeiro terco da barra1
						estado_x = 0;
					end
					else if (((bola_y - largura) >= (barra1_y + 14)) && ((bola_y - largura) <= (barra1_y + 42))) begin //bateu no primeiro terco da barra1
						estado_x = 2;
					end
				end
				else if ((bola_x - largura) == (barra2_x + 2)) begin
					if (((bola_y + largura) >= (barra2_y - 42)) && ((bola_y + largura) <= (barra2_y - 14))) begin //bateu no primeiro terco da barra1
						estado_x = 1;
					end
					else if (((bola_y + largura) >= (barra2_y - 14)) && ((bola_y + largura) <= (barra2_y + 14))) begin //bateu no primeiro terco da barra1
						estado_x = 0;
					end
					else if (((bola_y - largura) >= (barra2_y + 14)) && ((bola_y - largura) <= (barra2_y + 42))) begin //bateu no primeiro terco da barra1
						estado_x = 2;
					end
					
				end
				else begin
					
					if ((bola_y + largura) < 480) begin
						bola_y = bola_y + vy;
					end
					else begin
						estado_x = 1;
					end
				
				end
			end
			
		endcase
	end
	
	else begin
		bola_x = 320;
		bola_y = 240;
		meta = 20'b01111111111111111111;
	end
end 

	vga_mod vga (
		.sx(sx),
		.sy(sy),
		.vga_hs(VGA_HS),
		.vga_vs(VGA_VS),
		.vga_blank_n(VGA_BLANK_N),
		.vga_sync_n(VGA_SYNC_N)
	);
	
	bcd b (
		.num2(maior),
		.num1(placar),
		.HEX0(HEX0),
		.HEX1(HEX1),
		.HEX2(HEX2),
		.HEX3(HEX3),
		.HEX4(HEX4),
		.HEX5(HEX5)
	);

endmodule