library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity projeto is
port
(
	sys_clk: in std_logic;
	saida: out std_logic_vector(6 downto 0);
	s : inout integer
);
end projeto;

architecture Proj of projeto is
constant clockfre: integer := 50e6;
signal ticks: integer;
begin
	process (sys_clk) is
	begin
	
		if rising_edge(sys_clk)then
			if ticks = clockfre -1 then
				ticks <= 0;
				s <= 0;
				if s = 15 then
					s <= 0;
				else
					s <= s+1;
				end if;
			else
				ticks <= ticks +1;
			end if;
		end if;
	end process;

	saida <=  "1000000" when s = 0 else
				 "1111001" when s = 1 else
				 "0100100" when s = 2 else
				 "0110000" when s = 3 else
				 "0011001" when s = 4 else
				 "0010010" when s = 5 else
				 "0000010" when s = 6 else
				 "1111000" when s = 7 else
				 "0000000" when s = 8 else
				 "0010000" when s = 9 else
				 "0001000" when s = 10 else
				 "0000011" when s = 11 else
				 "0100111" when s = 12 else
				 "0100001" when s = 13 else
				 "0000110" when s = 14 else
				 "0001110" when s = 15;
	
end Proj;
