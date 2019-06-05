# Documentação programação avançada de banco de dados com PL/SQL

## LABORATORIO DE DESENVOLVIMENTO DE BANCO DE DADOS IV
### Prof. Dr. Patricia Bellin
#### Raziel Miranda Rodrigues


### INDICE
1 - Instalação ORACLE 11G no Windows 10
2 - Diagrama de entidade de relacionamento
2 - Modelo de entidade de relacionamento
3 - Dicionario de dados
4 - Objetivo
5 - A linguagem PL/SQL
6 - Procedures e triggers

### PROJETO
1. Diagramas DER e MER do estacionamento
2. Banco de dados SQL do projeto
3. Objetivos da trigger e da procedure



### INSTALAÇÃO ORACLE DATABASE 11G WINDOWS 10 x64

1.	Acessar o site da Oracle e escolher a versão do banco de dados desejada, aqui, vamos utilizar a versão Oracle Database 11g Release 2 (11.2.0.1.0)
2.	 
3.	Clicar em aceito os termos de uso, e depois em download.
4.	Após isso o download iniciara mas voce sera direcionado a uma página de login da Oracle caso nao inicie o download é necessario fazer o login.
5.	É necessario realizar o download dos dois arquivos " win64_11gR2_database_2of2.zip e win64_11gR2_database_1of2.zip"
6.	Extrair os arquivos para o mesmo diretorio 
7.	Abrir a pasta "win64_11gR2_database_1of2.zip" e executar o "setup.exe"
8.	Insira o seu email e a senha > next
9.	Selecione a checkbox de nao desejar colocar proxy > next
10.	Selecione "criar e configurar um banco de dados" > next
11.	Selecione "Classe de desktop" > next
12.	Selecione "Standard edition" na aba "edição do banco de dados"
13.	Escolha o nome do seu banco de dados na aba "nome do banco de dados global" > escolha a sua senha > next > next
14.	Aguardar a instalação...
15.	Durante a instalação é necessario baixar alguns pacotes para o windows, porém, o proprio windows vai realizar essa instalação, basta o usuario aceitar
16.	Após isso a instalação esta feita.

#### DIAGRAMA DE ENTIDADE DE RELACIONAMENTO 

o DER serve para identificarmos os objetos de dados que vão ser usados dentro do banco de dados. Nele a gente define o nome das entidades e os seus atributos, assim como definimos também o seus relacionamentos.

Temos a parte de generalização que e quando temos uma entidade que tem variações, um exemplo:
Temos uma entidade "empregado" e dentro dela temos "engenheiro e motorista" dessa forma definimos os atributos em empregado e eles são replicados para engenheiro e motorista, porém, mesmo assim ainda podemos adicionar atributos especificos para as entidades "engenheiro" e "motorista"

ATRIBUTOS:
Nas entidades de relacionamento definimos os atributos. Temos os atributos que sao as chaves primarias e estrangeiras, depois temos os atributos normais que seria nome,data, etc. São eles divididos em obrigatorio e nao obrigatorios, chaves sempre sao obrigatorias.

CARDINALIDADE:

UM PARA UM (1:1)  => ”um marido pode ter somente uma esposa e vice-versa”

Um para muitos (1:N) => ”um marido pode ter muitas esposas, mas uma esposa tem apenas um marido."

Muitos-para-muitos (N:N) =>  ”um marido pode ter várias mulheres, e  uma mulher pode ter vários maridos"

#### MODELO DE ENTIDADE DE RELACIONAMENTO

O MODELO DE ENTIDADE DE RELACIONAMENTO é um diagrama que facilita o entendimento tanto para o programador como para quem não é da área, dessa forma voce consegue aplicar conceitos para facilitarem a programação e o entendimento do banco de dados.
O MER é baseado no DER ou seja se voce tem um DER bem conceituado a fase seguinte é mais simples pois voce so vai redesenhar ele em forma de tabela.

Devemos seguir as tres regras de normalização para manter os dados consistentes quando entrarem no banco de dados são elas:

1 -  Identificar os atributos e seus respectivos tipos exemplo:
	Data = date
	Nome  = char
	ID = number (Facilita a indexação no banco de dados)
Ainda dentro dessa regra temos a premissa de dependecia ou seja temos tabelas que necessitam de outras para poder existir devem ser programadas primeiro.
2 - Não deixar redundancia de informações
3 - Identificar os relacionamentos de forma correta, como tabelas que são de N para N devem ter uma tabela no meio para gerenciar corretamente os dados e manter a sua consistencia.

#### Dicionário de Dados

As tabelas a seguir fornecem uma descrição completa de cada campo no banco de dados. Essa descrição inclui:

    Nome do campo.
    Chave.
        A chave Primária (P) é uma coluna ou conjunto de colunas que identifica exclusivamente o restante dos dados em qualquer linha específica da tabela.
        A chave Externa (E) é uma coluna na tabela que é uma chave primária em outra tabela, indicando que quaisquer dados em uma coluna de chave externa deve ter dados correspondentes na outra tabela em que essa coluna é a chave primária. Para bancos de dados, essa correspondência é conhecida como integridade referencial.
        O valor NOT NULL (NN) significa que a coluna deve ter um valor em cada linha. Se NULL foi utilizado, essa coluna pode ser deixada em branco em uma linha específica. 
    Tipo de dado.
    Tamanho do campo.
    Descrição do objetivo de cada campo.

    Nota:
        As características efetivas de "Tipo de Dados" e "Tamanho do Campo" dependem das implementações específicas do fornecedor de banco de dados. 


