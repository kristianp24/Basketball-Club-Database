CREATE TABLE Jucatorul(
id_jucator number(3) constraint pk_idjucator primary key not null,
nume varchar2(20) not null,
prenume varchar(20) not null,
data_nasterii date not null,
numar_telefon number(10) not null,
email varchar(30) not null,check (email like '%@%.com%'),
gender char
);

CREATE TABLE Adresa(
id_adresa number(3) constraint pk_idad primary key not null,
id_jucator number(3) not null,
strada varchar2(50) not null,
oras varchar2(10) not null,
cod_postal number(6),
FOREIGN KEY (id_jucator) references Jucatorul(id_jucator)
);

CREATE TABLE Echipa (
id_echipa number(3) primary key not null,
nume varchar2(10) not null
);

CREATE TABLE Contracte(
id_jucator number (3) not null,
id_echipa number(3) not null,
data_inscrierii date not null,
data_plecarii date not null,
salariul number(5) not null,
PRIMARY KEY(id_jucator,id_echipa),
FOREIGN KEY (id_jucator) references Jucatorul(id_jucator),
FOREIGN KEY (id_echipa) references Echipa(id_echipa)
);

CREATE TABLE Antrenori(
cnp number(13) constraint pk_cnp primary key not null,
nume varchar2(20) not null,
prenume varchar2(20) not null,
data_nasterii date not null,
numar_telefon number(10) not null,
email varchar(30) not null, check (email like '%@%.com%'),
id_adresa number(3) not null,
id_echipa number(3) not null,
FOREIGN KEY (id_adresa) references Adresa(id_adresa),
FOREIGN KEY (id_echipa) references Echipa(id_echipa)
);

CREATE TABLE Campionate_Castigate(
id_campionat number (3) constraint pk_idcamp primary key not null,
nume_campionat varchar2(10) not null,
data_campionat date not null,
id_echipa not null,
FOREIGN KEY (id_echipa) references Echipa(id_echipa)
);

CREATE TABLE Statistici(
id_jucator number(3) constraint pk_idjuc primary key not null,
points_per_game number (2) not null,
FOREIGN KEY (id_jucator) references Jucatorul(id_jucator)
);


insert into Jucatorul Values (123,'Brian','Josh',to_date('25/05/2003','DD-MM-YYYY'),0758522123,'brianjosh@gmail.com','M');
insert into jucatorul values (124,'James','Gordon',to_date('02/04/2000','DD-MM-YYYY'),0723711002,'jamesgordon@yahoo.com','M');
insert into jucatorul values  (125,'Aron','Smith',to_date('04/10/2002','DD-MM-YYYY'),0742369569,'arons@gmail.com','M');
insert into jucatorul values  (126,'Ana','Irving',to_date('13/10/2001','DD-MM-YYYY'),0725456963,'irvingana@hotmail.com','F');
insert into jucatorul values  (127,'Ben','Jhonson',to_date('24/10/2003','DD-MM-YYYY'),0724896967,'jhonson@hotmail.com','M');
insert into jucatorul values  (128,'Julian','Bran',to_date('01/08/2004','DD-MM-YYYY'),0769895387,'Julian@hotmail.com','M');
insert into jucatorul values  (129,'Melona','Edward',to_date('22/06/2002','DD-MM-YYYY'),0769898942,'Melona@gmail.com','F');
insert into jucatorul values  (130,'Enesa','Lim',to_date('09/09/2000','DD-MM-YYYY'),0125795389,'Enesalim@hotmail.com','F');


insert into echipa values(005,'Baskonia');
insert into echipa values(007,'Madrid');
insert into echipa values(009,'Monaco');
insert into echipa values(011,'Barcelona');

insert into contracte values (123,005,to_date('02/10/2019','DD-MM-YYYY'),to_date('01/11/2021','DD-MM-YYYY'),2000);
insert into contracte values (124,007,to_date('05/11/2020','DD-MM-YYYY'),to_date('01/05/2021','DD-MM-YYYY'),1750);
insert into contracte values(125,009,to_date('01/04/2021','DD-MM-YYYY'),to_date('01/06/2023','DD-MM-YYYY'),2500);
insert into contracte values(125,011,to_date('08/08/2019','DD-MM-YYYY'),to_date('01/09/2021','DD-MM-YYYY'),2100);
insert into contracte values(126,005,to_date('08/09/2020','DD-MM-YYYY'),to_date('14/02/2022','DD-MM-YYYY'),2120);
insert into contracte values(127,005,to_date('08/10/2018','DD-MM-YYYY'),to_date('16/02/2023','DD-MM-YYYY'),2122);
insert into contracte values(128,011,to_date('15/01/2022','DD-MM-YYYY'),to_date('16/05/2025','DD-MM-YYYY'),2123);


