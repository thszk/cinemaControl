/*dados inseridos apos aplicacao de normalizacao*/

/*inserindo filme*/
insert into filme (titulo, duracao, cod_genero) values ('filme D', '2:09', 4);

/*dados do tipo de ingresso*/
insert into tipo_ingresso (descricao, preco) values ('inteira',20.00),('meia',10.00),('cortesia',0.00);

/*inserindo dados da sessao*/
insert into sessao (cod_sessao, hora, qt_ingressos, cod_sala, cod_filme, dia) values (01, '10:30', 50, 1, 1, '2018-11-01');
insert into sessao (cod_sessao, hora, qt_ingressos, cod_sala, cod_filme, dia) values (02, '15:30', 100, 2, 2, '2018-11-10');
insert into sessao (cod_sessao, hora, qt_ingressos, cod_sala, cod_filme, dia) values (03, '20:00', 150, 6, 4, '2018-11-13');
insert into sessao (cod_sessao, hora, qt_ingressos, cod_sala, cod_filme, dia) values (04, '23:00', 120, 4, 3, '2018-11-17');

/*dados da compra de ingressos*/
insert into ingresso (cod_sessao,cod_filme, cod_sala, cod_tipo_ingresso) values (01,1,1,1);
insert into ingresso (cod_sessao,cod_filme, cod_sala, cod_tipo_ingresso) values (02,2,2,1);
insert into ingresso (cod_sessao,cod_filme, cod_sala, cod_tipo_ingresso) values (03,4,6,2);
insert into ingresso (cod_sessao,cod_filme, cod_sala, cod_tipo_ingresso) values (04,3,4,3);

/*quando compra ingresso atualiza a tabela de sessao decrementando os ingressos disponiveis*/
update sessao set qt_ingressos = qt_ingressos - 1 where cod_sessao = 1 ;
update sessao set qt_ingressos = qt_ingressos - 1 where cod_sessao = 2 ;
update sessao set qt_ingressos = qt_ingressos - 1 where cod_sessao = 3 ;
update sessao set qt_ingressos = qt_ingressos - 1 where cod_sessao = 4 ;