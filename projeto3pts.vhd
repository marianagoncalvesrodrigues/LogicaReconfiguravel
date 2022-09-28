library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity projeto is 																	--cria entidade{ 
port (entrada1           	:  in std_logic_vector (3 DOWNTO 0) ;		--porta 'valor1 e valor2' vetor logico (4bits)
		entrada2           	:  in std_logic_vector (3 DOWNTO 0) ;
		selecao 					:	in std_logic := '0';
		resultado 				:	in std_logic := '0';
		saidalog 				: 	out std_logic_vector(7 DOWNTO 0);
		dsp1						:	out std_logic_vector (7 DOWNTO 0) ;		--display dos resultados
		dsp2						:	out std_logic_vector (7 DOWNTO 0) ;		--display das resultados
		dsp3						:	out std_logic_vector (7 DOWNTO 0) ;		--display das resultados
		dsp4						:	out std_logic_vector (7 DOWNTO 0) ;		--display das operações
		dsp5						:	out std_logic_vector (7 DOWNTO 0));		--display das operações
end projeto ;	

architecture logic of projeto is										--implementações do projeto; descreve as relações entre as portas.{
	--signal saida: STD_LOGIC_VECTOR(7 DOWNTO 0);							--objeto da arquitetura; saida do tipo vetor logico de 7 a 0 (8bits)
	signal saida: std_logic_vector(7 downto 0);
	signal cont : integer:=0;
	signal negativo : boolean;
	signal led : boolean;
	
BEGIN
	process(entrada, selecao)
		begin
			if(selecao = '1') then
				cont <= cont + 1;
			end if;
			
			case cont is
				when 0 =>
					disp5 <= "10100001";
					disp4 <= "10001000";
					saida <= entrada1 + entrada2;
					
				
				when 1 =>
					dsp5 <= "10000011";											--exibe operacao no display 1
					dsp4 <= "10010010";
					if(entrada1 < entrada2) then
						saida <= entrada2 - entrada1;
						negativo <= true;
					else
						saida <= entrada1 - entrada2;
					end if;
				
				when 2 =>
					dsp5 <= "11000110";											--exibe operacao no display 1
					dsp4 <= "11110000";	
					saida <= entrada1 and entrada2;
					led <= true;
				--arrumarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
				
				
				if(resultado = '1') then
					if negativo then 
						dsp3 <= "11110111";
					end if;
					if saida = "00000000" then
							dsp1 <= "11000000";
							dsp2 <= "11000000";
					elsif saida = "00000001" then	
						  dsp1 <= "11000000";
						  dsp2 <= "11111001";
					elsif saida = "00000010" then				 
						  dsp1 <= "11000000";
						  dsp2 <= "10100100";
					elsif saida = "00000011" then				 
						  dsp1 <= "11000000";
						  dsp2 <= "10110000";
					elsif saida = "00000100" then				 
						  dsp1 <= "11000000";
						  dsp2 <= "10011001";
					 ---05-------------------------------------------------------------------
					elsif saida = "00000101" then				 
						  dsp1 <= "11000000";
						  dsp2 <= "10010010";
					elsif saida = "00000110" then				 
						  dsp1 <= "11000000";
						  dsp2 <= "10000010";
					elsif saida = "00000111" then				 
						  dsp1 <= "11000000";
						  dsp2 <= "11111000";
					elsif saida = "00001000" then				 
						  dsp1 <= "11000000";
						  dsp2 <= "10000000";
					elsif saida = "00001001" then				 
						  dsp1 <= "11000000";
						  dsp2 <= "10011000";
					--10---------------------------------------------------------------------
					elsif saida = "00001010" then				 
						  dsp1 <= "11111001";
						  dsp2 <= "11000000";
					elsif saida = "00001011" then				 
						  dsp1 <= "11111001";
						  dsp2 <= "11111001";
					elsif saida = "00001100" then				 
						  dsp1 <= "11111001";
						  dsp2 <= "10100100";
					elsif saida = "00001101" then				 
						  dsp1 <= "11111001";
						  dsp2 <= "10110000";
					elsif saida = "00001110" then				 
						  dsp1 <= "11111001";
						  dsp2 <= "10011001";
					 --15-----------------------------------------------------
					elsif saida = "00001111" then				 
						  dsp1 <= "11111001";
						  dsp2 <= "10010010";
					elsif saida = "00010000" then				 
						  dsp1 <= "11111001";
						  dsp2 <= "10000010";
					elsif saida = "00010001" then				 
						  dsp1 <= "11111001";
						  dsp2 <= "11111000";
					elsif saida = "00010010" then				 
						  dsp1 <= "11111001";
						  dsp2 <= "10000000";
					elsif saida = "00010011" then				 
						  dsp1 <= "11111001";
						  dsp2 <= "10011000";
					 ---20----------------------------------------------------
					elsif saida = "00010100" then				 
						  dsp1 <= "10100100";
						  dsp2 <= "11000000";
					elsif saida = "00010101" then				 
						  dsp1 <= "10100100";
						  dsp2 <= "11111001";
					elsif saida = "00010110" then				 
						  dsp1 <= "10100100";
						  dsp2 <= "10100100";
					elsif saida = "00010111" then                
						  dsp1 <= "10100100";
						  dsp2 <= "10110000";
					elsif saida = "00011000" then
						  dsp1 <= "10100100";
						  dsp2 <= "10011001";
					---25-----------------------------------------------------
					elsif saida = "00011001" then               
						  dsp1 <= "10100100";
						  dsp2 <= "10010010";
					elsif saida = "00011010" then                
						  dsp1 <= "10100100";
						  dsp2 <= "10000010";
					elsif saida = "00011011" then               
						  dsp1 <= "10100100";
						  dsp2 <= "11111000";
					elsif saida = "00011100" then                
						  dsp1 <= "10100100";
						  dsp2 <= "10000000";
					elsif saida = "00011101" then               
						  dsp1 <= "10100100";
						  dsp2 <= "10011000";
