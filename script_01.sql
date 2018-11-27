/*criacao do banco de dados*/
create database controle_cinema;

/*destruicao do bando de dados*/
/*
drop database controle_cinema;
*/

/*selecionando o banco*/
use controle_cinema;

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