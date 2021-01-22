library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--componenta pentru a pune pe cele patru afisoare rezulatul
--pe primele 4 intrari avem cei 4 vectori BCD care au fost calculati inainte
entity bcd7segment is
	port(unitati,zeci,sute,negativ:in std_logic_vector(6 downto 0); 
		 clk:in std_logic; 
		 seg:out std_logic_vector(6 downto 0); 
		 anod:out std_logic_vector(7 downto 0); 
		 dp:out std_logic);	  
end entity;

architecture comportamentala of bcd7segment is
begin
	process(clk) 
	--folosim o variabila pentru cele 4 afisoare
	variable num:std_logic_vector(0 to 1):="00"; 
	begin
		if (clk'event and clk='1') then 
			case num is
			when "00" => 
				seg<=unitati;
				anod(3 downto 0)<="1110";
			when "01" => 
			seg<=zeci;
				anod(3 downto 0)<="1101";
			when "10" => 
				seg<= sute;
				anod(3 downto 0)<="1011";
			when "11" => 
			seg<=negativ;
				anod(3 downto 0)<="0111";
			when others => anod(3 downto 0)<="1111";
			end case;
			--fiecare data incrementam num
			--pentru a parcurge toate afisoarele
			num:=num+1;
		end if;
	end process;
	--tot timpul dp o sa fie 1 ca sa fie dezactivat
	dp<='1';
	anod(7 downto 4)<="1111";
end architecture;