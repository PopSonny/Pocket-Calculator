library ieee;
use ieee.std_logic_1164.all;

--un numarator pentru introducerea numerelor
entity numarator_I is
	port(reset:in std_logic;
	clk:in std_logic;
	buton:in std_logic;
	numar:inout integer);
end entity ;

architecture numarator of numarator_I is
begin
	process(buton,reset,clk)
	variable n:integer;
	begin
		if clk'event and clk='1' then
		n:=numar;
		if reset='1'then
			n:=0;
		elsif numar>=9 then
			n:=0;
		elsif  buton='1' then 
			n:=n+1;
		end if;
		end if;
		numar<=n;
	end process;
end architecture ;
			
			