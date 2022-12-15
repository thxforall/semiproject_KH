drop table BOARD;

create table BOARD(  
  seq      number(5),
  title    varchar2(200),  
  writer   varchar2(20),
  content  varchar2(2000),
  regdate  date default sysdate,
  cnt      number(5) default 0,
  constraint pk_board primary key (seq)  
);

insert into BOARD (seq, title, writer, content) values(1, '이곳은 당신을 응원하기 위해 만들었습니다', '관리자', '응원합니다');
insert into BOARD (seq, title, writer, content) values(2, '게시글2', '글쓴이2', '게시글 내용 2');
insert into BOARD (seq, title, writer, content) values(3, '게시글3', '글쓴이3', '게시글 내용 3');
insert into BOARD (seq, title, writer, content) values(4, '게시글4', '글쓴이4', '게시글 내용 4');
insert into BOARD (seq, title, writer, content) values(5, '게시글5', '글쓴이5', '게시글 내용 5');
insert into BOARD (seq, title, writer, content) values(6, '게시글6', '글쓴이6', '게시글 내용 6');
insert into BOARD (seq, title, writer, content) values(7, '게시글7', '글쓴이7', '게시글 내용 7');
insert into BOARD (seq, title, writer, content) values(8, '게시글8', '글쓴이8', '게시글 내용 8');
insert into BOARD (seq, title, writer, content) values(9, '게시글9', '글쓴이9', '게시글 내용 9');
insert into BOARD (seq, title, writer, content) values(10, '게시글10', '글쓴이10', '게시글 내용 10');

select * from board;

drop table USERS;

create table USERS(
  username  varchar2(2000),  
  password  varchar2(20),
  name      varchar2(100),
  mobilephone varchar2(20),
  gender      varchar2(20),
  birthdate   varchar2(20),
  constraint pk_users primary key (username)
);

insert into USERS (username, password, name, mobilephone, gender, birthdate) values('test@test.com', '1234', '손흥민', '010-1234-4567' ,'other', '2022-12-14');
insert into USERS (username, password, name, mobilephone, gender, birthdate) values('test2@test.com', '4567', '이강인', '010-1234-4567' ,'male', '2022-12-19');
insert into USERS (username, password, name, mobilephone, gender, birthdate) values('test3@test.com', '4321', '송하영', '010-1234-4567' ,'female', '2022-12-19');

select * from users;
select * from users where username='test@test.com' and password='1234';
select * from users where username='test2@test.com' and password='4567';


commit;