#### OBJETIVO DO TRABALHO DE LAB

Um banco de dados capaz de identificar as vagas preenchidas do estacionamento, o banco de dados vai verficar se já existe um carro estacionado caso encontre um carro estacionado, o banco de dados ira retornar que a vaga está sendo usada. senão ira cadastrar o carro na vaga.
Vamos armazenar as informações: nome do carro, cor, nome do dono.

#### O que é PL/SQL?

PL/SQL é uma extensão da linguagem SQL para banco de dados Oracle. Permite que a manipulação de dados seja incluída em unidades de programas. Blocos de PL/SQL são passados e processados por uma PL/SQL Engine que pode estar dentro de uma ferramenta Oracle ou do Server. A PL/SQL Engine filtra os comandos SQL e manda individualmente o comando SQL para o SQL Statement Executor no Oracle Server, que processa o PL/SQL com os dados retornados do Server.
Com PL/SQL, você pode usar instruções SQL para manipular dados do Oracle e controle de fluxo para processar os dados. Além disso, você pode declarar constantes e variáveis, definir procedimentos e funções. Assim, PL/SQL combina o poder de manipulação dos dados de SQL com o poder de processamento de dados das linguagens procedurais.
A unidade básica em PL/SQL é um bloco. Todos os programas em PL/SQL são compostos por blocos, que podem estar localizados uns dentro dos outros. Geralmente, cada bloco efetua uma ação lógica no programa. Um bloco tem basicamente a seguinte estrutura:

DECLARE
Seção para declaração de variáveis,tipos e subprogramas locais.
BEGIN
Seção Executável, nesta seção ficam as instruções procedimentais e SQL. Esta é a única seção do bloco que é indispensável e obrigatória.
EXCEPTION
Seção/Setor onde ficam as instruções de exceção. Ex: valor vazio, valor duplicado
END

#### O que é trigger e procedure?

As triggers assim como as stored procedures são armazenadas do banco de dados e podem ser compostas de instruções SQL e PL/SQL. Entretanto, stored procedure e triggers diferem na forma como estes são acionados. Uma stored procedure é explicitamente acionda por um usuário, aplicação ou trigger. As triggers são implicitamente disparadas pelo Oracle quando um determinado evento ocorre. O disparo da trigger independe do usuário ou aplicação que gerou o evento. 
 
#### Código SQL estacionamento

CREATE TABLE CARRO (
  ID_CARRO NUMBER(3) PRIMARY KEY,
  NOME_CARRO VARCHAR2(120) NOT NULL,
  NOME_DONO VARCHAR2(120) NOT NULL
);
CREATE TABLE LOG_CARRO(
 ID_LOG NUMBER(3) PRIMARY KEY,
 USUARIO VARCHAR2(30) NOT NULL,
 OPERACAO VARCHAR2(120) NOT NULL.
);

CREATE SEQUENCE SEQ_ID_CARRO
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_LOG_CARRO
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create or replace PROCEDURE ADD_CARRO(p_id in number,p_nome_carro IN VARCHAR2, p_nome_dono IN VARCHAR2)
IS
BEGIN
  insert into CARRO(ID_CARRO,NOME_CARRO,NOME_DONO)
  values(ID_CARRO,p_nome_carro,p_nome_dono);
  commit;
END ADD_CARRO;

CREATE OR REPLACE TRIGGER UPD_LOG_CARRO
BEFORE INSERT OR UPDATE
OF NOME_CARRO
ON CARRO
FOR EACH ROW
BEGIN

	IF INSERTING THEN
		INSERT INTO LOG_CARRO(ID_LOG,USUARIO,OPERACAO)
		VALUES(SEQ_LOG_CARRO.NEXTVAL,USER,'INSERT');
	END IF;

	IF UPDATING THEN
		INSERT INTO LOG_CARRO(ID_LOG,USUARIO,OPERACAO)
		VALUES(SEQ_LOG_CARRO.NEXTVAL,USER,'INSERT');
	END IF;

END;

--SELECT * FROM CARRO;
--SELECT * FROM LOG_CARRO;
--UPDATE CARRO SET NOME_CARRO = 'HONDA CIVIC' WHERE ID_CARRO = 29;
DECLARE 
BEGIN
	ADD_CARRO('FIESTA','BRUNO CARDODO'); 
END;

#### OBJETIVOS DA PROCEDURE/TRIGGER
A trigger vai servir para fazer a inserção na tabela de log caso haja update ou insert na coluna nome_carro, a tabela ira recebr o nome do usuario que fez a alteração e o tipo de operação realizada se foi um uodate ou um insert.
A Procedure tera a responsabilidade de inserir o nome do dono do carro e o nome do carro.
