\c postgres
drop database bd_aula04;

-- criar banco de dados bd_aula04
create database bd_aula04;

-- acessar o banco de dados criado
\c bd_aula04;

-- tabelas para o exercicios
create domain chk_categoria text check (value='DRAMA' or value='COMEDIA');
create domain chk_status text check (value='DISPONIVEL' or value='ALUGADO');
create table tbl_cliente (codigo_cliente integer PRIMARY KEY, nome text not null, cidade text, endereco text);
create table tbl_titulo (codigo_titulo integer primary key, titulo text not null, descricao text, categoria chk_categoria);
create table tbl_livros (cod_livro integer PRIMARY KEY, codigo_titulo integer REFERENCES tbl_titulo(codigo_titulo), status chk_status DEFAULT 'DISPONIVEL');
create table tbl_emprestimo (numero_emprestimo integer PRIMARY KEY, codigo_cliente integer REFERENCES tbl_cliente(codigo_cliente), codigo_livro integer REFERENCES tbl_livros(cod_livro));

-- Inserir dados na tabela tbl_cliente
INSERT INTO tbl_cliente (codigo_cliente, nome, cidade, endereco)
VALUES                                  
(1, 'João Silva',    'São Paulo',       'Rua A, 123' ),
(2, 'Maria Santos',  'Rio de Janeiro',  'Av. B, 456' ),
(3, 'Pedro Almeida', 'Belo Horizonte',  'Rua C, 789' ),
(4, 'Ana Oliveira',  'Salvador',        'Av. D 1011' ),
(5, 'Carlos Lima',   'Brasília',        'Rua E, 1213' );
