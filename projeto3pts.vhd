library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity projeto is 																	--cria entidade{ 
    port (entrada1           	        :  in std_logic_vector (3 DOWNTO 0) ;		--porta 'valor1 e valor2' vetor logico (4bits)
        entrada2           	            :  in std_logic_vector (3 DOWNTO 0) ;
        selecao 					    :	in std_logic := '0';
        resultado 				        :	in std_logic := '0';
        saidalog 				        : 	out std_logic_vector(3 DOWNTO 0);
        dsp1, dsp2, dsp3, dsp4, dsp5	:	out std_logic_vector(7 DOWNTO 0));		--display dos resultados

end projeto ;	

architecture logic of projeto is										--implementações do projeto; descreve as relações entre as portas.{
    --signal saida: STD_LOGIC_VECTOR(7 DOWNTO 0);							--objeto da arquitetura; saida do tipo vetor logico de 7 a 0 (8bits)
    signal saida: std_logic_vector(7 downto 0);
    signal cont : integer:=0;
    signal negativo : boolean;
    signal led : boolean;

    begin
        process(entrada, selecao)
        begin
            negativo <= false;
            led <= false;
            if(selecao = '1') then
                cont <= cont + 1;
            end if;

            case cont is
                when 0 =>--op ad
                    disp5 <= "10100001";
                    disp4 <= "10001000";
                    saida <= entrada1 + entrada2;

                when 1 =>--op sub
                    dsp5 <= "10000011";											--exibe operacao no display 1
                    dsp4 <= "10010010";
                    if(entrada1 < entrada2) then
                        saida <= entrada2 - entrada1;
                        negativo <= true;
                    else
                        saida <= entrada1 - entrada2;
                    end if;

                when 2 =>--op and
                    dsp5 <= "10001000";			--exibe operacao no display 1
                    dsp4 <= "10001100";	
                    saida <= entrada1 and entrada2;
                    led <= true;
                
                when 3 =>--op or
                    dsp5 <= "11000000";			--exibe operacao no display 1
                    dsp4 <= "11100000";
                    saida <= entrada1 or entrada2;
                    led <= true;
                
                when 4 =>--op xor
                    dsp5 <= "11101000";			--exibe operacao no display 1
                    dsp4 <= "11000000";
                    saida <= entrada 1 xor entrada2;
                    led <= true;

                when 5 => --complemento
                    dsp5 <= "11101000";			--arrumar disp					--exibe operacao no display 1
                    dsp4 <= "11000000";
                    if entrada1 = "1000" then
                        entrada1 <= "0111";
                        saida <= entrada1 + 1;
                    elsif entrada1 = "1001" then
                        entrada1 <= "0110";
                        saida <= entrada1 + 1;

        if(resultado = '1') then
            if negativo then 
                dsp3 <= "11110111";
            end if;
            ---op logicas-----------------------------------------------------
            if led then
                if saida = "0000" then
                    saidalog <= "0000";
                elsif saida = "0001" then	
                    saidalog <= "0001";
                elsif saida = "0010" then				 
                    saidalog <= "0010";
                elsif saida = "0011" then				 
                    saidalog <= "0011";
                elsif saida = "0100" then				 
                    saidalog <= "0100";
                ---05-------------------------------------------------------------------
                elsif saida = "0101" then				 
                    saidalog <= "0101";
                elsif saida = "0110" then				 
                    saidalog <= "0110";
                elsif saida = "0111" then				 
                    saidalog <= "0111";
                elsif saida = "1000" then				 
                    saidalog <= "1000";
                elsif saida = "1001" then				 
                    saidalog <= "1001";
                --10---------------------------------------------------------------------
                elsif saida = "1010" then				 
                    saidalog <= "1010";
                elsif saida = "1011" then				 
                    saidalog <= "1011";
                elsif saida = "1100" then				 
                    saidalog <= "1100";
                elsif saida = "1101" then				 
                    saidalog <= "1101";
                elsif saida = "1110" then				 
                    saidalog <= "1110";
                elsif saida = "1111" then
                    saidalog <= "1111";
                end if
            ---op aritmeticas-----------------------------------------------------
            elsif saida = "00000000" then
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
            ---30-----------------------------------------------------    
            
        end if
