library IEEE;
use IEEE.std_logic_1164.all;
--poarta sau pentru 3 intrari
--folosesc operandul or
entity poarta_sau is
	port (x1,x2,x3 : in std_logic ;
	y :out std_logic);
end entity;
architecture flux of poarta_sau is
begin
	y <= x1 or x2 or x3;
end architecture ;
