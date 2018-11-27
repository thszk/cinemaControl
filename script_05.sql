/*selecao de todos dados da tabela*/
select * from sala;
select * from filme;
select * from genero;
select * from sessao;
select * from ingresso;
select * from tipo_ingresso;

/*exibicao de dados do ingresso para o usuario - usando elementos apresentado em sala -  exibe: nome do filme, genero, sala, data, hora da sessao, tipo*/
select ingresso.cod_ingresso as codigo_ingresso, filme.titulo as filme, genero.descricao as genero, sessao.cod_sala as sala, sessao.dia as data, sessao.hora as hora, tipo_ingresso.descricao from ingresso
inner join filme on filme.cod_filme = ingresso.cod_filme
inner join genero on genero.cod_genero = filme.cod_genero
inner join sessao on sessao.cod_sessao = ingresso.cod_sessao
inner join tipo_ingresso on tipo_ingresso.cod_tipo_ingresso = ingresso.cod_tipo_ingresso;