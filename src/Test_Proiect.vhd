library ieee;
use ieee.std_logic_1164.all;

library work;
use work.vectori.all;
--folosesc pachetul vectori ptr a avea acces la vectorul de integer 
--in a se variable pastra rezultatul tuturor operatilor
--vector_intrare este modul prin care dau numarul
--el este un vector de integers care este converit intr-un integer
--adunare,scadere,inmultire,impartire sunt locurile unde stochez
--rezulatele operatilor respective
--cu reset dau reset la calculator a devine 0
--selectia este folosita ptr a alege + - / * cu ajutorul unui mux
--la fiecare clk o operatie in functie de reset si selectie se efectueaza
entity proiect is
	port ( a : inout integer;
	vector_intrare:in arr;
	adunare: inout integer;
	scadere : inout integer;
	inmultire : inout integer;
	impartire: inout integer;
	reset: in std_logic;
	validare:in std_Logic;
	selectie : in std_logic_vector(1 downto 0);
	BCD_unitati,BCD_zeci,BCD_sute,BCD_negativ:out std_logic_vector(6 downto 0);
	clk:in std_logic);
end entity ;

architecture test of proiect is	

--componentele folosite sunt :

--un convertor pentru complement fata de 2
component  convertor is
	port (a:in std_logic_vector (7 downto 0);
	b:out std_logic_vector(7 downto 0));
end component  ;

--sumatorul complet pe 8 biti
component  vector_sum is
	port (	A :	in std_logic_vector (7 downto 0);
	B : in std_logic_vector (7 downto 0);
	ci_mic : std_logic;
	C : out std_logic_vector (7 downto 0));
end component  ;

--algoritmul pentru inmultire
component  inmultitor is 
	port ( a : in std_logic_vector(7 downto 0);
	b : in std_logic_vector ( 7 downto 0);
	p: out std_logic_vector (15 downto 0));
end component ;

--convertirea din baza 10 in 2
component  zece_doi is
	port ( a: in integer;
	b:out std_logic_vector( 7 downto 0));
end component  ;

--convertirea din baza 2 in 10
component  doi_zece is
	port( b:in std_logic_vector (7 downto 0);
	a:out integer );
end component  ;

--algoritmul de impartire
component  impartitor is
	port ( a: in std_logic_vector( 7 downto 0);
	b: in std_logic_vector (7 downto 0);
	rezultat : out integer);
end component  ;

--alegerea lui a in functie de reset si selectie
component  alegere is
	port( 
	plus,minus,inmultire,impartire:integer;
	reset:in std_logic;
	selectie:in std_logic_vector(1 downto 0);
	a:inout integer;
	validare:in std_logic;
	clk:in std_logic);
end component  ;

--transformare vectorului intr-un integer
component  vector is
	port( vect: in arr;
	clk:std_logic;
	a: out integer);
end component  ;

--componenta care transforma a-ul in 3 vectori
--ptr afisare BCD
component  afisorbcd is
	port(a:in integer;
	BCD_unitati,BCD_zeci,BCD_sute,BCD_negativ:out std_logic_vector(6 downto 0));
end component  ;

--semnal ptr complement fata de 2
signal convertit : std_logic_vector (7 downto 0);

--numerele operanzi a respectiv b 
--reprezentati pe 8 biti
signal vect_a:std_logic_vector(7 downto 0);
signal vect_b:std_logic_vector(7 downto 0);

--suma si scadere reprezentate pe 8 biti
signal vect_plus:std_logic_vector(7 downto 0);
signal vect_minus:std_logic_vector(7 downto 0);

--inmultirea si impartirea reprezentate pe 8 biti
signal vect_inmultire:std_Logic_vector(15 downto 0);
signal vect_inmultire_afisare:std_Logic_vector(7 downto 0);

--in b vom transforma vectorul de intrare intr-un integer
signal b:integer;

begin
	
	--transformam din vectorul de intrare intr-un integer care variable fi un b
	C0:vector port map (vector_intrare,clk,b);
	
	--convertim in baza 2 operandul mare 
	C1:zece_doi port map (a,vect_a);
	
	--convertim in baza 2 operandul care cu care 
	-- va fi a scazut adunat inmultit impartit
	C2:zece_doi port map (b,vect_b);
	
	--il facem in complement fata de 2 ca sa ne usuram lucrul
	--salvam complementul in convertit
	C3:convertor port map  (vect_b,convertit);
	
	--facem suma si o punem in vect_plus
	C4:vector_sum port map  (vect_a,vect_b,'0',vect_plus);
	
	--facem scaderea si o punem in vect_minus
	C5:vector_sum port map  (vect_a,convertit,'0',vect_minus);
	
	--facem inmultirea si o punem in vect_inmultire
	C6:inmultitor port map  (vect_a,vect_b,vect_inmultire);
	
	--facem impartirea si o punem in vect_impartire
	C7:impartitor port map (vect_a,vect_b,impartire);
	
	--tranformam in baza 10 adunarea si scaderea
	C8:doi_zece port map(vect_plus,adunare);
	C9:doi_zece port map(vect_minus,scadere);
	
	--punem in vect_inmultire_afisare primi 8 biti ai inmultiri
	--deoarece pana acolo avem spatiu
	C10:vect_inmultire_afisare<=vect_inmultire(7 downto 0);
	
	--transformam in baza 10 inmultirea 
	--impartirea este deja in baza 10 dupa algoritmul ei
	C11:doi_zece port map(vect_inmultire_afisare,inmultire);
	
	--alegem ce se pune in a conform resetului si selectiei
	C12:alegere port map(adunare,scadere,inmultire,impartire,reset,selectie,a,validare,clk);
	
	--prelucram a-ul ptr BCD
	C13:afisorbcd port map(a,BCD_unitati,BCD_zeci,BCD_sute,BCD_negativ);
	
	--si repetam
	
end architecture ;