insert into statistici values(123,21.5);
insert into statistici values(124,14.2);
insert into statistici values(125,16.8);
insert into statistici values(126,18.5);
insert into statistici values(127,18.5,4.2,3.7);
insert into statistici values(128,24.2,10.5,1.2);
insert into statistici values(129,15.6,7.5,5.2);
insert into statistici values(130,8.3,11.5,3.2);


insert into campionate_castigate values (102,'Euroleague',to_date('10/06/2023','DD-MM-YYYY'),007);
insert into campionate_castigate values (104,'EuroCup',to_date('05/05/2019','DD-MM-YYYY'),005);
insert into campionate_castigate values (109,'Euroleague',to_date('10/06/2021','DD-MM-YYYY'),011);
insert into campionate_castigate values (106,'FrenchCup',to_date('01/05/2022','DD-MM-YYYY'),009);
insert into campionate_castigate values (108,'SpanishCup',to_date('08/06/2023','DD-MM-YYYY'),007);
insert into campionate_castigate values (111,'Euroleague',to_date('10/06/2018','DD-MM-YYYY'),009);
insert into campionate_castigate values (101,'SpanishCup',to_date('05/06/2021','DD-MM-YYYY'),005);

insert into adresa values (901,'Street Oxford','Manchester',null);
insert into adresa values (902,'Street Smithrowe','London',null);
insert into adresa values (903,'Street 510','Leeds',0458);
insert into adresa values (904,'Street st Sebastian','Madrid',1869);
insert into adresa values (801,'Street Nr2','London',1052);
insert into adresa values (802,'Street Nr5','Munich',null);
insert into adresa values (803,'Street Nr5','Paris',2035);
insert into adresa values (804,'Street Nr6','Manchester',null);

insert into antrenori values (1234785204569,'Robert','Gordon',to_date('05/04/1991','DD-MM-YYYY'),0752693458,'gordonrob@gmail.com',901,007);
insert into antrenori values (2564789632145,'John','Smith',to_date('08/07/1995','DD-MM-YYYY'),0752693456,'smithj@gmail.com',902,009);
insert into antrenori values (8239783204257,'Jim','Harman',to_date('14/09/1990','DD-MM-YYYY'),0742763458,'JimHarman@yahoo.com',903,005);
insert into antrenori values (7239687404525,'Morgan','Rowe',to_date('25/07/1996','DD-MM-YYYY'),0785694169,'Rowemorg@hotmail.com',904,011);
insert into antrenori values (7739689304478,'David','Jonson',to_date('03/09/1996','DD-MM-YYYY'),0745656369,'JonDavid@hotmail.com',904);



alter table adresa
add constraint fk_cnp
foreign key (cnp)
references antrenori(cnp);
alter table adresa
add cnp number(13) not null;
alter table antrenori modify id_echipa number(3) null;



--Actualizare a datelor
alter table statistici add assist number(4,2)
alter table statistici add rebound number(4,2)
alter table statistici modify assist number(4,2)
alter table statistici modify rebound number(4,2)

update statistici set assist = 10.2 where id_jucator=123
update statistici set assist = 4 where id_jucator=124
update statistici set assist = 5.5 where id_jucator=125
update statistici set assist = 3.2 where id_jucator=126

update statistici set rebound = 2.2 where id_jucator=123;
update statistici set rebound = 8.4 where id_jucator=124;
update statistici set rebound = 6 where id_jucator=125;
update statistici set rebound = 11.6 where id_jucator=126;

alter table jucatorul add id_adresa NUMBER(3);
alter table jucatorul add constraint fk_adresa foreign key(id_adresa) references adresa (id_adresa);
update jucatorul set id_adresa=801 where id_jucator = 123;
update jucatorul set id_adresa=802 where id_jucator=124;
update jucatorul set id_adresa=803 where id_jucator=125;
update jucatorul set id_adresa=804 where id_jucator=126;

