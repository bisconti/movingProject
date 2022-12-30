create database moving;
use moving;

select * from m_board;
select * from m_user;
select * from m_comment;
drop table m_board;

create table m_board(
	boardnum bigint primary key auto_increment,
    boardtitle varchar(300) not null,
    boardcontents text not null,
    regdate datetime default now(),
    readcount int default 0,
    userid varchar(300)
);

insert into m_board (boardtitle,boardcontents,userid) values('테스트 제목1','테스트 내용1','apple');
insert into m_board (boardtitle,boardcontents,userid) values('테스트 제목2','테스트 내용2','banana');
insert into m_board (boardtitle,boardcontents,userid) values('테스트 제목3','테스트 내용3','cherry');

insert into m_board (boardtitle,boardcontents,userid)
	(select boardtitle,boardcontents,userid from m_board);

CREATE TABLE m_comment
(
	id int NOT NULL AUTO_INCREMENT,
	userid int NOT NULL,
	boardid int NOT NULL,
	content text NOT NULL,
	regdate datetime DEFAULT now(),
	PRIMARY KEY (id)
);

INSERT INTO m_comment(userid, boardid, content) VALUES
(1, 1783, '1. user1이 1번글에 댓글 작성.');

