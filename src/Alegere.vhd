library ieee;
use ieee.std_logic_1164.all;
--aceasta componenta este cea mai importanta
--cu ajutorul ei aleg daca vreau sa adun,scad,impart,inmultesc sau daca ii dau reset la numarul in care tot calculez 
entity   alegere is
	port( 
	plus,minus,inmultire,impartire:integer;
	reset:in std_logic;
	selectie:in std_logic_vector(1 downto 0);
	a:inout integer;
	validare:in std_logic;
	clk:in std_logic);
end entity   ;
architecture comportamnetala of alegere is

begin
	process(clk)
	begin 
		-- daca resetul este 1 operandul 1 isi da reset
		if clk'event and clk='1' then
			if reset ='1' then
				a<=0;
		-- pentru introducerea numarului in b trebuie sa avem o validare
			else 	if validare='1' then
		--aici am folosit un mux ptr alegerea operatiei
		case selectie is
			when "00" => a<=plus;																																																																																																														  																																																																																		   
			when "01" => a<=minus;
			when "10" => a<=inmultire;
			when "11" => a<=impartire;
			when others => a<=0;
		end case;
		end if;
		end if;
		end if;
	end process;
end architecture ;
