library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--componenta transforma din baza 10 in baza 2 
--cu ajutorul instructiuni to_signed()
entity zece_doi is
	port ( a: in integer;
	b:out std_logic_vector( 7 downto 0));
end entity ;

architecture comportamentala of zece_doi is
begin
b<=std_logic_vector(to_signed(a,b'length));

--aici am facut transformarea fara functie dar 
--am ales sa folosesc functia

--begin
--	process(a)
--	variable c:integer;
--	variable d:integer;
--	variable t:std_logic_vector(0 downto 0);
--	begin
--		c:=a;
--		for I in 0 to 7 loop
--		d:=c rem 2;
--		t:=std_logic_vector(to_unsigned(d,t'length));
--		B(I)<=t(0);
--		c:=c/2;	
--			
--		end loop;
--	end process;
	
end architecture ;

		