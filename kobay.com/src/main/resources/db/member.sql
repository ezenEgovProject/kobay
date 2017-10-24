/* Table */
CREATE TABLE kobay_member(
MEMBER_UNQ number,
MEMBER_ID varchar2(100),
MEMBER_PWD varchar2(100),
MEMBER_NAME varchar2(10),
MEMBER_PHONE varchar2(20),
MEMBER_RDATE timestamp);
/* --Table */

/* Sequence */
create sequence member_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

insert into kobay_member(
member_seq.nextval,
'test@test.com',
'test1234',
'홍길동',
'01012345678',
sysdate
);