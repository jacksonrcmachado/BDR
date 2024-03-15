-- Exercício aula 06
--1 Liste os títulos e seus status, incluindo os que não têm status definido. (retorna 6 linhas)
SELECT t.titulo, l.status
FROM tbl_titulo t
LEFT JOIN tbl_livros l ON t.codigo_titulo = l.codigo_titulo;

--2 Liste os títulos e suas descrições dos livros alugados (retorna 4 linhas)
SELECT t.titulo, t.descricao, l.status
FROM tbl_titulo t
INNER JOIN tbl_livros l ON t.codigo_titulo=l.codigo_titulo
WHERE l.status like 'ALUGADO';

--3 Liste os nomes dos clientes que não têm livros alugados (retorna 1 linha)
SELECT c.nome
FROM tbl_cliente c
LEFT JOIN tbl_emprestimo e ON c.codigo_cliente=e.codigo_cliente
WHERE e.codigo_livro is null;

--4 Liste os títulos e suas categorias dos livros disponiveis (retorna 1 linha).
SELECT t.titulo, t.categoria
FROM tbl_titulo t
RIGHT JOIN tbl_livros l ON t.codigo_titulo=l.codigo_titulo
WHERE l.status like 'DISPONIVEL';

--5 Liste os nomes dos clientes e os títulos dos livros que eles têm alugados (retorna 5 linhas).
SELECT c.nome, t.titulo
FROM tbl_titulo as t
INNER JOIN tbl_livros l ON l.codigo_titulo=t.codigo_titulo
INNER JOIN tbl_emprestimo e ON l.cod_livro=e.codigo_livro
FULL JOIN tbl_cliente c ON c.codigo_cliente=e.codigo_cliente;

--6 Retorne o nome, titulo do livro e o status do esmprestimo do livro alugado pela Ana Oliveira (retorna 1 linha)
SELECT c.nome, t.titulo, l.status
FROM tbl_titulo as t
INNER JOIN tbl_livros l ON l.codigo_titulo=t.codigo_titulo
INNER JOIN tbl_emprestimo e ON l.cod_livro=e.codigo_livro
INNER JOIN tbl_cliente c ON c.codigo_cliente=e.codigo_cliente
WHERE c.nome like 'Ana Oliveira';
