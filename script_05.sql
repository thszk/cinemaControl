/*selecao de todos dados da tabela*/
select * from sala;
select * from filme;
select * from genero;
select * from sessao;
select * from ingresso;
select * from tipo_ingresso;

-- Comando IN e BETWEEN
select * from sala where capacidade in (50, 120); 
select * from filme where cod_genero in (1, 4);
select * from sessao where hora between '10:00' AND '20:00';
select * from ingresso where cod_sala between 2 AND 5;

-- Comando ORDER BY e GROUP BY
select * from sessao order by cod_sala; -- Tabela sessao ordenada por cod_sala
select * from ingresso order by cod_filme; -- Tabela ingresso ordenada por cod_filme
select cod_tipo_ingresso, count(*) from ingresso group by cod_tipo_ingresso; -- Conta a quantidade de cada tipo de ingresso na tabela Ingressos

-- Comandos de AGREGAÇÃO
select count(*) from filme; -- Quantidade de filmes na tabela filmes
select sum(capacidade) from sala; -- Soma da capacidade de todas as salas na tabela sala
select avg(qt_ingressos) from sessao; -- Media da quantidade de ingressos na tabela sessao
select max(qt_ingressos) from sessao; -- Quantidade de ingressos máxima entre todas as sessoes 
select min(capacidade) from sala; -- Capacidade mínima entre todas as salas salas

/*exibicao de dados do ingresso para o usuario - usando elementos apresentado em sala -  exibe: nome do filme, genero, sala, data, hora da sessao, tipo*/
select ingresso.cod_ingresso as codigo_ingresso, filme.titulo as filme, genero.descricao as genero, sessao.cod_sala as sala, sessao.dia as data, sessao.hora as hora, tipo_ingresso.descricao from ingresso
inner join filme on filme.cod_filme = ingresso.cod_filme
inner join genero on genero.cod_genero = filme.cod_genero
inner join sessao on sessao.cod_sessao = ingresso.cod_sessao
inner join tipo_ingresso on tipo_ingresso.cod_tipo_ingresso = ingresso.cod_tipo_ingresso;   

-- CROSS, LEFT E RIGHT JOIN
select ingresso.cod_tipo_ingresso as tipo_ingresso, tipo_ingresso.preco as preco_ingressos from tipo_ingresso 
cross join ingresso;

select sessao.*,filme.* from sessao left join filme on sessao.cod_filme = filme.cod_filme;

select ingresso.*, tipo_ingresso.* 
from ingresso right join tipo_ingresso on ingresso.cod_tipo_ingresso = tipo_ingresso.cod_tipo_ingresso;