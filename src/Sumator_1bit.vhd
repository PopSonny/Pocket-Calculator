library IEEE;
use IEEE.std_logic_1164.all;
entity sumator_complet_1bit is
	port (a,b,ci : in std_logic;
	r,co :out std_logic);
-- sumator pe 1 bit structural
-- prin legarea de porti si/sau/xor
-- ci este carry in-ul
-- co este carry out-ul
-- si r este rezultatul 
end entity ;
architecture structurala of sumator_complet_1bit is
component  poarta_si is
	port (x1,x2 :in std_logic; 
	y :out std_logic);
end component ;
component  poarta_sau is
	port (x1,x2,x3 : in std_logic ;
	y :out std_logic);
end component ;
component  poarta_xor is
	port ( x1,x2,x3 : in std_logic;
	y : out std_logic);
end component ;
signal n1,n2,n3:std_logic;
begin
	C1:poarta_si port map(a,b,n1);
	C2:poarta_si port map(a,ci,n2);
	C3:poarta_si port map(b,ci,n3);
	C4:poarta_sau port map(n1,n2,n3,co);
	C5:poarta_xor port map(a,b,ci,r);
end architecture ;