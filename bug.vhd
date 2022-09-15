library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity projeto is
port
(
	clk: in std_logic;
	rst: in std_logic;
	senha1: in std_logic_vector(3 downto 0);
	disp1: out std_logic_vector(6 downto 0);
	disp2: out std_logic_vector(6 downto 0);
	saidaleds: out std_logic                   
);
end projeto;

architecture Proj of projeto is
	type estados is (A,B,C);
	signal y: estados;
	signal ticks: integer:=0;
	signal s : integer:=0;
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
						if cont > 3 then
						   cont <= 0;
							saidaleds <= '1';
							case y is
								when A =>
									if senha1 = "0101" then
										y <= B;0										
									else
										y <= A;
									end if;
								when  B =>
									if senha1 = "1010" then
										y <= C;
									else 
										y <= A;
									end if;
								when C =>
									y <= A;
							end case;
						else 
							cont <= cont + 1;
						end if;	
					else
					
					ticks <= ticks + 1;
					end if;
				end if;
			end process;
			disp1 <=  "1000000" when y = C else "1000110";
			disp2 <=  "0001100" when y = C else "1000111";
	end Proj;
