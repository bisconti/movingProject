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
userphone varchar(300) not null,
userphoto varchar(1000) default "basicprofile.jpg"
);

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
qnacheck varchar(10) default 'X',
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

create table pay(
userid varchar(300) unique,
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
drop table m_board;
drop table t_reply;
drop table moviedata;
drop table pay;
drop table movie_like;
drop table wishlist;
drop table watched;
drop table movie;
drop table qna;
drop table user;
