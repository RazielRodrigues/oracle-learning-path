== ANOTACOES == 

1 - CRIAR TABELA + INSERIR DADOS
2 - DESENVOLVER CODIGO DA FUNCAO
3 - ESCOLHER CASOS DE USOD E TESTE
	- EXECUTAR TESTES



== CÓDIGOS ==

****CRIANDO TABELA PRODUTOS E INSERINDO DADOS****

create table produto_rz(
id_produto number(3) not null,
nome_produto varchar2(120) not null, 
preco_produto number(6,2) null,
data_preco date null,
  constraint uq_nome_prod_rz unique (nome_produto),
  constraint pk_id_prod_rz primary key (id_produto)
);

insert into produto_rz(id_produto,nome_produto,preco_produto,data_preco)
  values(10,'lapis',1.50,to_date('10/02/2019','dd/mm/yyyy'));
  
insert into produto_rz(id_produto,nome_produto,preco_produto,data_preco)
  values(20,'caneta azul',null,null);
  
insert into produto_rz(id_produto,nome_produto,preco_produto,data_preco)
  values(30,'borracha',2,to_date('20/03/2019 19:00:00','dd/mm/yyyy hh24:mi:ss'));

commit; -- PARA EFETIVAR OS INSERT INTO


select * from produto_rz; -- SELECT BÁSICO

select id_produto,nome_produto,preco_produto,to_char(data_preco,'dd/mm/yyyy hh24:mi:ss') from produto_rz; -- SELECT COM DATA E HORA


****CRIANDO FUNÇÃO PARA AUMENTAR O PREÇO PRODUTO****

create or replace 
function func_aumprecoprod(p_id in number, p_taxa in number)

  return number
  
is

  retorno number(3) := 0;
  vqtde number(1);
  vpreco produto_rz.preco_produto%type;
  vpreconovo number;

begin
  
  if p_taxa > -15 and p_taxa <= 15 then
    if p_taxa is not null then
      select count(*) into vqtde from produto_rz where id_produto = p_id;
      
          if vqtde = 1 then
              select preco_produto into vpreco 
              from produto_rz 
              where id_produto = p_id;
                vpreconovo := vpreco + (vpreco * (p_taxa /100));
                  
                  if vpreconovo > 0 and vpreconovo <= 9999.99
                  and vpreconovo is not null then
                    
                    update produto_rz 
                    set preco_produto = vpreconovo, data_preco = sysdate
                    where p_id = id_produto;

                  else
                  retorno := -996;-- valor do preco novo fora da faixa
                  end if;
              
          else
          retorno := -997; -- id inexistente
          end if;
          
       else
       retorno := -998; -- taxa nula
       end if;
       
  else
    retorno := -999; -- porcentagem fora da faixa
  end if;

commit;
return retorno;
end;

***CHAMANDO A FUNÇÃO FUNC_AUMPRECOPROD****

declare

	x number;

begin

	x := func_aumprecoprod(10,25);
	dbms_output.put_line('resultado = ' || x);

end;

select * from produto_rz; -- SELECT NORMAL
select id_produto,nome_produto,preco_produto,to_char(data_preco,'dd/mm/yyyy hh24:mi:ss') from produto_rz; -- SELECT COM DATA E HORA

-999 -- porcentagem fora da faixa
-998 -- taxa nula
-997 -- id inexistente
-996 -- valor do preco novo fora da faixa



== COLINHA DE IF ==

if ... then
  
  
else
    
    
retorno := -NUMERO_ERRO;
end if;

====================================================================================================


CREATE TABLE CLIENTE(

ID_CLIENTE NUMBER(3),
NOME_CLIENTE VARCHAR2(120) NOT NULL,
SEXO VARCHAR(1) NOT NULL,


  CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE),
  CONSTRAINT UQ_PLACA UNIQUE(PLACA),
  CONSTRAINT CK_SEX CHECK(SEXO IN ('F','M'))
);

CREATE TABLE PEDIDO(

ID_PEDIDO NUMBER(3),
ID_CLIENTE_FK NUMBER(3) NOT NULL,
NOME_PEDIDO NUMBER(8,2) NOT NULL,

  CONSTRAINT PK_PEDIDO PRIMARY KEY (ID_PEDIDO),

  CONSTRAINT FK_CLI_PED FOREIGN KEY (ID_CLIENTE_FK) 
              REFERENCES CLIENTE(ID_CLIENTE)
);


INSERT INTO CLIENTE(ID_CLIENTE,NOME_CLIENTE,SEXO)
  VALUES (1,'Raziel M.','M');


EXEMPLOS SELECTS:

SELECT * FROM PAIS; 
SELECT nm_pais FROM PAIS; 
SELECT sigla, nome_estado FROM ESTADO; 
SELECT * FROM PAIS;
 SELECT DISTINCT cd_pais FROM ESTADO; 
 SELECT ‘Fornecedor: ‘ || nm_fornecedor, cd_fornecedor FROM FORNECEDOR;
  SELECT nm_aluno, TO_CHAR(dt_nascimento, ‘DD/MM/YYYY’) FROM ALUNO;
  SELECT nm_pais as nome FROM PAIS; 
 SELECT nm_pais as “nome pais” FROM PAIS; 
 SELECT nm_pais nome FROM PAIS; 
 SELECT nm_pais “nome pais” FROM PAIS;



 ===============================================================================================


 == FUNCOES ==

create or replace function x_teste(p_id in number)
return number

is 

  ret number(3);
  qtde number(3);
  idfunc employees.employee_id%type;

begin

  select employee_id into idfunc from employees where employee_id = p_id;
  dbms_output.put_line('chegou aqui, está certo.');

return 0;

exception
when others then dbms_output.put_line('ERRO SQL: ' || SQLCODE);
rollback;
return SQLCODE;

end;


== CHAMANDO FUNCAO ==

declare

x number;

begin

x := X_TESTE(102);

  dbms_output.put_line('x =' || x);

end;

== ANOTACOES ==

-- VOCE PODE TER BEGIN E END DENTRO DELE MESMO, SERIA UM "METODO"


BEGIN

BEGIN



EXCPETION
END;

EXCEPTION
END.

-- OS EXPECTIONS SERVEM PARA AJUDAR NO TRATAMENTO DE ERRO,  
-- TRAZENDO ATÉ MESMO O NUMERO CORRETO DO ERRO SQL.

CRIAR A TABELA DE LOG

exception
when others then
   rollback;

  insert into log_erro
    (id_log,nome_prog ,codigo_erro, descricao_erro, linha_erro, data_hora, usuario)
  values(seq, ...., sqlcode, sqlerrm, ..., ..., ...);
  commit;
return SQLCODE;

return SQLCODE;
end;