drop table jucatorul cascade constraint
rollback;
--Interogare a datelor 
--Afiseaza numele si id-ul echipei pentru antrenorul care are id-ul echipei=5
select nume,id_echipa from antrenori where id_echipa=5;

--Afiseazza numele prennumele antrenorilor care antreneaza echipele cu id 5,7,11
select a.nume,a.prenume,e.id_echipa,e.nume
from antrenori a
join echipa e on e.id_echipa=a.id_echipa
where e.id_echipa in (5,7,11);

--Afiseaza echipele care au castigat campionatul Euroleague
select c.id_echipa,e.nume as Echipa_Castigatoare
from campionate_castigate c
join echipa e on e.id_echipa = c.id_echipa
where c.nume_campionat like initcap('%Euroleague%');

--Afiseaza numele jucatorului id ul lui si echipa unde joaca sau unde a jucat
select j.id_jucator,j.nume ||' '|| j.prenume as full_name,e.nume as Echipa,c.data_inscrierii,c.data_plecarii
from jucatorul j
join contracte c on c.id_jucator=j.id_jucator
join echipa e on e.id_echipa = c.id_echipa

--Afiseaza antrenori si adresele lor
select an.nume ||' '||an.prenume as Nume_Antrenor, a.strada||','||a.oras as Adresa
from antrenori an
join adresa a on a.id_adresa=an.id_adresa;


--Grupari ale datelor
--Afiseaza la cate echipe a jucat fiecare jucator
select j.nume ||' '||j.prenume as Jucatorul,count(e.id_echipa) as Numarul_Echipe
from jucatorul j
join contracte c on c.id_jucator=j.id_jucator
join echipa e on e.id_echipa = c.id_echipa
group by j.nume,j.prenume;

--Afiseaza jucatorii cu mai mult decat 15 puncte per meci
select j.nume ||' '||j.prenume as Jucatorul,max(s.points_per_game) as Average_Points
from jucatorul j
join statistici s on s.id_jucator=j.id_jucator
having max(s.points_per_game) > 15
group by j.nume,j.prenume;

--Afiseaza cate campionate a castigat fiecare echipa
select e.nume as Echipa,count(c.id_campionat) as Campionate_Castigate
from echipa e
join campionate_castigate c on c.id_echipa = e.id_echipa
group by e.nume;

--Afiseaza jucatorul cu cel mai multe assist per meci si cine are numarul de assist null ii pune valoarea 0
select j.nume as Nume_Jucator,max(nvl(assist,0)) as Maxim_assist
from jucatorul j
join statistici s on j.id_jucator=s.id_jucator
group by j.nume
order by max(nvl(assist,0)) desc
fetch first rows only;

--Afiseaza media a tuturor jucatoriilor points_per_game
select avg(points_per_game) as Total_Avg_Points
from statistici



--Functii numerice si de charachter
--Data nasterii a antrenoriilor
select nume,prenume,to_char(to_date(data_nasterii,'DD/MM/YY'),'Month ddth-YY') as Data_Nasterii
from antrenori;
--Varsta antrenoriilor
select nume ||' '|| prenume as Full_Name,round(round(sysdate-data_nasterii)/365) as Varsta
from antrenori;
--Afiseaza cati luni au jucat jucatorii in echipa lor respectiva
select j.nume||' '||j.prenume Full_name,round( months_between(c.data_plecarii,c.data_inscrierii)) as Months_in_club,e.nume as Clubul
from jucatorul j
join contracte c on c.id_jucator = j.id_jucator 
join echipa e on e.id_echipa = c.id_echipa
--Afiseaza ziua jucatorului afisand luna si ziua cu cuvinte
select nume||' '||prenume Jucatorul,to_char(to_date(data_nasterii,'DD/MM/YY'),'Ddspth "of" Month YYYY') as Data_Nasterii
from jucatorul;


--Folosirea CASE pentru a majora salariile pentru jucatorii cu cei mai multi ani in echipele respective
select j.nume||' '||j.prenume Full_name,trunc(round( months_between(c.data_plecarii,c.data_inscrierii))/12) as YearsInClub,c.salariul,
 case when trunc( round( months_between(c.data_plecarii,c.data_inscrierii))/12)>=2 then c.salariul*1.10
      when trunc( round( months_between(c.data_plecarii,c.data_inscrierii))/12)>=1 and trunc( round( months_between(c.data_plecarii,c.data_inscrierii))/12)<2 then c.salariul*1.05
      else c.salariul*1 
      end as Salariul_Majorat
