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


/*Comandos DML - Data Manipulation Language*/

/*insercao de dados*/
insert into sala (capacidade) values (50),(100),(100),(120),(120),(150),(150);
select * from sala;

insert into filme (titulo, genero, duracao) values ('filme A', 'comedia', '1:30');
insert into filme (titulo, genero, duracao) values ('filme B', 'drama', '1:32');
insert into filme (titulo, genero, duracao) values ('filme C', 'açao', '2:00');
select * from filme;

insert into sessao (cod_sessao, hora, qt_ingressos, cod_sala, cod_filme) values (01, '10:30', );

insert into ingresso (tipo, preco, cod_sessao, cod_filme, cod_sala) values ();

