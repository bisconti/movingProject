create database moving;
use moving;
create table user(
userid varchar(300) primary key,
userpw varchar(300) not null,
username varchar(300) not null,
usergender enum('M','W'),
zipcode varchar(50),
useraddr varchar(1000),
useraddrdetail varchar(1000),
useraddretc varchar(1000),
userbirth varchar(100) not null,
userphone varchar(300) not null
);

select * from user;
select * from m_board;
insert into user values("awnsals","1234","이준민",'M',"경기도 성남시 분당구","27","010-3980-1548");
insert into user values("atnsals","1234","이준민",'M',"경기도 성남시 분당구","27","010-3980-1548");
insert into user values("mineesik","1234","이준민",'M',"경기도 성남시 분당구","27","010-3980-1548");

select * from m_board;
select * from user;
select * from m_comment;
drop table m_board;

create table user(
	userid varchar(300) primary key,
	userpw varchar(300) not null,
	username varchar(300) not null,
	usergender enum('M','W'),
	zipcode varchar(50),
	useraddr varchar(1000),
	useraddrdetail varchar(1000),
	useraddretc varchar(1000),
	userbirth varchar(100) not null,
	userphone varchar(300) not null
);
select * from user;
insert into m_board (boardtitle,boardcontents,userid) values('테스트 제목1','테스트 내용1','user1');
insert into m_board (boardtitle,boardcontents,userid) values('테스트 제목2','테스트 내용2','user2');
insert into m_board (boardtitle,boardcontents,userid) values('테스트 제목3','테스트 내용3','user2');
insert into m_board (boardtitle,boardcontents,userid)
	(select boardtitle,boardcontents,userid from m_board);

create table m_board(
boardnum int primary key auto_increment,
boardtitle varchar(300),
boardcontents varchar(300),
regdate datetime default now(),
readcount int default 0,
userid varchar(300),
foreign key(userid) references user(userid)
);

create table t_reply(
   replynum int primary key auto_increment,
   replycontents varchar(1000) not null,
    regdate datetime default now(),
    updatechk enum('o','x') default 'x',
   userid varchar(300),
    boardnum bigint
);

create table qna(
qnanum int primary key auto_increment,
userid varchar(300),
qnatitle varchar(300),
qnacontents varchar(300),
time datetime default now(),
foreign key(userid) references user(userid)
);

create table movie(
movienum int primary key auto_increment,
typename varchar(300),
actorname varchar(300),
movietitle varchar(300),
movierelease varchar(300),
runningtime varchar(300),
moviecontents varchar(5000),
movieended varchar(300),
national varchar(100),
agelimit varchar(100),
view_cnt int default 1
);

create table watched(
movienum int,
time datetime default now(),
userid varchar(300),
foreign key(movienum) references movie(movienum),
foreign key(userid) references user(userid)
);

create table wishlist(
movienum int auto_increment,
userid varchar(300),
foreign key(userid) references user(userid),
foreign key(movienum) references movie(movienum)
);

create table movie_like(
movienum int auto_increment,
userid varchar(300),
foreign key(userid) references user(userid),
foreign key(movienum) references movie(movienum)
);

insert into movie_like values(1,"awnsals"),(2,"awnsals"),(1,"atnsals"),(2,"atnsals"),(1,"mineesik"),(3,"awnsals");

create table pay(
userid varchar(300),
subscribename varchar(500),
price varchar(300),
date datetime default now(),
foreign key(userid) references user(userid)
);

create table moviedata(
movienum int auto_increment,
moviephoto varchar(1000),
moviefilm varchar(2000),
foreign key(movienum) references movie(movienum)
);

use moving;
drop table moviedata;
drop table pay;
drop table movie_like;
drop table wishlist;
drop table watched;
drop table movie;
drop table qna;
drop table comment;
drop table board;
drop table user;
