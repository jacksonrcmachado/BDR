-- Entrar no banco de dados da aula 08
\c bd_aula08

--1 Listar o nome e a cidade dos fornecedores com mais de 10 peças. Contar só as peças de código 1.
SELECT nome, cidade 
FROM tbl_fornecedor 
WHERE cod_fornecedor 
IN 
( SELECT cod_fornecedor 
FROM tbl_estoque 
WHERE quantidade >10 AND cod_peca=1);

--2  Encontre o nome das peças com preço superior a 10 que estão disponíveis em estoque:
SELECT nome 
FROM tbl_peca 
WHERE cod_peca 
IN 
(SELECT cod_peca 
FROM tbl_estoque 
WHERE cod_peca IS NOT NULL AND preco > 10);

--3 Selecione o nome das peças que não estão em estoque:
SELECT nome 
FROM tbl_peca 
WHERE cod_peca 
NOT IN 
(SELECT cod_peca 
FROM tbl_estoque);

--4 Encontre o nome das peças que estão em estoque com uma quantidade maior que 20:
SELECT nome 
FROM tbl_peca 
WHERE cod_peca 
IN 
(SELECT cod_peca 
FROM tbl_estoque 
WHERE quantidade > 20);

--5 Listar todas as pecas exceto a PLACA, ordenado por nome
SELECT * FROM tbl_peca 
EXCEPT 
SELECT * FROM tbl_peca 
WHERE nome = 'PLACA' 
order by nome;

--6 Listar o nome e a cor das peças do fornecedor C, ordenado pelo nome da peça
SELECT nome, cor
FROM tbl_peca
WHERE cod_peca
IN
(SELECT cod_peca
FROM tbl_estoque
WHERE cod_fornecedor
IN
(SELECT cod_fornecedor 
FROM tbl_fornecedor 
WHERE nome = 'C'))
order by nome;

--7 Listar o nome e a cor de todas as pecas de Londres
SELECT nome, cor 
FROM tbl_peca 
INTERSECT 
SELECT nome, cor 
FROM tbl_peca 
WHERE cidade = 'LONDRES';

--8 Encontre o nome das peças que estão disponíveis em estoque em Londres e não estão disponíveis em estoque em Paris:
SELECT DISTINCT(nome)
FROM tbl_peca
WHERE cod_peca  
IN (
SELECT cod_peca
FROM tbl_estoque
WHERE cod_fornecedor 
IN (
SELECT cod_fornecedor
FROM tbl_fornecedor
WHERE cidade != 'PARIS'
));


--9 Quais os codigos das peças que possuem maior estoque do que a peça de codigo 2?
SELECT distinct(cod_peca)
FROM tbl_estoque
WHERE quantidade > (
SELECT quantidade
FROM tbl_estoque
WHERE cod_peca = 2)
order by cod_peca;
