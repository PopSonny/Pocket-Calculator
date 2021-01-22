library IEEE;
use IEEE.std_logic_1164.all;
--componenta realizeaza complementul fata de 2
--folosesc sumatorul pe 8 biti
entity convertor is
	port (a:in std_logic_vector (7 downto 0);
	b:out std_logic_vector(7 downto 0));
end entity ;
architecture hibrid of convertor is
component vector_sum is
	port (	A :	in std_logic_vector (7 downto 0);
	B : in std_logic_vector (7 downto 0);
	ci_mic : std_logic;
	C : out std_logic_vector (7 downto 0));
end component ;

signal ci:std_logic_vector (7 downto 0);
-- in primul rand negam toti biti lui a
-- si ii punem intr-un alt semnal
-- adunam ci cu 1 si cu carry in =0
-- punem in b rezultatul
begin
	ci<=not a;
	F1:vector_sum port map (ci,"00000001",'0',b);
end architecture ;
