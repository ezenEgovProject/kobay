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
	CREATE TABLE kobayMember(
	memberUnq number primary key not null /* 회원고유번호 */,
	memberId varchar2(100) not null /* 회원아이디(이메일주소) */,
	memberPwd varchar2(100) not null /* 회원비밀번호 */,
	memberName varchar2(10) not null /* 회원이름 */,
	memberPhone varchar2(20) /* 회원 전화번호 */,
	memberRdate timestamp /* 회원가입날짜 */
	);


	/**
	 * AuctionTable
	 */
  	CREATE TABLE "KOBAY"."KOBAYAUCTION" (	
   	"MEMBERUNQ" NUMBER NOT NULL ENABLE, 
	"AUCTIONUNQ" NUMBER NOT NULL ENABLE, 
	"LCTG" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"MCTG" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"SCTG" VARCHAR2(10 BYTE), 
	"SDATE" TIMESTAMP (6) NOT NULL ENABLE, 
	"EDATE" TIMESTAMP (6) NOT NULL ENABLE, 
	"AUCTITLE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"AUCIMAGEMAIN" VARCHAR2(4000 BYTE), 
	"AUCIMAGESUB1" VARCHAR2(4000 BYTE), 
	"AUCIMAGESUB2" VARCHAR2(4000 BYTE), 
	"AUCIMAGESUB3" VARCHAR2(4000 BYTE), 
	"SPRICE" NUMBER NOT NULL ENABLE, 
	"EPRICE" NUMBER, 
	"DELIVERYWAY" NUMBER(2,0) NOT NULL ENABLE, 
	"DELIVERYFEE" NUMBER DEFAULT 0, 
	"SELLERNAME" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"SELLERPHONE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"AUCDETAIL" VARCHAR2(4000 BYTE) NOT NULL ENABLE, 
	"AUCSTATUS" NUMBER(2,0), 
	"DELSTATUS" NUMBER(2,0) DEFAULT 0 /* 게시글 삭제여부 (0=노출, 1=비노출) */, 
	 CONSTRAINT "AUCSTATUS_CK" CHECK (aucStatus=0 or aucStatus=1) ENABLE, 
	 CONSTRAINT "DELSTATUS_CK" CHECK (delStatus=0 or delStatus=1) ENABLE, 
	 CONSTRAINT "DELIVERYWAY_CK" CHECK (deliveryWay=0 or deliveryWay=1) ENABLE 
	 );
 
	 -- 컬럼에 대한 주석
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."MEMBERUNQ" IS '회원고유번호';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."AUCTIONUNQ" IS '경매글유'; 
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."LCTG" IS '대분류';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."MCTG" IS '중분류';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."SCTG" IS '소분류';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."SDATE" IS '경매시작일';
  	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."EDATE" IS '경매마감일';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."AUCTITLE" IS '경매글제목';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."AUCIMAGEMAIN" IS '경매글메인이미지';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."AUCIMAGESUB1" IS '경매글서브이미지1';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."AUCIMAGESUB2" IS '경매글서브이미지2';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."AUCIMAGESUB3" IS '경매글서브이미지3';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."SPRICE" IS '경매시작가격';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."EPRICE" IS '경매마감가격';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."DELIVERYWAY" IS '배송방법(직접수령-1, 배송-0)';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."DELIVERYFEE" IS '배송료';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."SELLERNAME" IS '판매자이름';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."SELLERPHONE" IS '판매자전화번호';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."AUCDETAIL" IS '경매상세정보';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."AUCSTATUS" IS '경매결과(낙찰-1, 유찰-0)';
   	COMMENT ON COLUMN "KOBAY"."KOBAYAUCTION"."DELSTATUS" IS '게시글 삭제여부(0-비삭제(노출), 1-삭제(비노출)';
   	COMMENT ON TABLE "KOBAY"."KOBAYAUCTION"  IS '경매게시글 테이블';
   
	/**
	 * Auction Category Table
	 */

	create table AUCTIONCTG( 
	ctgcd varchar2(10) not null /* 카테고리 코드 */, 
	ctgnm varchar2(50) not null /* 카테고리 이름 */
	);
	-- 카테고리 설명(comment)
	COMMENT ON COLUMN "KOBAY"."AUCCATEGORY"."CTGCD" IS '카테고리 코드ex) A01, A0101';
	COMMENT ON COLUMN "KOBAY"."AUCCATEGORY"."CTGNM" IS '카테고리 라벨ex) 패션, 남성의류';
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
	START WITH 100
	MAXVALUE 999999;
	-- auction sequence
	create sequence auction_seq 
	increment by 1 
	start with 100 
	nocache
	maxvalue 999999; 
	-- qustion sequence
	create sequence question_seq 
	start with 1
	increment by 1
	maxvalue 9999999;
	-- bid seqeunce
	create sequence bid_seq
	start with 2396
	increment by 1
	maxvalue 9999999;
