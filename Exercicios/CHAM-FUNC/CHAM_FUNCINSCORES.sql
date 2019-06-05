DECLARE
  
  NOME_COR NUMBER;
  
BEGIN
  NOME_COR :=FUNC_INSCORES('');
  
          dbms_output.put_line('NOME_COR = ' || NOME_COR);                
END;

select * from cores;