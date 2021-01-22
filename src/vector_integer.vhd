
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--folosesc pachetul din vectori ptr a putea da un vector pe care il convertesc in integer
library work;
use work.vectori.all;

--aceasta componenta transforma din intrarea de vector intr-un integer
entity vector is
	port( vect: in arr;
	clk:std_logic;
	a: out integer);
end entity ;

architecture testare_vect of vector is
begin
	process(clk,vect) 
	variable numar:integer;
	begin
		numar:=0;
		-- un loop cu 3 pasi care face calculele
		for i in 2 downto 0 loop
		numar:=numar*10+vect(i);
		end loop;
		a<=numar;
	end process;
end architecture ;

		