from jucatorul j
join contracte c on c.id_jucator = j.id_jucator 
join echipa e on e.id_echipa = c.id_echipa

--Folosirea UNION pentru a afisa numele jucatoriilor si antrenoriilor
select nume||' '||prenume Full_Name_Antrenori_Jucatori
from antrenori
union
select nume||' '||prenume 
from jucatorul

--Afiseaza numele complet a jucatorului cu cate puncte face el per meci fara a afisa coloana rebound.
select j.nume||' '||j.prenume Full_Name_Jucator,s.points_per_game
from jucatorul j
join statistici s on s.id_jucator=j.id_jucator
minus
select j.nume||' '||j.prenume,s.rebound
from jucatorul j
join statistici s on s.id_jucator=j.id_jucator

--Intersectia
select id_adresa
from antrenori
intersect
select id_adresa
from adresa

--Subcereri
--Afiseaza numele jucatoriilor care au plecat din echipa respectiva intre iunie si decembrie
select nume||' '||prenume as "Full Name"
from jucatorul
where id_jucator in (select id_jucator from contracte where extract(month from data_plecarii) between 6 and 12);

--Afiseaza numele juctoriilor care au salariul mai mult decat 2000
select j.nume||' '||j.prenume as "Full Name",c.salariul
from jucatorul j
join contracte c on c.id_jucator=j.id_jucator
where j.id_jucator in (select id_jucator from contracte where salariul>=2000)

--Afiseaza cate echipe au castigat campionat in primele 5 luni a anului
select nume as "Nume Echipa"
from echipa
where id_echipa in (select id_echipa from campionate_castigate where extract(month from data_campionat) between 1 and 5)

--Afiseaza numele jucatorului care are un numar par de assists (si fara zecimale)
select nume||' '||prenume "Nume Jucator",assist
from jucatorul
join statistici using (id_jucator)
where id_jucator in (select id_jucator from statistici where mod(assist,2)=0)

--Afiseaza echipele care au castigat mai mult decat 2 campionate,id-ul si numele lor
select e.nume,c.id_echipa,count (c.id_campionat) as CampionateCastigate
from campionate_castigate c
join echipa e on e.id_echipa=c.id_echipa
where c.id_echipa in 
(select id_echipa from campionate_castigate group by id_echipa having count (id_campionat)>=2)
group by c.id_echipa,e.nume

--Afiseaza antrenorii care locuiesc in Manchester
select nume||' '||prenume "Nume Antrenor",oras
from antrenori
join adresa using (id_adresa)
where id_adresa in (select id_adresa from adresa where initcap(oras) like '%Manchester%')

--Afiseaza jucatorul cu id adresa 802
select nume||' '||prenume as "Nume Jucator"
from jucatorul
where id_adresa=(select id_adresa from adresa where id_adresa=802)


--View
--Creeaza un view cu numele complet si numarul de telefon a jucatoriilor unde nu sunt permise modificari a datelor(INSERT,UPDATE,DELETE).
create or replace view  view_nrtelefon as
select nume||' '||prenume as "Nume jucator",numar_telefon as "Telefon no."
from jucatorul
with read only;

--Creeaza un view cu numele complet si adresele de email al antrenoriilor
create or replace view view_emailantrenori as
select nume||' '||prenume "Nume Antrenor",email "Email Adress"
from antrenori

--Creeaza un view cu numele complet si punctele per meci pentru cei 2 jucatori care au cel mai multe puncte per game.
create or replace view view_bestPlayers as
select rownum as "No." ,j.nume||' '||j.prenume as "Nume jucator",s.points_per_game as "Points"
from jucatorul j
join statistici s on s.id_jucator = j.id_jucator
order by s.points_per_game desc
fetch first 2 rows only;

--Creeaza un view cu echipele si Campionatele pe care au castigat
create view view_EchipeCastigatoare as
select e.nume as Echipa,c.nume_campionat as "Campionatul Castigat"
from echipa e
join campionate_castigate c on c.id_echipa=e.id_echipa

