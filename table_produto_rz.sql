create table produto_rz(
id_produto number(3) not null,
nome_produto varchar2(120) not null, 
preco_produto number(6,2) null,
data_preco date null,
  constraint uq_nome_prod_rz unique (nome_produto),
  constraint pk_id_prod_rz primary key (id_produto)
);

insert into produto_rz

(id_produto,nome_produto,preco_produto,data_preco)
  values(10,'lapis',1.50,to_date('10/02/2019','dd/mm/yyyy'));
  
insert into produto_rz

(id_produto,nome_produto,preco_produto,data_preco)
  values(20,'caneta azul',null,null);
  
insert into produto_rz

(id_produto,nome_produto,preco_produto,data_preco)
  values(30,'borracha',2,to_date('20/03/2019 19:00:00','dd/mm/yyyy 

hh24:mi:ss'));

commit; -- PARA EFETIVAR OS INSERT INTO


select * from produto_rz; -- SELECT BÁSICO

select id_produto,nome_produto,preco_produto,to_char

(data_preco,'dd/mm/yyyy hh24:mi:ss') from produto_rz; -- SELECT 

COM DATA E HORA
