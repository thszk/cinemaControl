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



/*Comandos DML - Data Manipulation Language*/

/*insercao de dados*/

insert into sala (capacidade) values (50),(100),(100),(120),(120),(150),(150);

/*dados inseridos antes de separar genero em uma entidade*/
insert into filme (titulo, genero, duracao) values ('filme A', 'comedia', '1:30');
insert into filme (titulo, genero, duracao) values ('filme B', 'drama', '1:32');
insert into filme (titulo, genero, duracao) values ('filme C', 'açao', '2:00');

/*dados inseridos apos criacao de entidade genero para normalizacao*/
insert into filme (titulo, duracao, cod_genero) values ('filme D', '2:09', 4);

insert into genero (descricao) values ('ação'), ('comedia'), ('drama'), ('aventura');

/*atualizando dados para inserir cod_genero - estrangeira*/
update filme set cod_genero = 2 where cod_filme = 1;
update filme set cod_genero = 3 where cod_filme = 2;
update filme set cod_genero = 1 where cod_filme = 3;

insert into sessao (cod_sessao, hora, qt_ingressos, cod_sala, cod_filme) values (01, '10:30', 50, 1, 1);

insert into ingresso (tipo, preco, cod_sessao, cod_filme, cod_sala) values ();

/*selecao de todos dados da tabela*/
select * from sala;
select * from filme;
select * from genero;
select * from sessao;