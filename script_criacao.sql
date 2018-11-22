/*Comandos DDL - Data Definition Language*/
/*criacao do banco de dados*/
create database cinema;

/*selecionando o banco*/
use cinema;

/*criacao das tabelas atributos e relacoes*/
create table sala (
	cod_sala int not null unique auto_increment primary key,
    capacidade int not null
);

create table filme (
	cod_filme int not null unique auto_increment primary key,
    titulo varchar(45) not null,
    genero varchar(45) not null,
    duracao varchar(5) not null
);

create table sessao (
	cod_sessao int not null unique primary key,
    hora varchar(5) not null,
    qt_ingressos int not null,
    
    cod_sala int not null,
    foreign key (cod_sala) references  sala (cod_sala),
    cod_filme int not null,
    foreign key (cod_filme) references filme (cod_filme)
);

create table ingresso (
	cod_ingresso int not null unique auto_increment primary key,
    tipo varchar(45) not null,
    preco float not null,
    
    cod_sessao int not null,
    foreign key (cod_sessao) references sessao (cod_sessao),
    cod_filme int not null,
    foreign key (cod_filme) references filme (cod_filme),
    cod_sala int not null,
    foreign key (cod_sala) references sala (cod_sala)
);


/*----------------------------------------------------------------------------*/
/*adicionando a tabela genero - 1:n com tabela filme*/
create table genero (
	cod_genero int not null unique auto_increment primary key,
    descricao varchar(45) not null
);

/*alteracao na organizacao de tabelas*/
/*removendo o atributo genero dentro da tabela filme*/
alter table filme drop genero;

/*adicionando a coluna genero na tabela filme que eh foreign key da nova tabela genero*/
alter table filme add column cod_genero int not null;
alter table filme add foreign key (cod_genero) references genero (cod_genero);


/*adicionando a tabela tipo_ingresso 1:n com tabela ingresso*/
create table tipo_ingresso (
	cod_tipo_ingresso int not null unique auto_increment primary key,
    descricao varchar(10) not null,
    preco float not null
);

/*alteracao na organizacao de tabelas*/
/*removendo o atributo tipo e preco dentro da tabela ingresso*/
alter table ingresso drop tipo;
alter table ingresso drop preco;

/*adicionando a coluna genero na tabela filme que eh foreign key da nova tabela genero*/
alter table ingresso add column cod_tipo_ingresso int not null;
alter table ingresso add foreign key (cod_tipo_ingresso) references tipo_ingresso (cod_tipo_ingresso);


/*adicionando o campo dia na tabela sessao*/
alter table sessao add column dia date;

/*----------------------------------------------------------------------------*/


/*Comandos DML - Data Manipulation Language*/

/*selecao de todos dados da tabela*/
select * from sala;
select * from filme;
select * from genero;
select * from sessao;
select * from ingresso;
select * from tipo_ingresso;

/*insercao de dados*/
/*inserindo dados das salas*/
insert into sala (capacidade) values (50),(100),(100),(120),(120),(150),(150);

/*dados inseridos antes de separar genero em uma entidade*/
insert into filme (titulo, genero, duracao) values ('filme A', 'comedia', '1:30');
insert into filme (titulo, genero, duracao) values ('filme B', 'drama', '1:32');
insert into filme (titulo, genero, duracao) values ('filme C', 'açao', '2:00');

/*dados inseridos apos criacao de entidade genero para normalizacao*/
insert into filme (titulo, duracao, cod_genero) values ('filme D', '2:09', 4);

/*inserindo dados de generos*/
insert into genero (descricao) values ('ação'), ('comedia'), ('drama'), ('aventura');

/*----------------------------------------------------------------------------*/
/*atualizando dados para inserir cod_genero - estrangeira*/
update filme set cod_genero = 2 where cod_filme = 1;
update filme set cod_genero = 3 where cod_filme = 2;
update filme set cod_genero = 1 where cod_filme = 3;

/*atualizando dado do campo dia que foi incluido na tabela sessao*/
update sessao set dia = '2018-11-01' where cod_sessao = 1;
/*----------------------------------------------------------------------------*/


/*inserindo dados da sessao*/
insert into sessao (cod_sessao, hora, qt_ingressos, cod_sala, cod_filme) values (01, '10:30', 50, 1, 1);

/*dados do tipo de ingresso*/
insert into tipo_ingresso (descricao, preco) values ('inteira',20.00),('meia',10.00),('cortesia',0.00);

/*dados da compra de ingressos*/
insert into ingresso (cod_sessao,cod_filme, cod_sala, cod_tipo_ingresso) values (01,1,1,1);

/*quando compra ingresso atualiza a tabela de sessao decrementando os ingressos disponiveis*/
update sessao set qt_ingressos = qt_ingressos - 1 where cod_sessao = 1 ;

/*exibicao de dados do ingresso para o usuario - usando elementos apresentado em sala -  exibe: nome do filme, genero, sala, data, hora da sessao, tipo*/
select ingresso.cod_ingresso as codigo_ingresso, filme.titulo as filme, genero.descricao as genero, sessao.cod_sala as sala, sessao.dia as data, sessao.hora as hora, tipo_ingresso.descricao from ingresso
inner join filme on filme.cod_filme = ingresso.cod_filme
inner join genero on genero.cod_genero = filme.cod_genero
inner join sessao on sessao.cod_sessao = ingresso.cod_sessao
inner join tipo_ingresso on tipo_ingresso.cod_tipo_ingresso = ingresso.cod_tipo_ingresso;
