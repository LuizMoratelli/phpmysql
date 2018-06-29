CREATE TABLE produtos (
    id INTEGER AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    preco NUMERIC(10,2) NOT NULL,
    CONSTRAINT pk_produtos PRIMARY KEY (id)
);

INSERT INTO produtos values (1, 'Carro', 20000);
INSERT INTO produtos values (2, 'Motocicleta', 10000);
INSERT INTO produtos (nome, preco) values ('Bicicleta', 300);

ALTER TABLE produtos ADD COLUMN descricao text;

UPDATE produtos SET descricao = 'Descrição desde produto';

CREATE TABLE categorias (
    id INTEGER AUTO_INCREMENT,
    nome VARCHAR(255),
    CONSTRAINT pk_categorias PRIMARY KEY (id)
);

INSERT INTO categorias (nome) values ('esporte'), ('escolar'), ('mobilidade');
INSERT INTO categorias (nome) values ('guloseimas');

ALTER TABLE produtos 
ADD COLUMN categoria INTEGER,
ADD CONSTRAINT fk_categoria
FOREIGN KEY (categoria) REFERENCES categorias (id);

UPDATE produtos SET categoria = 3;

ALTER TABLE produtos
ADD COLUMN usado BOOLEAN 
DEFAULT 0;