--Creeaza un view cu jucatorii si maximumul din salarii pe care obtin sau pe care au obtinut.
create view view_Salarii as
select j.nume||' '||j.prenume as "Nume jucator",max(c.salariul) as "Max. Salariul"
from jucatorul j
join contracte c on c.id_jucator=j.id_jucator
group by j.nume,j.prenume;

--Creeaza un view cu adresele antrenoriilor.
create view view_adreseAntrenori as
select a.nume||' '||a.prenume "Nume Antrenor",ad.*
from antrenori a
join adresa ad on ad.id_adresa=a.id_adresa


--Sequences
--Creeaza o sevcenta pentru id-urile jucatoriilor care mai departe va fi folosita pentru a adauga date in tabela jucatorul obtinand Id-ul lor prin secventa creata
create sequence jucator_seq
increment by 1
start with 128
maxvalue 250
nocycle
nocache;

insert into jucatorul values (jucator_seq.NEXTVAl,'Jim','Ben',to_date('28/07/2003','DD-MM-YYYY'),0798852123,'benjin@gmail.com','M',null)
insert   into jucatorul values (jucator_seq.NEXTVAl,'Russ','Tomson',to_date('04/07/1999','DD-MM-YYYY'),03558852123,'tomsonn@gmail.com','M',null)
insert into jucatorul values (jucator_seq.NEXTVAl,'Ana','Mason',to_date('28/03/2001','DD-MM-YYYY'),03318852123,'mason@gmail.com','F',null)


--Index
--Creeaza un index pentru numele cu litere capitale si il foloseasca la un SELECT pentru a face caitarea mai rapida.
create index uppercase_index
on antrenori upper(nume);

select *
from antrenori
where upper(nume) like '%JIM%'

--Synonyms
create synonym Points
for statistici


--PL/SQL
--AFiseaza antrenorii care au castigat mai multe decat 2 campionate si pentru cei care au castigat mai putine afiseaza un mesaj.

declare 

     cursor c1 is select a.nume,a.prenume,count(c.id_echipa) as Campionate
                  from antrenori a
                  join echipa e on e.id_echipa=a.id_echipa
                  join campionate_castigate c on c.id_echipa=e.id_echipa
                  group by c.id_echipa,a.nume,a.prenume;
                   --having count(c.id_echipa)>=2
       var1 c1%ROWTYPE;
 begin
   open c1;
   loop
     fetch c1 into var1;
      exit when c1%notfound;
        if var1.Campionate >= 2 then
        dbms_output.put_line('Antrenorul '||var1.nume||' '||var1.prenume||' a castigat '||var1.Campionate||' campionate.');
        else 
           dbms_output.put_line('Antrenorul '||var1.nume||' '||var1.prenume||' nu a castigat suficiente campionate.');
        end if;
    
     end loop;
     close c1;
end;

set serveroutput on
--Afiseaza campionatele si echipele care le au castigat, si de cate ori le au castigat
declare
  cursor c is select nume_campionat,count(id_echipa) as Castigatoare
              from campionate_castigate
               group by nume_campionat;

  cursor c2 is select e.nume,nume_campionat,count(c.nume_campionat)as Castig
                 from echipa e
                 join campionate_castigate c on c.id_echipa=e.id_echipa
                group by e.nume,nume_campionat;
        var c%ROWTYPE;
        var2 c2%ROWTYPE;
begin
  open c;
   loop 
     fetch c into var;
     exit when c%notfound;
         if var.Castigatoare>1 then
         dbms_output.put_line('Campionatul '||var.nume_campionat||' e castigat de la '||var.Castigatoare||' echipe.');
         else
         dbms_output.put_line('Campionatul '||var.nume_campionat||' e castigat de la o singura echipa.');
         end if;
         open c2;
           loop
               fetch c2 into var2;
              exit when c2%notfound;
              if var.nume_campionat = var2.nume_campionat then
                if var2.Castig > 1 then
                dbms_output.put_line(var2.nume||' a castigat campionatul respectiv '||var2.Castig||' ori.');
                else
                dbms_output.put_line(var2.nume||' a castigat campionatul respectiv o singura data.');
                end if;
              end if;
            end loop;
            close c2;
            dbms_output.put_line('------------------------------------------');
      end loop;
end;

