library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--algoritmul de inmultire
entity inmultitor is 
	port ( a : in std_logic_vector(7 downto 0);
	b : in std_logic_vector ( 7 downto 0);
	p: out std_logic_vector (15 downto 0));
end entity;

architecture inm of inmultitor is
begin
	process(a,b)  
	--am nevoie de 2 variabile de tip std_logic_vector
	--pentru a efectua operatiile de adunare si concatenare
	variable c,d:std_logic_vector(15 downto 0);
	begin
		--initializez cu 0 c-ul-
		--si pentru d biti 15-8 cu 0
		--iar restul 8 cu biti lui b
		c :="0000000000000000";
		d:="00000000" & b;
		--verific ptr fiecare bit din a daca este 1
		--daca da c este adunat cu d
		for i in 0 to 7 loop
			if a(i) = '1' then
				c:= c+ d;
			end if;
		--la final trebuie sa concatenam cu un 0 d-ul
			d := d ( 14 downto 0) & '0';
		end loop;
		--in p punem rezultatul care a fost pana acum in c
		p<=c;
	end process;
end architecture ;
