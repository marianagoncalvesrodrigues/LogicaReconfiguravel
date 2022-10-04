library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity projeto is --cria entidade{ 
    port (entrada1                           :in std_logic_vector(3 DOWNTO 0) ;--porta 'valor1 e valor2' vetor logico (4bits)
        entrada2                           :in std_logic_vector(3 DOWNTO 0);
        selecao                            :in std_logic;
        resultado                         :in std_logic;
        saidalog                            :out std_logic_vector(3 DOWNTO 0);
        dsp1, dsp2, dsp3, dsp4, dsp5        :out std_logic_vector(7 DOWNTO 0));--display dos resultados
end projeto;

architecture logic of projeto is	--implementações do projeto; descreve as relações entre as portas.{

    signal saida: std_logic_vector(4 downto 0);
    signal saidafourbits: std_logic_vector(3 downto 0);
    signal aux: std_logic;
    signal cont : integer:= 0;
    signal negativo : integer:= 0;
    signal led : integer:= 0;
    signal tmp: std_logic_vector(3 downto 0);
    signal entrada15: std_logic_vector (4 downto 0);
    signal entrada25: std_logic_vector (4 downto 0);

    begin
        process(entrada1, entrada2, selecao, resultado)
        begin
            led <= 0;
            if(rising_edge(selecao)) then
                cont <= cont + 1;
            end if;

            case cont is
                when 0 =>--op ad
                    led <= 0;
						  dsp3 <= "11111111";
                    dsp4 <= "10100001";
                    dsp5 <= "10001000";
                    entrada15 <= '0' & entrada1;
                    entrada25 <= '0' & entrada2;
                    saida <=  entrada15 + entrada25;
                    

                when 1 =>--op sub
                    led <= 0;
						  dsp3 <= "11111111";
                    dsp4 <= "11000001";--exibe operacao no display 1 --p01234567 11000001
                    dsp5 <= "10010010";--10100100
                    entrada15 <= '0' & entrada1;
                    entrada25 <= '0' & entrada2;

                    if(entrada15 < entrada25) then
                        saida <=  entrada25 - entrada15;
                        negativo <= 1;
                    else
								dsp3 <= "11111111";
                        saida <=  entrada15 - entrada25;
                    end if;

                when 2 =>--op and
						  dsp3 <= "11111111";
                    dsp5 <= "10001000";--exibe operacao no display 1   
                    dsp4 <= "11001000";
                    saidafourbits <= entrada1 and entrada2;
                    led <= 1;

                when 3 =>--op or
						  dsp3 <= "11111111";
                    dsp5 <= "11000000";--exibe operacao no display 1
                    dsp4 <= "11000001";
                    saidafourbits <= entrada1 or entrada2;
                    led <= 1;

                when 4 =>--op xor 
						  dsp3 <= "11111111";
                    dsp5 <= "10001001";--exibe operacao no display 1
                    dsp4 <= "11000000";
                    saidafourbits <= entrada1 xor entrada2;
                    led <= 1;

                when 5 => --complemento
						  dsp3 <= "11111111";
                    dsp5 <= "11000110";--exibe operacao no display 1
                    dsp4 <= "11000000";
                    tmp <= std_logic_vector((not entrada1));
						  saidafourbits <= tmp;
						  led <= 1;
                when others =>
                    cont <= 0;
						  dsp3 <= "11111111";
            end case;

        if(resultado = '0') then
            if negativo = 1 then 
                dsp3 <= "10111111";
            end if;
            ---op logicas-----------------------------------------------------
            if led = 1 then
                if saidafourbits = "0000" then
                    saidalog <= "0000";
                elsif saidafourbits = "0001" then
                    saidalog <= "0001";
                elsif saidafourbits = "0010" then
                    saidalog <= "0010";
                elsif saidafourbits = "0011" then
                    saidalog <= "0011";
                elsif saidafourbits = "0100" then
                    saidalog <= "0100";
                ---05-------------------------------------------------------------------
                elsif saidafourbits = "0101" then
                    saidalog <= "0101";
                elsif saidafourbits = "0110" then
                    saidalog <= "0110";
                elsif saidafourbits = "0111" then
                    saidalog <= "0111";
                elsif saidafourbits = "1000" then
                    saidalog <= "1000";
                elsif saidafourbits = "1001" then
                    saidalog <= "1001";
                --10---------------------------------------------------------------------
                elsif saidafourbits = "1010" then
                    saidalog <= "1010";
                elsif saidafourbits = "1011" then
                    saidalog <= "1011";
                elsif saidafourbits = "1100" then
                    saidalog <= "1100";
                elsif saidafourbits = "1101" then
                    saidalog <= "1101";
                elsif saidafourbits = "1110" then
                    saidalog <= "1110";
                elsif saidafourbits = "1111" then
                    saidalog <= "1111";
                end if;
            ---op aritmeticas-----------------------------------------------------
            else
					
                if saida = "00000000" then
                    dsp2 <= "11000000";
                    dsp1 <= "11000000";
                elsif saida = "00000001" then
                    dsp2 <= "11000000";
                    dsp1 <= "11111001";
                elsif saida = "00000010" then
                    dsp2 <= "11000000";
                    dsp1 <= "10100100";
                elsif saida = "00000011" then
                    dsp2 <= "11000000";
                    dsp1 <= "10110000";
                elsif saida = "00000100" then
                    dsp2 <= "11000000";
                    dsp1 <= "10011001";
                ---05-------------------------------------------------------------------
                elsif saida = "00000101" then
                    dsp2 <= "11000000";
                    dsp1 <= "10010010";
                elsif saida = "00000110" then
                    dsp2 <= "11000000";
                    dsp1 <= "10000010";
                elsif saida = "00000111" then
                    dsp2 <= "11000000";
                    dsp1 <= "11111000";
                elsif saida = "00001000" then
                    dsp2 <= "11000000";
                    dsp1 <= "10000000";
                elsif saida = "00001001" then
                    dsp2 <= "11000000";
                    dsp1 <= "10011000";
                --10---------------------------------------------------------------------
                elsif saida = "00001010" then
                    dsp2 <= "11111001";
                    dsp1 <= "11000000";
                elsif saida = "00001011" then
                    dsp2 <= "11111001";
                    dsp1 <= "11111001";
                elsif saida = "00001100" then
                    dsp2 <= "11111001";
                    dsp1 <= "10100100";
                elsif saida = "00001101" then
                    dsp2 <= "11111001";
                    dsp1 <= "10110000";
                elsif saida = "00001110" then
                    dsp2 <= "11111001";
                    dsp1 <= "10011001";
                --15-----------------------------------------------------
                elsif saida = "01111" then
                    dsp2 <= "11111001";
                    dsp1 <= "10010010";
                elsif saida = "10000" then
                    dsp2 <= "11111001";
                    dsp1 <= "10000010";
                elsif saida = "10001" then
                    dsp2 <= "11111001";
                    dsp1 <= "11111000";
                elsif saida = "10010" then
                    dsp2 <= "11111001";
                    dsp1 <= "10000000";
                elsif saida = "10011" then
                    dsp2 <= "11111001";
                    dsp1 <= "10011000";
                ---20----------------------------------------------------
                elsif saida = "10100" then
                    dsp2 <= "10100100";
                    dsp1 <= "11000000";
                elsif saida = "10101" then
                    dsp2 <= "10100100";
                    dsp1 <= "11111001";
                elsif saida = "10110" then
                    dsp2 <= "10100100";
                    dsp1 <= "10100100";
                elsif saida = "10111" then
                    dsp2 <= "10100100";
                    dsp1 <= "10110000";
                elsif saida = "11000" then
                    dsp2 <= "10100100";
                    dsp1 <= "10011001";
                ---25-----------------------------------------------------
                elsif saida = "11001" then
                    dsp2 <= "10100100";
                    dsp1 <= "10010010";
                elsif saida = "11010" then
                    dsp2 <= "10100100";
                    dsp1 <= "10000010";
                elsif saida = "11011" then
                    dsp2 <= "10100100";
                    dsp1 <= "11111000";
                elsif saida = "11100" then
                    dsp2 <= "10100100";
                    dsp1 <= "10000000";
                elsif saida = "11101" then
                    dsp2 <= "10100100";
                    dsp1 <= "10011000";
                elsif saida = "11110" then               
                    dsp2 <= "10110000";
                    dsp1 <= "11000000";
                ---30-----------------------------------------------------    
                end if;
            end if;
		end if;
  end process;
  
 
				--case negativo is
				--		when 1 =>
				--			dsp3 <= "10111111";
				--		when 0 =>
				--			dsp3 <= "11111111";
				--		when others =>
				--			dsp3 <= "11111111";
				
end logic;
