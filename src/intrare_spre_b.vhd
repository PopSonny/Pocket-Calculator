library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--folosim numarartorul de 3 ori pentru fiecare cifra a numarului introdus
entity intrare_spre_b is
	port (buton1,buton2,buton3:in std_Logic;
	clk:in std_logic;
	reset:in std_logic;
	b:out integer);
end entity ;

architecture spre_b of intrare_spre_b is

component  numarator_I is
	port(reset:in std_logic;
	clk:in std_logic;
	buton:in std_logic;
	numar:inout integer);
end component  ;

signal unitati,zeci,sute :integer;
begin
	C0:numarator_I port map (reset,clk,buton1,unitati);
	C1:numarator_I port map (reset,clk,buton2,zeci);
	C2:numarator_I port map (reset,clk,buton3,sute);
	process(clk,unitati,zeci,sute)
	variable numar:integer;
	begin
		numar:=unitati+zeci*10+sute*100;
		b<=numar;
		if (reset='1') then
			b<=0;
		end if;
	end process;
end architecture ;
