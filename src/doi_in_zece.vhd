library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--componenta transforma din baza 2 in baza 10 
--cu ajutorul instructiuni to_integer()
entity doi_zece is
	port( b:in std_logic_vector (7 downto 0);
	a:out integer );
end entity ;

architecture comportamentala of doi_zece is
begin
	a<=to_integer(signed(b));
end architecture ;

	
	