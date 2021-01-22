library IEEE;
use IEEE.std_logic_1164.all;
--poarta xor pentru 3 intrari
--folosesc operandul xor 
entity poarta_xor is
	port ( x1,x2,x3 : in std_logic;
	y : out std_logic);
end entity ;
architecture flux of poarta_xor is
begin
	y<= x1 xor x2 xor x3;
end architecture ;
