library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--algoritmul ptr impartitor
--foloseste scaderi repetate pentru a afla catul

entity impartitor is
	port ( a: in std_logic_vector( 7 downto 0);
	b: in std_logic_vector (7 downto 0);
	rezultat : out integer);
end entity ;

architecture imp of	impartitor is
begin
	process(a,b)
	--in c retin catul pana il voi pune pe semnalul rezultat 
	--care este de tip integer
	variable c:integer;
	--folosesc doua variabile case sa le pot schimba in process
	--fara a folosi instructiuni precum wait,wait for...
	variable primul:std_logic_vector( 7 downto 0);
	variable al_doilea:std_logic_vector (7 downto 0);
	begin
		c:=0;
		primul:=a;
		al_doilea:=b;
		--am folosit un for pana la 511 deoarece
		--cand am incercat cu while in vivado dadea eroare
		
		for i in 0 to 511 loop
		if (primul>=al_doilea) then
		primul:=primul-al_doilea;
		c:=c+1;
		end if;
		end loop;
		rezultat<=c;
	end process;
end architecture ;

		