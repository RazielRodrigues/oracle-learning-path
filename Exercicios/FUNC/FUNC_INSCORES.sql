CREATE OR REPLACE 
  FUNCTION FUNC_INSCORES(P_NOME IN VARCHAR2)
  
  RETURN NUMBER

IS

  RET NUMBER(3) := 0;
  V_COD CORES.ID%TYPE;
  VQTDE NUMBER(1);

BEGIN
  
  IF P_NOME IS NOT NULL THEN
    IF LENGTH(P_NOME) <= 120 THEN
      
      SELECT MAX(ID) +1 INTO V_COD FROM CORES;
      SELECT COUNT(*) INTO VQTDE FROM CORES WHERE UPPER(NOME) = UPPER(P_NOME);
          
          IF VQTDE = 0 THEN
              INSERT INTO CORES(ID,NOME) VALUES(V_COD,P_NOME);
            
            COMMIT;
          ELSE
          
            RET := -997;
          
          END IF;
          
          
          
    ELSE
      
      RET := -998;
    
    END IF;
  
  ELSE
    
    RET := -999;
END IF;

RETURN RET;

END;