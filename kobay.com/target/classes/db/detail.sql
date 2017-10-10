
/* Table */
create table qna (
    qna_unq number(11) not null primary key /*qna고유번호*/,
    qna_group number(11) /*질문과 답변을 묶는 그룹값*/,
    qna_step number(1) default '0' /*질문과 답변 구분값*/,
    member_unq number(11) not null /*상품 게시글의 등록자 unq*/,
    auction_unq number(11) not null /*게시글의 unq*/,
    questioner_unq number(11) not null /*질문자 unq*/,
    qna_content clob /*질문 or 답변 내용*/,
    qna_secret number(2) default '0' /*비밀글여부 */,
    qna_status number(2) default '0' /*삭제여부*/,
    qna_rdate date not null /*qna등록날짜 */,
    constraint step_ck check(qna_step='0' or qna_step='1'),
    constraint secret_ck check(qna_secret='0' or qna_secret='1'),
    constraint status_ck check(qna_status='0' or qna_status='1'));
    
create table bid(
    bid_unq number(11) not null/*경매 참여 unq*/,
    auction_unq number(11) not null /*게시글의 unq*/,
    member_unq number(11) not null /*경매 참여자 unq*/,
    member_name varchar2(50) not null /*경매 참여자 이름*/,
    member_phone number(20) not null /*경매 참여자 휴대폰 번호*/,
    member_post varchar2(10) not null /*경매 참여자 우편번호*/,
    member_addr1 varchar2(100) /*경매 참여자 주소1*/,
    member_addr2 varchar2(100) /*경매 참여자 주소2*/,
    bid_price number(38) not null /*경매 참여 금액 */,
    bid_rdate date not null /*경매참여날짜 */,
    bid_status number(2) default '0' /*낙찰여부*/,
    constraint bid_status_ck check(bid_status='0' or bid_status='1'));



/* Sequence */
create sequence question_unq_seq 
start with 1
increment by 1
maxvalue 9999999;

create sequence bid_unq_seq
start with 1
increment by 1
maxvalue 9999999;

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
    qna_rdate )
values (
    question_unq_seq.nextval,
    '82',
    '1',
    '1',
    '1',
    '4',
    '첫번째 답변입니다',
    '0',
    '0',
    sysdate );

INSERT INTO bid (	
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
        bid_status)
VALUES(	
        bid_unq_seq.nextval,
        '1',
        '2',
        'jklee',
        '01037444444',
        '1311',
        '경기',
        '수정',			    
        '5000',			 
        sysdate,
        '0');