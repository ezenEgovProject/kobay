create table auction( 
member_unq number not null /*로그인한 멤버의 unq값을 받아옴*/, 
Auction_unq number not null primary key, 
Lcategory varchar2(10) not null /*대분류*/, 
Mcategory varchar2(10) not null /*중분류*/, 
sdate timestamp not null, 
edate timestamp not null, 
title varchar2(100) not null, 
image varchar2(4000) not null, 
sprice number not null, 
deliveryWay varchar2(10) not null, 
deliveryPee number not null, 
seller varchar2(100) not null, 
sellerPhone number not null, 
detail varchar2(4000) not null, 
state varchar2(5), 
auction_del number(1) not null /* 게시글 노출여부 (1=노출, 2=비노출) */
); 

create table category( 
ctgcd varchar2(10) not null /* 카테고리 코드 */, 
ctgnm varchar2(50) not null
);/* 카테고리 이름 */

/* Sequence */
create sequence auction_seq 
increment by 1 
start with 1 
maxvalue 999999; 


/*
 * AXX : 대분류 
 * AXXXX : 중분류 

 */

insert into category values('A01','가전제품'); 
insert into category values('A0101','휴대폰'); 
insert into category values('A0102','컴퓨터'); 
insert into category values('A0103','노트북'); 
insert into category values('A010101','케이스'); 
insert into category values('A010102','보호필름'); 
insert into category values('A02','의류'); 
insert into category values('A0201','상의'); 
insert into category values('A0202','하의'); 
insert into category values('A0203','신발'); 
insert into category values('A020301','나이키'); 
insert into category values('A020302','아디다스');
