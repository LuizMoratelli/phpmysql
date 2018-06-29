/*1*/
CREATE TABLE pessoa (
    pes_cpf CHAR(11) NOT NULL,
    nome VARCHAR(40) NOT NULL,
    identidade VARCHAR(10) NOT NULL,
    orgao VARCHAR(10) NOT NULL,
    sexo CHAR(1) NOT NULL,
    nascimento TIMESTAMP NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cep VARCHAR(20) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    CONSTRAINT pk_cpf PRIMARY KEY (pes_cpf)
);

/*2*/
CREATE TABLE notafiscal (
	nf_numero INTEGER NOT NULL,
    data TIMESTAMP NOT NULL,
    parcela INTEGER NOT NULL,
    vencimento TIMESTAMP NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    formapagto VARCHAR(20) NOT NULL,
    pagamento TIMESTAMP NOT NULL,
    valorpago DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_nf PRIMARY KEY (nf_numero)
);

/*3*/
ALTER TABLE notafiscal
ADD pes_cpf CHAR(11);

ALTER TABLE notafiscal
ADD CONSTRAINT fk_cpf
FOREIGN KEY (pes_cpf) REFERENCES pessoa(pes_cpf);

/*4*/
CREATE TABLE cep (
	cep CHAR(8) NOT NULL,
    estado CHAR(2) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    CONSTRAINT pk_cep PRIMARY KEY (cep)
);

ALTER TABLE pessoa
DROP COLUMN cep,
DROP COLUMN estado,
DROP COLUMN cidade,
DROP COLUMN endereco,
ADD numero VARCHAR(10),
ADD complemento VARCHAR(50),
ADD cep CHAR(8),
ADD CONSTRAINT fk_cep
FOREIGN KEY (cep) REFERENCES cep (cep);

CREATE TABLE formapagamento (
	fpg_codigo INTEGER NOT NULL,
    formapagto VARCHAR(10) NOT NULL,
    CONSTRAINT pk_fpg PRIMARY KEY (fpg_codigo)
);

ALTER TABLE notafiscal 
DROP COLUMN parcela,
DROP COLUMN vencimento,
DROP COLUMN valor,
DROP COLUMN formapagto,
DROP COLUMN pagamento,
DROP COLUMN valorpago;

CREATE TABLE parcela (
	nf_numero INTEGER NOT NULL,
    par_numero INTEGER NOT NULL,
    vencimento TIMESTAMP NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    pagamento TIMESTAMP NOT NULL,
    valorpago DECIMAL(10,2) NOT NULL,
    fpg_codigo INTEGER NOT NULL,
    CONSTRAINT fk_fpg FOREIGN KEY (fpg_codigo) REFERENCES formapagamento (fpg_codigo),
    CONSTRAINT fk_nf FOREIGN KEY (nf_numero) REFERENCES notafiscal (nf_numero),
    CONSTRAINT pk_parcela PRIMARY KEY (nf_numero, par_numero)
);

/*5*/
INSERT INTO cep VALUES ('12345678', 'SC', 'Uberlândia', 'Rua XXXX');
INSERT INTO cep VALUES ('87654321', 'PR', 'Presidente Nereu', 'Rua YYYY');

INSERT INTO pessoa VALUES ('66366663636', 'João', '1234567890', 'SSP', 'M', '2017-05-04 12:00:00', '623', 'Casa', '12345678');
INSERT INTO pessoa VALUES ('12345678901', 'Thiago', '0987654321', 'SSI', 'F', '1999-05-04 12:00:00', '546', 'Apt.', '12345678');
INSERT INTO pessoa VALUES ('89545435654', 'Joana', '0987654321', 'SPI', 'M', '1967-05-04 12:00:00', '546', 'Apt.', '87654321');

INSERT INTO formapagamento VALUES (1, 'Cartão');
INSERT INTO formapagamento VALUES (2, 'Boleto');

INSERT INTO notafiscal VALUES (1, '2018-06-05 12:00:00', '66366663636');
INSERT INTO notafiscal VALUES (2, '2018-06-04 12:00:00', '66366663636');
INSERT INTO notafiscal VALUES (3, '2018-06-03 12:00:00', '12345678901');
INSERT INTO notafiscal VALUES (4, '2018-06-02 12:00:00', '12345678901');
INSERT INTO notafiscal VALUES (5, '2018-06-01 12:00:00', '89545435654');

INSERT INTO parcela VALUES (1, 1, '2018-06-08 18:00:00', '100.00', '2018-06-07 18:00:00', '100.00', 1);
INSERT INTO parcela VALUES (1, 2, '2018-07-08 18:00:00', '100.00', '2018-07-07 18:00:00', '100.00', 1);
INSERT INTO parcela VALUES (2, 1, '2018-06-07 18:00:00', '150.00', '2018-06-06 18:00:00', '150.00', 1);
INSERT INTO parcela VALUES (2, 2, '2018-07-07 18:00:00', '150.00', '2018-07-06 18:00:00', '150.00', 1);
INSERT INTO parcela VALUES (3, 1, '2018-06-06 18:00:00', '75.00', '2018-06-05 18:00:00', '75.00', 2);
INSERT INTO parcela VALUES (3, 2, '2018-07-06 18:00:00', '75.00', '2018-07-05 18:00:00', '75.00', 2);
INSERT INTO parcela VALUES (4, 1, '2018-06-05 18:00:00', '50.00', '2018-06-04 18:00:00', '50.00', 1);
INSERT INTO parcela VALUES (4, 2, '2018-07-05 18:00:00', '50.00', '2018-07-04 18:00:00', '50.00', 1);
INSERT INTO parcela VALUES (5, 1, '2018-06-04 18:00:00', '125.00', '2018-06-03 18:00:00', '125.00', 2);
INSERT INTO parcela VALUES (5, 2, '2018-07-04 18:00:00', '125.00', '2018-07-03 18:00:00', '125.00', 2);


