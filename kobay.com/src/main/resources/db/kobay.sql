/**
 * Kobay.sql (database 최종본)
 * 계정 생성 - create user kobay identified by kobay1234;
 * 권한 주기 - grant connect, resource to kobay;
 * 
 * 기존의 테이블과 비교하여 다른 컬럼명 및 컬럼타입을 수정해 주세요. 
 * db테이블 수정시, jsp, vo 모두 수정해야 합니다!!
 */


/**
 * MemberTable
 */
CREATE TABLE kobay_member(
memberUnq number primary key not null /* 회원고유번호 */,
memberId varchar2(100) not null /* 회원아이디(이메일주소) */,
memberPwd varchar2(100) not null /* 회원비밀번호 */,
memberName varchar2(10) not null /* 회원이름 */,
memberPhone varchar2(20) /* 회원 전화번호 */,
memberRdate timestamp /* 회원가입날짜 */,
memberMdate timestamp /* 회원수정날짜 */
);
/**
 * AuctionTable
 */
create table kobayAuction(
memberUnq number not null /* 회원 unique value */, 
auctionUnq number not null primary key /* 경매 unique value */, 
lCtg varchar2(10) not null /*대분류*/, 
mCtg varchar2(10) not null /*중분류*/, 
sCtg varchar2(10) /*소분류*/,
sDate timestamp not null /* 경매시작시작 */, 
eDate timestamp not null /* 경매마감시간 */, 
aucTitle varchar2(100) not null /* 상품명 */, 
aucImageMain varchar2(4000) /* 상품메인이미지 */, 
aucImageSub1 varchar2(4000) /* 상품서브이미지1 */,
aucImageSub2 varchar2(4000) /* 상품서브이미지1 */, 
aucImageSub3 varchar2(4000) /* 상품서브이미지1 */, 
sPrice number not null /* 경매시작가격 */,
ePrice number /* 경매종료가격 */, 
deliveryWay varchar2(10) not null /* 수령방법 */, 
deliveryFee number /* 배송료 */, 
sellerName varchar2(100) not null /* 결제 후 배송지에 들어갈 실명 */,
sellerPhone number not null /* 결제 후 배송지에 들어갈 연락처 */, 
aucDetail varchar2(4000) not null /* 경매상세정보 */, 
curStatus varchar2(5) not null /* 경매진행 상태 - 예정, 진행, 마감 */
aucStatus number(2) /* 경매결과 (낙찰, 유찰) */, 
delStatus number(2) default 0 /* 게시글 삭제여부 (0=노출, 1=비노출) */ 
); 
/**
 * Auction Category Table
 */
create table aucCategory( 
ctgcd varchar2(10) not null /* 카테고리 코드 */, 
ctgnm varchar2(50) not null /* 카테고리 이름 */
); 
/**
 * Auction Q&A Table
 */
create table auctionQna ( 
    qnaUnq number(11) not null primary key /* qna고유번호 */,
    memberUnq not null /* 상품 게시글의 등록자 unq */,
    auctionUnq not null /* 게시글의 unq */,
    qnaGroup number(11) /* 질문과 답변을 묶는 그룹값 */,
    qnaStep number(1) default '0' /* 질문과 답변 구분값  0이면 질문, 1이면 답변 */,
    questionerUnq number(11) not null /* 질문작성자 unq */,
    qnaContent clob /* 질문 or 답변 내용 */,
    qnaSecret number(2) default '0' /* 비밀글여부  (0=공개, 1=비밀)  */,
    delStatus number(2) default '0' /* 삭제여부 (0=노출, 1=비노출)*/,
    qnaRdate date not null /*qna등록날짜 */,
    constraint qnaStep_ck check(qnaStep='0' or qnaStep='1'),
    constraint qnaSecret_ck check(qnaSecret='0' or qnaSecret='1'),
    constraint delStatus_ck check(delStatus='0' or delStatus='1')
);
    
/**
 * Auction Bid Table
 */
create table auctionBid (
    bidUnq number(11) not null primary key /* 경매참여 고유번호 */,
    auctioUnq number not null /* 경매게시글  고우번호 */,
    memberUnq number not null /* 경매참여자 고유번호 */,
    bidPrice number(38) not null /* 경매 참여 금액  */,
    bidRdate timestamp not null /* 경매참여시간  */,
    aucStatus number(2) default '0' /* 낙찰여부 */,
    constraint aucStatus_ck check(aucStatus='0' or aucStatus='1')
);
    
    
/**
 * Auction Payment Table
 */
-- 결제 완료되어야 완전히 낙찰이 됨, 시간내에 미결제시 유찰
-- 결제 완료/미완료시 auction테이블에 낙철/유찰 정보 수정
-- 결제 완료되면 autionResult테이블에 정보입력
create table auctionPayment (
	auctionUnq number not null /* 경매게시글 고유번호 */,
	memberUnq number not null /* 낙찰자 고유번호 */ ,
	memberName varchar2(50) not null /* 경매 참여자 이름 */,
    memberPhone number(20) not null /* 경매 참여자 휴대폰 번호 */,
    memberPost varchar2(10) not null /* 경매 참여자 우편번호 */,
    memberAddr1 varchar2(100) not null /* 경매 참여자 주소1 */,
    memberAddr2 varchar2(100) not null/* 경매 참여자 주소2 */,
    deliveryWay varchar2(10) not null /* 수령방법 */, 
	deliveryFee number /* 배송료 */, 
	sellerName varchar2(100) not null /* 판매자이름 */,
	sellerPhone number not null /* 판매자 연락처 */,
	payDline timestamp not null /* 결제 마감기한 */
);
/**
 * 우편번호 테이블(국내)
 * imp 사용자/비밀번호 file=저장한경로\postTable.dmp full=y
 */
/**
 * Auction Result Table
 */
create table auctionResult (
/* 경매게시글 고유번호 */
/* 낙찰자 고유번호  */
/* 시작 가격 */
/* 낙찰 가격 */
/* 낙찰 날짜 */
/* 경매참여자수 */
/* 총입찰횟수 */
);
/**
 * Auction Recently Table
 * 경매상품 클릭시 게시물 고유번호와 게시물 시간을 저장
 * 경매게시글 고유번호를 통해 정보(상품메인이미지, 가격, 경매상태등)가져옴
 */
create table auctionRecent (
/* 경매게시글 고유번호 */
/* 회원 고유번호 */
/* 게시물 본 시간 */
);
/**
* Sequences
*/
-- member sequence
create sequence member_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;
-- auction sequence
create sequence auction_seq 
increment by 1 
start with 1 
maxvalue 999999; 
-- qustion sequence
create sequence question_seq 
start with 1
increment by 1
maxvalue 9999999;
-- bid seqeunce
create sequence bid_seq
start with 1
increment by 1
maxvalue 9999999;