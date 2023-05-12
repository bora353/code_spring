create sequence seq_board;

create table tbl_board(
    bno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

alter table tbl_board add constraint pk_board
primary key (bno);

insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '테스트제목1', '테스트내용1', 'user01');
insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '테스트제목2', '테스트내용2', 'user02');
insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '테스트제목3', '테스트내용3', 'user03');
insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '테스트제목4', '테스트내용4', 'user04');

commit;

select * from tbl_board;

--
CREATE TABLE TBL_REPLY (
    RNO NUMBER(10,0),
    BNO NUMBER(10,0) NOT NULL,
    REPLY VARCHAR2(1000) NOT NULL,
    REPLYER VARCHAR2(50) NOT NULL,
    REPLYDATE DATE DEFAULT SYSDATE,
    UPDATEDATE DATE DEFAULT SYSDATE
);

CREATE SEQUENCE SEQ_REPLY;

ALTER TABLE TBL_REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY(RNO);

ALTER TABLE TBL_REPLY ADD CONSTRAINT FK_REPLY_BOARD
FOREIGN KEY (BNO) REFERENCES TBL_BOARD (BNO);

SELECT * FROM TBL_REPLY;