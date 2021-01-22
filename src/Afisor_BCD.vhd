library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--componenta pentru afisarea pe BCD
--il transforma pe a in 3 vectori std_logic
entity afisorbcd is
	port(a:in integer;
	BCD_unitati,BCD_zeci,BCD_sute,BCD_negativ:out std_logic_vector(6 downto 0));
end entity ;

architecture comportamentala of afisorbcd is
signal u,z,s:integer;
begin
	process(a)
	variable unitati,zeci,sute:integer;
	variable numar:integer;
	variable negativ:bit;
	begin 
		--aflu daca a este negativ pentru a sti ce pun 
		--pe afisorul BCD_negativ ( ori - ori nimic)
		if a < 0 then numar:=(-a);
			negativ:='1';
		else
			numar:=a;
			negativ:='0';
		end if;
		--pun in variablile cifra unitatilor,zecilo,sutelor
		--pentru a fi mai usor de comparat
		unitati:=numar mod 10;
		zeci:=(numar/10) mod 10;
		sute:=numar/100;
		--pun pe BCD_unitati cifra unitatilor
		case unitati is
			when 0 =>BCD_unitati <="1111110";
			when 1 =>BCD_unitati <="0110000";
			when 2 =>BCD_unitati <="1101101";
			when 3 =>BCD_unitati <="1111001";
			when 4 =>BCD_unitati <="0110011";
			when 5 =>BCD_unitati <="1011011";
			when 6 =>BCD_unitati <="1011111";
			when 7 =>BCD_unitati <="1110000";
			when 8 =>BCD_unitati <="1111111";
			when 9 =>BCD_unitati <="1111011";
			when others => BCD_unitati <="0000000";
		end case;
		
		--pun pe BCD_zeci cifra zecilor
		case zeci is
			when 0 =>BCD_zeci <="1111110";
			when 1 =>BCD_zeci <="0110000";
			when 2 =>BCD_zeci <="1101101";
			when 3 =>BCD_zeci <="1111001";
			when 4 =>BCD_zeci <="0110011";
			when 5 =>BCD_zeci <="1011011";
			when 6 =>BCD_zeci <="1011111";
			when 7 =>BCD_zeci <="1110000";
			when 8 =>BCD_zeci <="1111111";
			when 9 =>BCD_zeci <="1111011";
			when others => BCD_zeci <="0000000";
		end case;
		
		--pun pe BCD_sute cifra sutelor
		--chiar daca pe sute poate fi doar 0 sau 1 am pus toate
		--daca cumva da ceva eroare sa pot sa vad
		case sute is
			when 0 =>BCD_sute <="1111110";
			when 1 =>BCD_sute <="0110000";
			when 2 =>BCD_sute <="1101101";
			when 3 =>BCD_sute <="1111001";
			when 4 =>BCD_sute <="0110011";
			when 5 =>BCD_sute <="1011011";
			when 6 =>BCD_sute <="1011111";
			when 7 =>BCD_sute <="1110000";
			when 8 =>BCD_sute <="1111111";
			when 9 =>BCD_sute <="1111011";
			when others => BCD_sute <="0000000";
		end case;
		
		--pun pe BCD_negativ - sau nimic
		case negativ is
			when '0' =>BCD_negativ<="0000000";
			when '1' =>BCD_negativ<="0000001";
			when others =>BCD_negativ<="0000000";
		end case;
		
		--doar pentru verificare sunt aceste semnale
		--u<=unitati;
--		z<=zeci;
--		s<=sute;
	end process;
end architecture ;

		
		
			