
create table RecentList_test(
member_unq number not null,
auction_unq number not null,
ar_unq number not null,
auction_price number,
grade varchar2(1),
sdate timestamp not null,
sprice number not null,
title varchar2(100) not null,
utime timestamp,
auction_del number(1),
v_time timestamp);

insert into RecentList_test values('1','1','1','20000','p',sysdate,'10000','�Ź�'
,sysdate,'0',sysdate);
insert into RecentList_test values('2','2','2','3000','p',sysdate,'1000','�̾���'
,sysdate,'0',sysdate);
insert into RecentList_test values('3','3','3','150000','p',sysdate,'100000','�ڵ���'
,sysdate,'0',sysdate);
insert into RecentList_test values('4','4','4','2500','p',sysdate,'2000','�ſ�'
,sysdate,'0',sysdate);
insert into RecentList_test values('5','5','5','40000','p',sysdate,'30000','����'
,sysdate,'0',sysdate);
insert into RecentList_test values('6','6','6','550000','p',sysdate,'500000','��ǻ��'
,sysdate,'0',sysdate);
insert into RecentList_test values('7','7','7','650000','p',sysdate,'600000','��Ʈ��'
,sysdate,'0',sysdate);
insert into RecentList_test values('8','8','8','10100','p',sysdate,'10000','�μ�'
,sysdate,'0',sysdate);
insert into RecentList_test values('9','9','9','4200','p',sysdate,'4000','���̽�'
,sysdate,'0',sysdate);





		select title,auction_price,sdate 
			from RecentList_test