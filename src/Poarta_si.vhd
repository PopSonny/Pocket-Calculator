library IEEE;
use IEEE.std_logic_1164.all;
--poarta si	
--folosesc operandul and
entity poarta_si is
	port (x1,x2 :in std_logic; 
	y :out std_logic);
end entity;
architecture flux of poarta_si is
begin
	y <= x1 and x2;
end architecture ;
