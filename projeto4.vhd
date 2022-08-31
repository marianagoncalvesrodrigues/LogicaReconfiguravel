library ieee;
use ieee.std_logic_1164.all;

entity projeto is
	port
	(
		entradaA: in std_logic;
		entradaB: in std_logic;
		entradaC: in std_logic;
		entradaD: in std_logic;
		entradaE: in std_logic;
		saidaS: out std_logic
	);
end projeto;

architecture Teste of projeto is
	signal sigAB: std_logic;
	signal sigDE: std_logic;
begin
	sigAB <= entradaA nand entradaB;
	sigDE <= entradaD xor entradaE;
	saidaS <= sigAB or not entradaC or sigDE;
end Teste;