/*10zão :P*/ 


/*SELECT * [DISTINCT] <lista de colunas> [AS <apelido>]*/
/*FROM <lista de tables ou visões> [<apelido>]*/
/*[WHERE <condicao>]*/
/*[GROUP BY <lista de colunas> [HAVING <condicao>]]*/
/*[ORDER BY <lista de colunas> [DESC]]*/

/*GROUP BY + WHERE = ELIMINA E FILTRA*/
/*GROUP BY + SUM   = FILTRA E ELIMINA*/
/*FUNCOES AGREGADAS N PODEM IR NO WHERE,JÁ NO HAVING É O CONTRARIO*/

/*1*/
  SELECT cli.nome, cli.cargo, cli.endereco, cli.cep, cli.cidade, cli.pais, cli.clienteid
    FROM clientes cli
ORDER BY 1;/*pode usar número da coluna do select*/

/*2*/
  SELECT cli.nome, cli.cargo, cli.endereco, cli.cep, cli.cidade, cli.clienteid
    FROM clientes cli
   WHERE cli.pais = 'Brazil'
ORDER BY cli.cidade, cli.nome;/*ordenação composta*/

/*Domínios = De uma tabela de 91*9 gerou uma tabela de 91*6*/
/*Se criar em minusculo pode usar tanto em maius como em minus, se fosse em maiusculo seria como aspas*/
/*3*/
SELECT EXTRACT(MONTH FROM ped.datapedido), cli.nome, cli.cidade||'-'||cli.pais AS CidadePais /*extrair um mês do timestamp, concatenação de cidade e país e apelido para nome da coluna*/
  FROM pedidos ped
  JOIN clientes cli 
    ON   ped.clienteid = cli.clienteid /*junção onde os valores coincidirem*/
 WHERE EXTRACT(YEAR FROM ped.datapedido) = 1996; /*extrair o ano de um timestamp*/
/*o melhor para estar no from é a tabela mais associativa, que tem mais pés de galinhas apontados (pedidos),
	pois o número de linhas não sofre alteração, dessa forma mais performático, pois só precisará adicionar as colunas posteriormente.
	Domínio de pedidos = 830 linhas x 3 colunas
    Domínio do clientes = 91 * 9
    Domínio de pedidos join clientes =  830 x (3+9)
    Domínio de clientes join pedidos =  830 x (3+9)
*/

/*4*/
SELECT pro.produtonome, cat.categoria, dpd.precovenda, dpd.quantidade, (dpd.precovenda * dpd.quantidade) AS valor_item
  FROM detalhes_pedido dpd
  JOIN produtos pro 
    ON dpd.produtoid = pro.produtoid
  JOIN categorias cat 
    ON pro.categoriaid = cat.categoriaid;
/*
	A ordem dos Joins deve ser de acordo com o percurso das tabelas
    No Join usa a FK na frente
    No Order By o indice é melhor
    criar indices para usar como chave estrangeira acelera o banco
*/

/*5*/
SELECT pro.produtonome, (dpd.precovenda * dpd.quantidade) AS valor_bruto, 
	   (dpd.precovenda * dpd.quantidade * (1 - dpd.desconto)) AS valor_liquido
  FROM detalhes_pedido dpd
  JOIN produtos pro 
    ON dpd.produtoid = pro.produtoid
  JOIN categorias cat 
    ON pro.categoriaid = cat.categoriaid
 WHERE cat.categoria= 'Padaria';
 
/*6*/
  SELECT cli.pais, cli.cidade, AVG(dpd.quantidade * dpd.precovenda), COUNT(*)
    FROM detalhes_pedido dpd
    JOIN pedidos ped 
      ON dpd.pedidoid = ped.pedidoid
    JOIN clientes cli 
      ON ped.clienteid = cli.clienteid
GROUP BY cli.pais, cli.cidade;

/*
	Dois você agrupa e um usa na função agregadora
    Funções agregadores básicas: avg, max, min, sum, count(*) ou count(1)
*/
/*7*/
/*1 - Listar a quantidade de pedidos por pais no ano de 1996*/
  SELECT cli.pais, COUNT(*)
    FROM pedidos ped
    JOIN clientes cli
      ON ped.clienteid = cli.clienteid
   WHERE EXTRACT(YEAR FROM ped.datapedido) = 1996
GROUP BY cli.pais
ORDER BY 2 DESC;
/*com where antes se reduz a quantidade de linhas antes de realizar o group by*/
/*2 - Listar a quantidade de pedidos por pais desde que seja > 50 vendas*/
  SELECT cli.pais, COUNT(*)
    FROM pedidos ped
    JOIN clientes cli
      ON ped.clienteid = cli.clienteid
GROUP BY cli.pais
  HAVING COUNT(*) > 50
ORDER BY 2 DESC;
/*where é para as tabelas, having é para as funções agregadoras*/
/*3 - Listar a quantidade de vendas por pais no ano de 1997 desde que seja > 10 vendas*/
  SELECT cli.pais, COUNT(*)
    FROM pedidos ped
    JOIN clientes cli
      ON ped.clienteid = cli.clienteid
   WHERE EXTRACT(YEAR FROM ped.datapedido) = 1997
GROUP BY cli.pais
  HAVING COUNT(*) > 10
ORDER BY 2 DESC;
/*Verificar Ordem dos Joins*/