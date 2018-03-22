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
	
	
	
	
	
	/** kobay 2차 merge version db 수정 및 추가 해야할 내용 */
	
	update kobayAuction set eprice=0;
	update kobayAuction set aucStatus = 0;
	
	-- aucStatus comment 수정 : 경매결과(진행/예정-0, 낙찰-1, 유찰-2)
	
	 CREATE TABLE "KOBAY"."AUCTIONQNA" 
	   (	"QNAUNQ" NUMBER(11,0) NOT NULL ENABLE, 
		"MEMBERUNQ" NUMBER(11,0) NOT NULL ENABLE, 
		"AUCTIONUNQ" NUMBER(11,0) NOT NULL ENABLE, 
		"QNAGROUP" NUMBER(11,0), 
		"QNASTEP" NUMBER(1,0) DEFAULT '0' /* 질문과 답변 구분값  0이면 질문, 1이면 답변 */, 
		"QUESTIONERUNQ" NUMBER(11,0) NOT NULL ENABLE, 
		"QNACONTENT" CLOB, 
		"QNASECRET" NUMBER(2,0) DEFAULT '0' /* 비밀글여부  (0=공개, 1=비밀)  */, 
		"DELSTATUS" NUMBER(2,0) DEFAULT '0' /* 삭제여부 (0=노출, 1=비노출)*/, 
		"QNARDATE" DATE NOT NULL ENABLE, 
		 CONSTRAINT "QNASTEP_CK" CHECK (qnaStep='0' or qnaStep='1') ENABLE, 
		 CONSTRAINT "QNASECRET_CK" CHECK (qnaSecret='0' or qnaSecret='1') ENABLE, 
		 CONSTRAINT "QNA_DELSTATUS_CK" CHECK (delStatus='0' or delStatus='1') ENABLE, 
		 PRIMARY KEY ("QNAUNQ")
	  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
	  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
	  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
	  TABLESPACE "USERS"  ENABLE
	   ) SEGMENT CREATION IMMEDIATE 
	  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
	  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
	  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
	  TABLESPACE "USERS" 
	 LOB ("QNACONTENT") STORE AS BASICFILE (
	  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
	  NOCACHE LOGGING 
	  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
	  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
	  
	
	update kobayAuction set AUCIMAGEMAIN='kobay (1).jpg' where auctionUnq=1;
	update kobayAuction set AUCIMAGEMAIN='kobay (2).jpg' where auctionUnq=2;
	update kobayAuction set AUCIMAGEMAIN='kobay (3).jpg' where auctionUnq=3;
	update kobayAuction set AUCIMAGEMAIN='kobay (4).jpg' where auctionUnq=4;
	update kobayAuction set AUCIMAGEMAIN='kobay (5).jpg' where auctionUnq=5;
	update kobayAuction set AUCIMAGEMAIN='kobay (6).jpg' where auctionUnq=6;
	update kobayAuction set AUCIMAGEMAIN='kobay (7).jpg' where auctionUnq=7;
	update kobayAuction set AUCIMAGEMAIN='kobay (8).jpg' where auctionUnq=8;
	update kobayAuction set AUCIMAGEMAIN='kobay (9).jpg' where auctionUnq=9;
	update kobayAuction set AUCIMAGEMAIN='kobay (10).jpg' where auctionUnq=10;
	update kobayAuction set AUCIMAGEMAIN='kobay (11).jpg' where auctionUnq=11;
	update kobayAuction set AUCIMAGEMAIN='kobay (12).jpg' where auctionUnq=12;
	update kobayAuction set AUCIMAGEMAIN='kobay (13).jpg' where auctionUnq=13;
	update kobayAuction set AUCIMAGEMAIN='kobay (14).jpg' where auctionUnq=14;
	update kobayAuction set AUCIMAGEMAIN='kobay (15).jpg' where auctionUnq=15;
	update kobayAuction set AUCIMAGEMAIN='kobay (16).jpg' where auctionUnq=16;
	update kobayAuction set AUCIMAGEMAIN='kobay (17).jpg' where auctionUnq=17;
	update kobayAuction set AUCIMAGEMAIN='kobay (18).jpg' where auctionUnq=18;
	update kobayAuction set AUCIMAGEMAIN='kobay (19).jpg' where auctionUnq=19;
	update kobayAuction set AUCIMAGEMAIN='kobay (20).jpg' where auctionUnq=20;
	update kobayAuction set AUCIMAGEMAIN='kobay (21).jpg' where auctionUnq=21;
	update kobayAuction set AUCIMAGEMAIN='kobay (22).jpg' where auctionUnq=22;
	update kobayAuction set AUCIMAGEMAIN='kobay (23).jpg' where auctionUnq=23;
	update kobayAuction set AUCIMAGEMAIN='kobay (24).jpg' where auctionUnq=24;
	update kobayAuction set AUCIMAGEMAIN='kobay (25).jpg' where auctionUnq=25;
	update kobayAuction set AUCIMAGEMAIN='kobay (26).jpg' where auctionUnq=26;
	update kobayAuction set AUCIMAGEMAIN='kobay (27).jpg' where auctionUnq=27;
	update kobayAuction set AUCIMAGEMAIN='kobay (28).jpg' where auctionUnq=28;
	update kobayAuction set AUCIMAGEMAIN='kobay (29).jpg' where auctionUnq=29;
	update kobayAuction set AUCIMAGEMAIN='kobay (30).jpg' where auctionUnq=30;
	update kobayAuction set AUCIMAGEMAIN='kobay (31).jpg' where auctionUnq=31;
	update kobayAuction set AUCIMAGEMAIN='kobay (32).jpg' where auctionUnq=32;
	update kobayAuction set AUCIMAGEMAIN='kobay (33).jpg' where auctionUnq=33;
	update kobayAuction set AUCIMAGEMAIN='kobay (34).jpg' where auctionUnq=34;
	update kobayAuction set AUCIMAGEMAIN='kobay (35).jpg' where auctionUnq=35;
	update kobayAuction set AUCIMAGEMAIN='kobay (36).jpg' where auctionUnq=36;
	update kobayAuction set AUCIMAGEMAIN='kobay (37).jpg' where auctionUnq=37;
	update kobayAuction set AUCIMAGEMAIN='kobay (38).jpg' where auctionUnq=38;
	update kobayAuction set AUCIMAGEMAIN='kobay (39).jpg' where auctionUnq=39;
	update kobayAuction set AUCIMAGEMAIN='kobay (40).jpg' where auctionUnq=40;
	update kobayAuction set AUCIMAGEMAIN='kobay (41).jpg' where auctionUnq=41;
	update kobayAuction set AUCIMAGEMAIN='kobay (42).jpg' where auctionUnq=42;
	update kobayAuction set AUCIMAGEMAIN='kobay (43).jpg' where auctionUnq=43;
	update kobayAuction set AUCIMAGEMAIN='kobay (44).jpg' where auctionUnq=44;
	update kobayAuction set AUCIMAGEMAIN='kobay (45).jpg' where auctionUnq=45;
	update kobayAuction set AUCIMAGEMAIN='kobay (46).jpg' where auctionUnq=46;
	update kobayAuction set AUCIMAGEMAIN='kobay (47).jpg' where auctionUnq=47;
	update kobayAuction set AUCIMAGEMAIN='kobay (48).jpg' where auctionUnq=48;
	update kobayAuction set AUCIMAGEMAIN='kobay (49).jpg' where auctionUnq=49;
	update kobayAuction set AUCIMAGEMAIN='kobay (50).jpg' where auctionUnq=50;
	update kobayAuction set AUCIMAGEMAIN='kobay (51).jpg' where auctionUnq=51;
	update kobayAuction set AUCIMAGEMAIN='kobay (52).jpg' where auctionUnq=52;
	update kobayAuction set AUCIMAGEMAIN='kobay (53).jpg' where auctionUnq=53;
	update kobayAuction set AUCIMAGEMAIN='kobay (54).jpg' where auctionUnq=54;
	update kobayAuction set AUCIMAGEMAIN='kobay (55).jpg' where auctionUnq=55;
	update kobayAuction set AUCIMAGEMAIN='kobay (56).jpg' where auctionUnq=56;
	update kobayAuction set AUCIMAGEMAIN='kobay (57).jpg' where auctionUnq=57;
	update kobayAuction set AUCIMAGEMAIN='kobay (58).jpg' where auctionUnq=58;
	update kobayAuction set AUCIMAGEMAIN='kobay (59).jpg' where auctionUnq=59;
	update kobayAuction set AUCIMAGEMAIN='kobay (60).jpg' where auctionUnq=60;
	update kobayAuction set AUCIMAGEMAIN='kobay (61).jpg' where auctionUnq=61;
	update kobayAuction set AUCIMAGEMAIN='kobay (62).jpg' where auctionUnq=62;
	update kobayAuction set AUCIMAGEMAIN='kobay (63).jpg' where auctionUnq=63;
	update kobayAuction set AUCIMAGEMAIN='kobay (64).jpg' where auctionUnq=64;
	update kobayAuction set AUCIMAGEMAIN='kobay (65).jpg' where auctionUnq=65;
	update kobayAuction set AUCIMAGEMAIN='kobay (66).jpg' where auctionUnq=66;
	update kobayAuction set AUCIMAGEMAIN='kobay (67).jpg' where auctionUnq=67;
	update kobayAuction set AUCIMAGEMAIN='kobay (68).jpg' where auctionUnq=68;
	update kobayAuction set AUCIMAGEMAIN='kobay (69).jpg' where auctionUnq=69;
	update kobayAuction set AUCIMAGEMAIN='kobay (70).jpg' where auctionUnq=70;
	update kobayAuction set AUCIMAGEMAIN='kobay (71).jpg' where auctionUnq=71;
	update kobayAuction set AUCIMAGEMAIN='kobay (72).jpg' where auctionUnq=72;
	update kobayAuction set AUCIMAGEMAIN='kobay (73).jpg' where auctionUnq=73;
	update kobayAuction set AUCIMAGEMAIN='kobay (74).jpg' where auctionUnq=74;
	update kobayAuction set AUCIMAGEMAIN='kobay (75).jpg' where auctionUnq=75;
	update kobayAuction set AUCIMAGEMAIN='kobay (76).jpg' where auctionUnq=76;
	update kobayAuction set AUCIMAGEMAIN='kobay (77).jpg' where auctionUnq=77;
	update kobayAuction set AUCIMAGEMAIN='kobay (78).jpg' where auctionUnq=78;
	update kobayAuction set AUCIMAGEMAIN='kobay (79).jpg' where auctionUnq=79;
	update kobayAuction set AUCIMAGEMAIN='kobay (80).jpg' where auctionUnq=80;
	update kobayAuction set AUCIMAGEMAIN='kobay (81).jpg' where auctionUnq=81;
	update kobayAuction set AUCIMAGEMAIN='kobay (82).jpg' where auctionUnq=82;
	update kobayAuction set AUCIMAGEMAIN='kobay (83).jpg' where auctionUnq=83;
	update kobayAuction set AUCIMAGEMAIN='kobay (84).jpg' where auctionUnq=84;
	update kobayAuction set AUCIMAGEMAIN='kobay (85).jpg' where auctionUnq=85;
	update kobayAuction set AUCIMAGEMAIN='kobay (86).jpg' where auctionUnq=86;
	update kobayAuction set AUCIMAGEMAIN='kobay (87).jpg' where auctionUnq=87;
	update kobayAuction set AUCIMAGEMAIN='kobay (88).jpg' where auctionUnq=88;
	update kobayAuction set AUCIMAGEMAIN='kobay (89).jpg' where auctionUnq=89;
	update kobayAuction set AUCIMAGEMAIN='kobay (90).jpg' where auctionUnq=90;
	update kobayAuction set AUCIMAGEMAIN='kobay (91).jpg' where auctionUnq=91;
	update kobayAuction set AUCIMAGEMAIN='kobay (92).jpg' where auctionUnq=92;
	update kobayAuction set AUCIMAGEMAIN='kobay (93).jpg' where auctionUnq=93;
	update kobayAuction set AUCIMAGEMAIN='kobay (94).jpg' where auctionUnq=94;
	update kobayAuction set AUCIMAGEMAIN='kobay (95).jpg' where auctionUnq=95;
	update kobayAuction set AUCIMAGEMAIN='kobay (96).jpg' where auctionUnq=96;
	update kobayAuction set AUCIMAGEMAIN='kobay (97).jpg' where auctionUnq=97;
	update kobayAuction set AUCIMAGEMAIN='kobay (98).jpg' where auctionUnq=98;
	update kobayAuction set AUCIMAGEMAIN='kobay (99).jpg' where auctionUnq=99;
	update kobayAuction set AUCIMAGEMAIN='kobay (100).jpg' where auctionUnq=100;
	
	commit;
		
