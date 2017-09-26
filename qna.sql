create table qna (
    qna_unq number(11) not null primary key /*qna������ȣ*/,
    qna_group number(11) /*������ �亯�� ���� �׷찪*/,
    qna_step number(1) default '0' /*������ �亯 ���а�*/,
    member_unq number(11) not null /*��ǰ �Խñ��� ����� unq*/,
    auction_unq number(11) not null /*�Խñ��� unq*/,
    questioner_unq number(11) not null /*������ unq*/,
    qna_content clob /*���� or �亯 ����*/,
    qna_secret number(2) default '0' /*��бۿ��� */,
    qna_status number(2) default '0' /*��������*/,
    qna_rdate date not null /*qna��ϳ�¥ */,
    constraint step_ck check(qna_step='0' or qna_step='1'),
    constraint secret_ck check(qna_secret='0' or qna_secret='1'),
    constraint status_ck check(qna_status='0' or qna_status='1')
);

create sequence question_unq_seq
start with 1
increment by 1
maxvalue 9999999;

select * from qna;

insert into qna (
    qna_unq,
    qna_group,
    qna_step,
    member_unq,
    auction_unq,
    questioner_unq,
    qna_content,
    qna_secret,
    qna_status,
    qna_rdate
)
values (
    question_unq_seq.nextval,
    '82',
    '1',
    '1',
    '1',
    '4',
    'ù��° �亯�Դϴ�',
    '0',
    '0',
    sysdate 
);

commit;

create table bid(
    bid_unq number(11) not null/*��� ���� unq*/,
    auction_unq number(11) not null /*�Խñ��� unq*/,
    member_unq number(11) not null /*��� ������ unq*/,
    member_name varchar2(50) not null /*��� ������ �̸�*/,
    member_phone number(20) not null /*��� ������ �޴��� ��ȣ*/,
    member_post varchar2(10) not null /*��� ������ �����ȣ*/,
    member_addr1 varchar2(100) /*��� ������ �ּ�1*/,
    member_addr2 varchar2(100) /*��� ������ �ּ�2*/,
    bid_price number(38) not null /*��� ���� �ݾ� */,
    bid_rdate date not null /*���������¥ */,
    bid_status number(2) default '0' /*��������*/,
    constraint bid_status_ck check(bid_status='0' or bid_status='1')
);

create sequence bid_unq_seq
start with 1
increment by 1
maxvalue 9999999;

select * from bid;

INSERT INTO bid
    (	
        bid_unq,
        auction_unq,
        member_unq,
        member_name,
        member_phone,
        member_post,
        member_addr1,
        member_addr2,
        bid_price,
        bid_rdate,
        bid_status
    )
VALUES
    (	
        bid_unq_seq.nextval,
        '1',
        '2',
        'jklee',
        '01037444444',
        '1311',
        '���',
        '����',			    
        '5000',			 
        sysdate,
        '0'
    )	