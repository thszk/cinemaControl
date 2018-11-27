/*adicionando a tabela genero - 1:n com tabela filme*/
create table genero (
	cod_genero int not null unique auto_increment primary key,
    descricao varchar(45) not null
);

/*removendo o atributo genero dentro da tabela filme*/
alter table filme drop genero;

/*adicionando a coluna genero na tabela filme que sera foreign key da nova tabela genero*/
alter table filme add column cod_genero int not null;

/*inserindo dados de generos*/
insert into genero (descricao) values ('ação'), ('comedia'), ('drama'), ('aventura');

/*atualizando dados para inserir cod_genero na tabela filme como foreign key*/
update filme set cod_genero = 2 where cod_filme = 1;
update filme set cod_genero = 3 where cod_filme = 2;
update filme set cod_genero = 1 where cod_filme = 3;

/*referencia o cod_genero como foreign key*/
alter table filme add foreign key (cod_genero) references genero (cod_genero);



/*adicionando a tabela tipo_ingresso - 1:n com tabela ingresso*/
create table tipo_ingresso (
	cod_tipo_ingresso int not null unique auto_increment primary key,
    descricao varchar(10) not null,
    preco float not null
);

/*removendo o atributo tipo e preco da tabela ingresso*/
alter table ingresso drop tipo;
alter table ingresso drop preco;

/*adicionando a coluna cod_tipo_ingresso na tabela ingresso que eh foreign key da nova tabela tipo_ingresso*/
alter table ingresso add column cod_tipo_ingresso int not null;
alter table ingresso add foreign key (cod_tipo_ingresso) references tipo_ingresso (cod_tipo_ingresso);



/*adicionando o campo dia na tabela sessao*/
alter table sessao add column dia date;

/*atualizando dado do campo dia que foi incluido na tabela sessao antes da alteracao*/
/*
update sessao set dia = '2018-11-01' where cod_sessao = 1;
*/