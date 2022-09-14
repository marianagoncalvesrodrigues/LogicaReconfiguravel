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
	saida: out std_logic
);
end projeto;

architecture Proj of projeto is
	type estados is (A,B,C);
	signal y: estados;
	begin
		process(clk) is
			begin
				if rst = '0' then
					y<=A;
				elsif rising_edge(clk) then
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
								y <= C;
							end if;
						when  C =>
							if entrada = '0' then
								y <= A;
							else
								y <= B;
							end if;
							end case;
						end if;
			end process;
			saida <= '1' when y = C else '0';
	end Proj;