--Daca jucatorul are o echipa afiseaza echipa lui, daca nu, atunci afiseaza un mesaj.
declare
    cursor c is select j.nume,j.prenume,e.nume as Echipa,j.id_jucator
            from jucatorul j
            full outer join contracte c on c.id_jucator=j.id_jucator
            full outer join echipa e on e.id_echipa=c.id_echipa;
    v c%ROWTYPE;
begin
   open c;
   fetch c into v;
   while c%found loop
     if v.Echipa is not null then
         dbms_output.put_line('Jucatorul '||v.nume||' '||v.prenume||' joaca in Echipa '||v.Echipa);
     else
         dbms_output.put_line('Jucatorul '||v.nume||' '||v.prenume||' nu joaca la nicio echipa momentan.');
     end if;
     fetch c into v;
    end loop;
    close c;
end;

--Face update la codul postal al orasului luat din tastatura
accept a prompt 'Introdu orasul:';
declare 
   v_oras adresa.oras%type := '&a';
   aux number;
begin
   update adresa
   set cod_postal=1111
   where initcap(oras) like initcap(v_oras) and cod_postal is null;
   
   if sql%found then
   dbms_output.put_line('S-au modificat '||sql%rowcount||' randuri');
   else
      select count(*) into aux
      from adresa
      where initcap(oras) like initcap(v_oras);
         if aux = 0 then
         dbms_output.put_line('Nu exista orasul respectiv');
         else
         dbms_output.put_line('Exista orasul,dar deja are un cod postal');
         end if;
    end if;
end;


--Exceptii
--Afiseaza jucatorul cu id-ul luat ca input,daca nu exista arunca o exceptie implicita si afiseaza un mesaj.
--Id-urile existente sunt intre 123 si 130
declare 
   v_id jucatorul.id_jucator%type := &id;
   v_nume jucatorul.nume%type;
   v_prenume jucatorul.prenume%type;
   
begin
   select nume,prenume into v_nume,v_prenume
   from jucatorul
   where id_jucator = v_id;
   
   dbms_output.put_line('Jucaotrul cu id:'||v_id||' este '||v_nume||' '||v_prenume);
   
exception
   when no_data_found then
dbms_output.put_line('Jucaotrul cu id:'||v_id||' nu exista.');
end;

--Afiseaza statisticiile jucatorului cu id luat ca parametru. Daca nu exista se afiseaza un mesaj ca nu exista.
--Daca exista dar nu are statisticii, atunci se afiseaza un mesaj ca jucatorul exista.
--Testati cu id: 124,129,200;
declare
   v_id jucatorul.id_jucator%type := &id;
    id jucatorul.id_jucator%type;
    points  statistici.points_per_game%type;
    assists  statistici.assist%type;
    rebounds  statistici.rebound%type;
    exista exception;
    nu_exista exception;
begin
   select id_jucator,points_per_game,assist,rebound into id,points,assists,rebounds
                  from jucatorul
                  full outer join statistici using(id_jucator)
                  where id_jucator = v_id;
    if points is null then 
     raise exista;
    else
        dbms_output.put_line('Jucatorul cu id: '||id||' are '||points||' points, '||rebounds||' rebounds,'||' si '||assists||' assists.');
    end if;
    
    
EXCEPTION
    when no_data_found then 
      dbms_output.put_line('Jucaotrul cu id:'||v_id||' nu exista.');
    when exista then 
       dbms_output.put_line('Jucaotrul cu id:'||v_id||' exista,dar nu are statistici.');
end;
     
--Afiseaza de cate ori e castigat campionatul luat de la tastatura.
--Se trateaza exceptiile in caz ca campionatul nu exista, sau in caz ca campionatul e castigat de mai multe ori;
--Testati cu 'Euroleague', 'EuroCup', 'FrenchCup'.
declare 
  v_campionat campionate_castigate.nume_campionat%type := '&campionat';
  campionat campionate_castigate.nume_campionat%type;
  v_echipa echipa.nume%type;
  nu_exista exception;
  contor number :=0;
begin
   select nume_campionat,nume into campionat,v_echipa
   from campionate_castigate
   join echipa using (id_echipa)
   where nume_campionat = v_campionat;
   
   if sql%ROWCOUNT = 1 then
   dbms_output.put_line('Campionatul '||campionat||' este castigat de la '||v_echipa);
   end if;
   
