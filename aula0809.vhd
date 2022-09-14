library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity projeto is
port
(
	sys_clk: in std_logic;
	saida: out std_logic_vector(6 downto 0);
	--switch: in std_logic;
	saidaleds: out std_logic_vector(3 downto 0);
	button: in std_logic
);
end projeto;

architecture Proj of projeto is
constant clockfre: integer := 50e6;
signal ticks: integer:=0;
signal s : integer:=0;
signal cont : std_logic_vector(3 downto 0);

begin
	process (sys_clk) is
	begin
	
		if rising_edge(sys_clk)then
			if ticks = clockfre -1 then
				ticks <= 0;
				--s <= 0;
				if s = 15 then
					s <= 0;
				else
					s <= s+1;
				end if;
			else
				ticks <= ticks +1;
			end if;
		end if;
		cont <= conv_std_logic_vector(s,4);--converter para binario 
		if (button = '0') then
			s <= 0;
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
				 saidaleds <= cont;
	
end Proj;
