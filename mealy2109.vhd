library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity projeto is
port
(
	clk: in std_logic;
	rst: in std_logic;
	entrada: in std_logic;
	saida: out std_logic;
	saidaleds: out std_logic;
	ledsaida: out std_logic
);
end projeto;

architecture Proj of projeto is
	type estados is (A,B);
	signal y: estados;
	signal c : integer:=0;
	signal ticks: integer:=0;
	signal cont : integer:=0;
	constant clockfre: integer := 50e6;
	begin
		process(clk) is
			begin
				if rst = '0' then
					y<=A;
				elsif rising_edge(clk) then
					if ticks = clockfre -1 then
							ticks <= 0;
							saidaleds <= '1'; --acende o led
							if cont > 3 then
								cont <= 0;
								saidaleds <= '0'; --apaga o led
								case y is
									when A =>
										if entrada = '0' then
											y <= A;
										else
											y <= B;
										end if;
									when  B =>
										if entrada = '0' then
											y <= A;
										else 
											y <= B;
										end if;
								end case;
							else 
								cont <= cont + 1;
							end if;
					else
						ticks <= ticks + 1;
					end if;
				end if;
		end process;
		process(entrada, y) is
			begin
				case y is
					when A =>
						saida <= '0';
					when B =>
						if entrada = '1' then
							saida <= '1';
						else 
							saida <= '0';
						end if;
				end case;
		end process;
	end Proj;