exception
   when too_many_rows then 
     for v in ( select nume_campionat,nume 
               from campionate_castigate
               join echipa using (id_echipa)
               where nume_campionat = v_campionat) loop 
   dbms_output.put_line('Campionatul '||v.nume_campionat||' este castigat de la '||v.nume);
   end loop;
   when no_data_found then
     dbms_output.put_line('Campionatul '||campionat||' nu exista.');
end;


--Creste cu 100 salariul a jucatorului care joaca la echipa cu id-ul citit de la tastatura.
--Se trateaza exceptiile in caz ca echipa nu exista, sau daca sunt mai multi jucatori.
--Testati cu id-urile 5(mai multi jucatori),7(doar unul),20(nu exista).

declare
  v_id number := &id;
  v_nume jucatorul.nume%type;
  v_id_echipa contracte.id_echipa%type;
  echipa_inexistenta exception;
  multe_echipe exception;
begin
   update contracte
   set salariul = salariul + 100
   where id_echipa = v_id;
    
   if sql%rowcount = 1 then
     dbms_output.put_line('S-a facut 1 modificare');
    
    elsif sql%rowcount = 0 then
    raise echipa_inexistenta;
    
    elsif sql%rowcount > 1 then
    raise multe_echipe;
    end if;
    
exception
  when echipa_inexistenta then
      dbms_output.put_line('Echipa nu exista.');
  when multe_echipe then
    dbms_output.put_line('S-au facut '||sql%rowcount||' modificari.');
end;


--Functii/Proceduri
--Creste salariuul unui jucator primin id-ul ca  parametru
create or replace procedure creste_Salariul(id_juc in number)
is
   v_aux number;
   no_data exception;
begin
    select count(*) into v_aux
    from contracte
    join jucatorul using(id_jucator)
    where id_jucator = id_juc;
    
    if v_aux = 0 then 
      raise no_data;
      dbms_output.put_line('Nu exista jucatorul cu id:'||id_juc);
    else
       update contracte
       set salariul = salariul + 100
       where id_jucator = id_juc;
        dbms_output.put_line('S-a modificat salariul');
    end if;
exception
    when no_data then dbms_output.put_line('Nu exista jucatorul cu id:'||id_juc);
end;

execute creste_Salariul(700);

--Functia returneaza cate campionate a castigat echipa primita ca parametru.
create or replace function campionate(nume_echipa in echipa.nume%type) return number
is
  cursor c is select count(id_campionat) as nrCamp,nume
                from campionate_castigate
                join echipa using(id_echipa)
                group by nume;
    
begin
    for v in c loop
      if initcap(v.nume) = initcap(nume_echipa) then
        return v.nrCamp;
      
      end if;
    end loop;
    return 0;

end;

accept a prompt 'Introduceti echipa';
declare
  echipa_nume echipa.nume%type := '&a';
  nrCampionate number;
begin 
  nrcampionate := campionate(echipa_nume);
  if nrcampionate > 0 then
  dbms_output.put_line('Echipa '||echipa_nume||' a castigat '||nrcampionate||' campionate.');
  else
   dbms_output.put_line('Echipa nu exista sau nu a castigat niciun campioant');
   end if;
end;

--Procedura afiseaza antrenorul sau antrenorii care locuiesc in orasul primit ca input.
create or replace procedure antrenori_adresa(city in adresa.oras%type)
is
  cursor c is select nume||' '||prenume as NumeAntrenor,oras
                        from antrenori
                        join adresa using(id_adresa);
    contor number:=0;
    nu_exista exception;
begin
    for v in c loop
      if initcap(v.oras) = initcap(city)then 
        contor := contor+1;
        dbms_output.put_line(v.NumeAntrenor||' traieste in orasul '||v.oras);
        exit;
    end if;
    end loop;
    
    if contor = 0 then 
     raise nu_exista;
    end if;
exception
  when nu_exista then dbms_output.put_line('Orasul introdus nu exista in baza de date');
end;

execute antrenori_adresa('Manchester');

--Functia Returneaza punctele per meci al jucatorului carui id este primit ca parametru, returneaza numai daca are mai mult decat 15
create or replace function returneaza_puncte(id_juc jucatorul.id_jucator%type) return number
is
  puncte statistici.points_per_game%type;
