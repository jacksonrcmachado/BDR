-- \c postgres
-- drop database bd_aula03;

-- criar banco de dados bd_aula03
create database bd_aula03;

-- acessar o banco de dados criado
\c bd_aula03

-- criar tabelas do MER
create table tbl_cliente(codigo_cliente integer primary key,Nome text NOT NULL,Cidade text,Endereco text);
create table tbl_titulo(codigo_titulo integer primary key,titulo text NOT NULL,descricao text,categoria text);
create table tbl_emprestimo(numero_emprestimo integer primary key,codigo_cliente text,codigo_livro text);
create table tbl_livros(cod_livro integer primary key,codigo_titulo text,status text);

-- criar domains
Create domain chk_categoria text check (value
in('DRAMA','COMEDIA'));
Create domain chk_status text check (value
in('DISPONIVEL','ALUGADO'));

-- adicionar domain na coluna da tabela
alter table tbl_titulo alter column categoria type chk_categoria;
alter table tbl_livros alter column status type chk_status;

-- adicionar chaves estrangeiras
alter table tbl_emprestimo alter column codigo_cliente type integer USING codigo_cliente::integer;
alter table tbl_emprestimo add constraint FK FOREIGN KEY (codigo_cliente) REFERENCES tbl_cliente(codigo_cliente);

alter table tbl_emprestimo alter column codigo_livro type integer USING codigo_livro::integer;
alter table tbl_emprestimo add constraint FK1 FOREIGN KEY (codigo_livro) REFERENCES tbl_livros(cod_livro);

alter table tbl_livros alter column codigo_titulo type integer USING codigo_titulo::integer;
alter table tbl_livros add constraint FK2 FOREIGN KEY (codigo_titulo) REFERENCES tbl_titulo(codigo_titulo);
