-# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\emina\OneDrive\Dokumenti\GitHub\Jp28-zavrsni_rad\RibolovnoDrustvo_zavrsni_rad.sql

drop database if exists ribolovno_drustvo;
create database ribolovno_drustvo;
use ribolovno_drustvo;

create table dozvola(
 sifra int not null primary key auto_increment, 
 trajanje date,
 cijena decimal(18.2),
 clan int not null
 );


create table vrstaRibe(
 sifra int not null primary key auto_increment, 
 naziv varchar(50)
);

create table natjecanje(
 sifra int not null primary key auto_increment, 
 rezultat varchar(50),
 datum  date, 
 rijeka_jezero varchar(50)
);

create table clan(
 sifra int not null primary key auto_increment, 
 ime varchar(50)not null,
 prezime varchar(50)not null,
 oib varchar(50)not null,
 kontakt int (50) not null,
 ribolovnoDrustvo varchar (50)
);

create table ulov(
 sifra int not null primary key auto_increment, 
 clan int not null,
 vrstaRibe int not null ,
 tezina decimal(18.2),
 natjecanje int not null
);

alter table dozvola add 
foreign key (clan) references clan(sifra);
alter table ulov add 
foreign key (clan) references clan(sifra);
alter table ulov add 
foreign key (vrstaRibe) references vrstaRibe(sifra);
alter table ulov add 
foreign key (natjecanje) references natjecanje(sifra);

select * from vrstaRibe;
-- 1
insert into vrstaRibe(sifra,naziv)
-- 1 do 6
values
(null,'Klen'),
(null,'Žutooka'),
(null,'Babuška'),
(null,'Som'),
(null,'Štuka'),
(null,'Smuđ');


select * from clan;
-- 2
insert into clan(sifra,ime,prezime,oib,kontakt,ribolovnoDrustvo)
-- 1 do 4
values
(null,'Ivan','Ivić','12345678958','32883833','Stari Šaran'),
(null,'Matija','Matej','12345696325','32886597','Kečiga'),
(null,'Anto','Bandić','45678932581','32569874','Smuđ'),
(null,'Goran','Simić','12369857458','32569789','Spačva');

select * from natjecanje;
-- 3
insert into natjecanje(sifra,rezultat,datum,rijeka_jezero)
-- 1 do 2
values
(null,1,20230522,'Sava'),
(null,2,20230522,'Sava');

select * from dozvola;
-- 4

insert into dozvola(sifra,trajanje,cijena,clan)
-- 1 do 3
values 
(null,'2023-05-23',55.70,1),
(null,'2023-04-21',45,2),
(null,'2023-03-31',60,3);

select * from ulov;
-- 5
insert into ulov(sifra,clan,vrstaRibe,tezina,natjecanje)
-- 1 do 2
values
(null,1,1,2.500,1),
(null,2,2,1.800,2);