begin
   select points_per_game into puncte
   from statistici
   where id_jucator = id_juc;
   
   if puncte > 15 then 
     return puncte;
   else
      return 0;
    end if;
 
exception
   when no_data_found then return 2;
end;

accept a prompt 'Introduceti id- ul jucatorului';
declare
    id jucatorul.id_jucator%type := &a;
    puncte statistici.points_per_game%type;
begin
  puncte := returneaza_puncte(id);
  if puncte = 0 then
    dbms_output.put_line('Jucatorul are mai putin decat 15 puncte');
 elsif puncte = 2 then
     dbms_output.put_line('Jucatorul cu id '||id||' nu exista');
  else
      dbms_output.put_line('Jucatorul cu id '||id||' are '||puncte||' puncte per meci.');
  end if;
end;

set serveroutput on;
--Procedura afiseaza echipa jucatorului primit ca parametru
create or replace procedure afiseaza_echipa(id_juc in jucatorul.id_jucator%type)
is
  nume_echipa echipa.nume%type;
  
begin
   select e.nume into nume_echipa
   from echipa e
   join contracte c on c.id_echipa = e.id_echipa
   join jucatorul j on j.id_jucator = c.id_jucator
   where j.id_jucator = id_juc;
   
   dbms_output.put_line('Jucatorul cu id '||id_juc||' joaca la '||nume_echipa);
   
exception
    when no_data_found then dbms_output.put_line('Jucatorul cu id-ul respectiv nu exista.');
end;

execute afiseaza_echipa(126)

--Functia returneaza cat timp a jucat jucatorul respectiv la echipa lui.
create or replace function timp_in_echipa(id_juc in jucatorul.id_jucator%type,id_ech in contracte.id_echipa%type) return number
is
  timp number := 0;

begin
  select round(data_plecarii-data_inscrierii) into timp
  from contracte
  where id_jucator = id_juc and id_echipa = id_ech;
  
  if timp > 0 then 
   return timp;
   else return 0;
  end if;
  
exception
  when no_data_found then return -1;
end;

accept i prompt 'Intoduceti id-ul jucatorului!';
accept e prompt 'Intoduceti id-ul echipei!';
declare 
   timpInEchipa number;
   id jucatorul.id_jucator%type := &i;
   echipa contracte.id_echipa%type := &e;
begin
  timpInEchipa := timp_in_echipa(id,echipa);
  if timpInEchipa > 0 then
    dbms_output.put_line('Jucatorul cu id '||id||' are '||timpInEchipa||' zile in echipa respectiva!');
  else
    dbms_output.put_line('Jucatorul cu id '||id||' nu exista.');
end if;
end;

--Triggers
--Trigger care in caz ca se schimba id-ul antrenorului schimba si id-ul lui la tabela Adrese
create or replace trigger schimba_id_antrenor
after update of id_adresa on antrenori for each row
declare

begin
  update adresa
  set id_adresa = :NEW.id_adresa
  where id_adresa = :OLD.id_adresa;
  
  --dbms_output.put_line('Id schimbat si la adrese');
end;

update antrenori
set id_adresa = 169
where id_echipa = 7;

--Trigger care nu lasa marirea salariului pentru cei care au o vechime mai mica de un an
create or replace trigger trg_marire_salariul
before update of salariul on contracte for each row
declare
  points statistici.points_per_game%type;
begin 
   select points_per_game into points
   from statistici
   where id_jucator = :old.id_jucator;

   --dbms_output.put_line((sysdate - :OLD.data_inscrierii)/365);
   if points < 20.5 then
      raise_application_error(-20069,'Jucatorul nu are vechimea dorita in club');
   end if;
end;
      
update contracte
set salariul = salariul + 100
where id_jucator = 123;


--Trigger care nu lasa sa modifici data_plecarii astfel incat sa fie mai mica decat data_inscrierii
create or replace trigger tg_data
before update of data_plecarii on contracte for each row
declare
 
begin
   if :new.data_plecarii < :old.data_inscrierii then
     raise_application_error(-20005,'Data inscrierii > data plecarii');
    end if;
end;

update contracte
set data_plecarii = to_date('24/04/1992','DD/MM/YYYY')
where id_jucator = 123;

update


rollback
set serveroutput on

