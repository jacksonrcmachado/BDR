-- Entrar no banco de dados da aula 07
\c bd_aula07 

--1 Listar o nome dos fornecedores(maiusculo) e das peças(minusculo) que se situam na mesma cidade, ordenado pelo nome
SELECT UPPER(f.nome), LOWER(p.nome) 
FROM tbl_peca as p
INNER JOIN tbl_fornecedor f ON f.cidade=p.cidade
ORDER  BY f.nome ASC;

--2 listar as cidades onde existem fornecedores (sem valores duplicados)
SELECT DISTINCT(cidade)
FROM tbl_fornecedor;

--3 Listar o nome e a cor das peças do fornecedor com código 3, ordenado pelo nome da peça
SELECT p.nome, p.cor
FROM tbl_peca p
INNER JOIN tbl_estoque e ON e.cod_peca=p.cod_peca
INNER JOIN tbl_fornecedor f ON f.cod_fornecedor=e.cod_fornecedor
WHERE f.cod_fornecedor = 3;

--4 Listar o nome e a cidade dos fornecedores com mais de 10 peças.Contar só as peças de código 1. 
SELECT f.nome, f.cidade
FROM tbl_fornecedor f
INNER JOIN tbl_estoque e on e.cod_fornecedor=f.cod_fornecedor
WHERE e.quantidade > 10 AND e.cod_peca = 1;


--5 Listar a quantidade total de peças com código 1, fornecidas pelos fornecedores.
SELECT sum(quantidade)
FROM tbl_estoque
WHERE cod_peca = 1;

--6 Listar a média dos preços das peças fornecidas pelo fornecedor com código 3.
SELECT avg(p.preco)
FROM tbl_peca p
INNER JOIN tbl_estoque e ON e.cod_peca=p.cod_peca
INNER JOIN tbl_fornecedor f ON f.cod_fornecedor=e.cod_fornecedor
WHERE f.cod_fornecedor = 3;

--7 lista o valor da pecas mais cara e a mais barata.
SELECT max(preco) as "Mais cara", min(preco) as "Mais barata"
FROM tbl_peca;

--8 listar a quantidade de peças cadastradas
SELECT count(nome) as "Quantidade"
FROM tbl_peca;

--9 listar a quantidade de cidades diferentes onde existem peças cadastradas
SELECT count(DISTINCT(cidade)) as "Quantidade Cidades"
FROM tbl_peca;

--10 listar a media dos precos de todas as peças, com somente 1 digito após a virgula.
SELECT round(avg(preco),1)
FROM tbl_peca;
