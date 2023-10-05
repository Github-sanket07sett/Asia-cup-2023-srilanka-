create database asiacup;
use asiacup;
create table teams(
sno int,
groupA varchar(100)  not null,
groupB  varchar(100) not null
);
insert into teams values(1,'pakistan','afganistan');
insert into teams values(2,'india','bangladesh');
insert into teams values(3,'nepal','sri lanka');
select * from teams;


create table matches(
DATE1 varchar(10),
TEAMS varchar(100)  not null,
VENUE  varchar(100) not null
);
insert into matches values('30 AUGUST','pakistan Vs nepal','multan,pakistan');
insert into matches  values('31 AUGUST','bangladesh Vs srilanka','kandy,srilanka');
insert into matches values('2 sept','pakistan Vs india','kandy,srilanka');
insert into matches values('3 sept',' bangladesh Vs afganistan','lahore,pakistan');
insert into matches values('4 sept',' india Vs nepal','kandy,srilanka');
insert into matches values('5 sept',' afganistan Vs srilanka ','lahore,pakistan');
insert into matches values('6 sept',' pakistan Vs bangladesh','lahore,pakistan');
insert into matches values('7 sept',' srilanka Vs bangladesh','colombo ,srilanka');
insert into matches values('10 sept',' india Vs pakistan','colombo ,srilanka');
insert into matches values('12 sept',' india Vs srilanka','colombo ,srilanka');
insert into matches values('14 sept',' srilanka Vs pakistan','colombo ,srilanka');
insert into matches values('15 sept',' india Vs bangladesh','colombo ,srilanka');
insert into matches values('17 sept','FINAL','colombo ,srilanka');
SELECT * FROM matches;



create table hrun(
batter varchar(100),
Matches int,
Runs int
);
INSERT INTO hrun values('shubman gill',6,302);
INSERT INTO hrun values('kusal mendis(sl)',5,253);
INSERT INTO hrun values('sadeera samarawickrama(sl)',5,215);
INSERT INTO hrun values('babar azam(pak)',5,207);
INSERT INTO hrun values('mohm. rizwan(pak)',5,195);
INSERT INTO hrun values('kusal mendis(ind)',4,194);
insert into hrun values('Najmul Hossain Shanto (BAN)',2,193 );
insert into hrun values('Iftikhar Ahmed (PAK)',5,179 );
insert into hrun values('KIC Asalanka (SL)' ,5,179);
insert into hrun values('Shakib Al Hasan (BAN)', 5 ,173 );
insert into hrun values('KL Rahul (IND)', 3, 169 );
insert into hrun values('Mehidy Hasan Miraz (BAN)', 5 , 158 );
insert into hrun values('Towhid Hridoy (BAN)',5, 158 );
insert into hrun values('Mushfiqur Rahim (BAN)', 4, 131);
insert into hrun values('P Nissanka (SL)', 5, 130);
insert into hrun values('V Kohli (IND)',4, 129);
insert into hrun values('Ishan Kishan (IND)', 5 , 120);
insert into hrun values('Hashmatullah Shahidi (AFG)', 2 , 110);
insert into hrun values('HH Pandya (IND)', 4, 92);
insert into hrun values('Imam-ul-Haq (PAK)', 4, 92);
SELECT distinct(batter),Matches,Runs FROM hrun order by Runs desc ;
select  max(Runs) from hrun;
update hrun set batter='rohit sharma' where Runs=194;
update hrun set Runs=270 where Runs=253;
delete from hrun where Runs=275;

select  round(avg(Runs/Matches),2) from hrun where Runs=194;
select batter,Runs from hrun where Runs= (select max(Runs) from hrun where Runs< (select max(Runs) from hrun));
update hrun set Matches=6 where Runs=270 and Runs=215;
select batter from hrun group by batter;
select distinct(batter) from hrun where  batter like 's%';
select distinct(batter) from hrun where  batter like 'I%' limit 3;
select distinct(batter),Runs from hrun order by Runs asc limit 3;
select concat(Runs,Matches) from hrun;
create table hwicket(
bowler varchar(100),
Matches int,
wickets int,
average decimal(5,2)
);
INSERT INTO hwicket values('mohd. siraj(IND)',6,10,12.2);
INSERT INTO hwicket values('mathhessa pathirana(sl)',5,11,22.63);
INSERT INTO hwicket values('dunith wellalage(sl)',5,10,17.20);
INSERT INTO hwicket values('shaheen afridi(pak)',5,10,23.50);
INSERT INTO hwicket values('kuldeep yadav(ind)',4,9,11.33);
INSERT INTO hwicket values('haris rauf(pak)',4,9,13.33);
insert  into hwicket values('Taskin Ahmed (BAN)',4, 9,19.11),
('M Theekshana (SL)',
5 , 8 , 29.12),
('Shoriful Islam (BAN)', 4, 7 ,18.71),
('Naseem Shah (PAK)', 4 ,7,20.00),
('RA Jadeja (IND)', 4, 6, 25.33),
('Shadab Khan (PAK)',
5, 6 , 40.83),
('SN Thakur (IND)',3,5, 21.40) ,
('Gulbadin Naib (AFG)',
2 , 5, 23.60 );
select distinct(bowler),Matches,wickets,average  from hwicket;
select bowler,wickets from  hwicket where wickets=( select max(wickets) from hwicket where wickets<(select max(wickets) from hwicket)) order by average asc;
update hwicket set Matches=6 where Matches=5;
use asiacup;
SELECT
  Runs,batter,
  CASE
    WHEN Runs > 200 THEN 'good batter'
    WHEN Runs <= 200 AND Runs > 150 THEN 'average batter'
    ELSE 'bad'
  END AS BatterCategory
FROM
  hrun order by Runs asc;

