create database Autosystem;
use Autosystem;

create table Proprietario (
idProprietario INT NOT NULL AUTO_INCREMENT primary key,
usuario varchar(45),
senha varchar(45)
);

create table Produto (
idProduto INT NOT NULL AUTO_INCREMENT primary key,
nomeProduto varchar(45),
valorProduto varchar(45),
idProprietario INT NOT NULL,
foreign key (idProprietario) references Proprietario(idProprietario)
);

create table Vendas(
idVendas int not null auto_increment primary key,
dataVenda date,
quantidadeItens int,
valorVendaFinalDia decimal,
idProduto int not null,
foreign key (idProduto) references Produto (idProduto));

create table Estoque(
idEstoque int NOT NULL auto_increment primary key,
qntEmEstoque int,
idProduto int not null,
idVendas int,
foreign key (idProduto) references Produto(idProduto),
foreign key (idVendas) references Vendas (idVendas)
);

create table Vendedor(
idVendedor int not null auto_increment primary key,
usuario varchar(45),
senha varchar(45),
idVendas int,
foreign key (idVendas) references Vendas (idVendas)
);

create table Despesas(
idDespesas int not null auto_increment primary key,
Transporte decimal(9),
compraProduto decimal(9),
valordeCaixa decimal(9),
pagoVendedor decimal(9),
valorLucro decimal(9),
idProprietario INT NOT NULL,
foreign key (idProprietario) references Proprietario(idProprietario)
);


insert into Proprietario (usuario, senha) values ('Nome_p', '12345');

insert into Produto (nomeProduto, valorProduto) values
('Tabaco', '20,00'),
('Isqueiro', '10,00'),
('seda', '5,00'),
('Tabaco Sasso', '22,00'),
('Tabaco hash', '25,00'),
('bow', '15,00'),
('slicker', '20,00'),
('maçarico', '60,00'),
('cinzeiro', '25,00');

insert into Vendas (dataVenda, quantidadeItens, valorVendaFinalDia, idProduto) values 
('2019-01-08', '10',null,'8'),
('2019-01-08', '0',null,'3'),
('2019-01-10', '10',null,'7'),
('2019-01-10', '20',null,'9'),
('2019-01-10', '60',null,'10'),
('2019-01-11', '17',null,'5'),
('2019-01-11', '9',null,'1'),
('2019-01-16', '3',null,'3'),
('2019-01-17', '5',null,'6'),
('2019-01-17', '6',null,'5');

insert into Estoque (qntEmEstoque, idProduto, idVendas) values
('20','1','1'),
('20','2','2'),
('20','3','3'),
('20','4','4'),
('25','5','5'),
('30','6','6');

insert into Vendedor (usuario, senha, idVendas) values
('vendedor01','654321','1');

insert into Despesas (Transporte, compraProduto, valordeCaixa, pagoVendedor,valorLucro,idProprietario) values
('22','500','3000','400',null,'1');

select * from Vendas
where (vendas.dataVenda >='2019-01-10' and vendas.dataVenda <= '2019-01-15');


