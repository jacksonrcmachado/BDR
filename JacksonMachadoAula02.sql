create database bd_sistema_bancario;

\c bd_sistema_bancario

create table clientes(nome_cliente text, endereco_cliente text,telefone_cliente text, email_cliente text);
create table contas(numero_contas text);
create table produtos(nome_produto text);
create table funcionarios(nome_funcionario text);
create table caixas(numero_caixa text);

create table cliente(NOME_CLIENTE text, CIDADE_CLIENTE text, ENDERECO_CLIENTE text);
create table conta(NUMERO_CONTA text, NOME_AGENCIA text, SALDO text);
create table emprestimo(NUMERO_EMPRESTIMO text, NOME_AGENCIA text, VALOR text);
create table agencia(NOME_AGENCIA text, CIDADE_AGENCIA text, DEPOSITOS text);

drop table clientes;
drop table contas;
drop table produtos;
drop table funcionarios;
drop table caixas;

alter table cliente rename to tbl_cliente;     
alter table tbl_cliente add column IDADE text;          
alter table tbl_cliente add column CPF text;

alter table conta rename to tbl_conta;               

alter table emprestimo rename to tbl_emprestimo;

alter table agencia rename to tbl_agencia;
