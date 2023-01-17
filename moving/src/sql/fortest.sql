select * from movie;
select * from movie_like;

update movie set view_cnt = 278572140 where movienum = 46;
update movie set view_cnt = 184472823 where movienum = 7;
update movie set view_cnt = 208759433 where movienum = 2;
update movie set view_cnt = 168494847 where movienum = 22;
update movie set view_cnt = 148374372 where movienum = 120;
update movie set view_cnt = 123857348 where movienum = 71;
update movie set view_cnt = 109438475 where movienum = 77;
update movie set view_cnt = 73847483 where movienum = 83;
update movie set view_cnt = 68587398 where movienum = 5;
update movie set view_cnt = 49344839 where movienum = 8;

insert into user values ('manager','1234','이준민','M','asd','asfd','sadf','sdfas','1999-01-01','010-1111-1111',"basicprofile.jpg");
insert into movie_like values(31,'qwe135');
select * from user;
select * from pay;
use moving;


update user set userbirth ='2004-01-01' where userid = 'apple';
update user set userbirth ='2008-01-01' where userid = 'apple';
update user set userbirth ='2011-01-01' where userid = 'apple';
update user set userbirth ='2015-01-01' where userid = 'apple';
insert into pay values("qwe123","9,900￦","2025-01-22 12:00:00");
insert into user values ('qwe123','1234','김사과','M','asd','asfd','sadf','sdfas','1999-01-01','010-1111-1111',"basicprofile.jpg");
insert into pay values("apple","9,900￦","2025-01-22 12:00:00");
insert into user values ('apple','1234','김사과','M','asd','asfd','sadf','sdfas','2020-01-01','010-1111-1111',"basicprofile.jpg");
insert into user values("atnsals","1234","이준민",'M',"13567","경기도 성남시 분당구","814-903","진흥","1996-01-28","010-3980-1548","basicprofile.jpg");
insert ignore into pay values("manager","연 구독제","99,000￦","2023-02-05 12:44:44");



update user set userphoto = "basicprofile.jpg" where userid="qwe123";
insert into pay values("manager","연 구독제","99,000￦","2025-01-06 10:55:40");
select userphoto from user where userid="qwe123";