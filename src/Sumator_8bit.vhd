library IEEE;
use IEEE.std_logic_1164.all;
--sumatorul complet pe 8 biti
--am folosit sumatorul complet pe 1 bit
entity vector_sum is
	port (	A :	in std_logic_vector (7 downto 0);
	B : in std_logic_vector (7 downto 0);
	ci_mic : std_logic;
	C : out std_logic_vector (7 downto 0));
end entity ;
architecture structurala of vector_sum is
component  sumator_complet_1bit is
	port (a,b,ci : in std_logic;
	r,co :out std_logic);
end component  ;
--a si b sunt cele 2 numere reprezentate pe cei 8 biti 
--iar ci_mic este carry in-ul
signal CO : std_logic_vector (7 downto 0);
begin 
	E1:sumator_complet_1bit port map (A(0),B(0),ci_mic,C(0),CO(0));
	E2:sumator_complet_1bit port map (A(1),B(1),CO(0),C(1),CO(1));
	E3:sumator_complet_1bit port map (A(2),B(2),CO(1),C(2),CO(2));
	E4:sumator_complet_1bit port map (A(3),B(3),CO(2),C(3),CO(3));
	E5:sumator_complet_1bit port map (A(4),B(4),CO(3),C(4),CO(4));
	E6:sumator_complet_1bit port map (A(5),B(5),CO(4),C(5),CO(5));
	E7:sumator_complet_1bit port map (A(6),B(6),CO(5),C(6),CO(6));
	E8:sumator_complet_1bit port map (A(7),B(7),CO(6),C(7),CO(7));
end architecture ;
	
	