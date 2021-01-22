
--am folosit package pentru a putea da al doilea operand la calculator
--prima data vector(0) este cifra unitatilor
--a doua vector(1) este cifra zecilor
--a treia vector(2) este cifra sutelor care poate fi doar 0 sau 1 ptr ca avem 7 biti ptr utilizare si unul ptr semn

package vectori is
	type arr is array ( 2 downto 0) of integer;
end package;