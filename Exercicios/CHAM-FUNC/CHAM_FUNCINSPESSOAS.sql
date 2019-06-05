DECLARE
	X NUMBER;

BEGIN
	X := FUNCINSPESSOAS('Maria',NULL);


          dbms_output.put_line('RESULTADO = ' || X);                


END

select * from TABLE_PESSOA_2;