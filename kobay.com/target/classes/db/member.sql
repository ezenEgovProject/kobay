

/* Table */
CREATE TABLE member(
MEMBER_UNQ number,
MEMBER_ID varchar2(100),
MEMBER_PWD varchar2(100),
MEMBER_NAME varchar2(10),
MEMBER_PHONE varchar2(20),
MEMBER_RDATE timestamp);
/* --Table */

/* Sequence */
create sequence MEMBER_UNQ
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;
/* --Sequence */

