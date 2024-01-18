/*
 DDL:데이터 정의 언어 
 오라클에서 제공하는 구조를 새로이 만들고(CREATE), 구조를 변경하고(ALTER), 구조자체를 삭제(DROP)하는 언어
 실제 데이터 값이 아닌 구조 자체를 정의하는 언어
 주로 DB관리자, 설계자가 사용함
 
오라클에서의 구조(객체) :테이블(TABLE), 뷰(VIEW), 시퀀스(SEQUENCE), 인덱스(INDEX), 패키지(PAKAGE), 트리거(TRIGGER), 프로스져(PROCEDURE), 함수(FUNTION),
            동의어(SYNONTH), 사용자(USER)
            
            
*CREATE
1.테이블 생성

[표현법]
CREATE 객체명 객체명칭(     --CREATE TABLE 테이블명(사용되지않는 구문으로)
        컬럼명 자료형 (크기), 
        컬럼명 자료형(크기) ,
        ...

);

*자료형의 종류
숫자 NUMBER 정수실수 구분 X 
날짜 DATE/ TIMESTAMP

문자 CHAR/ VARCHAR2 (크기).
 >CAHR(바이트크기)
 :최대2000바이트까지만 지정가능(2000 기입 가능)
 :고정길이(지정한 크기보다 더 적은 값이 들어와도 (숫자)만큼 공백값으로라도 채워서 지정한 크기만큼의 공간을 차지) 
   EX)CHAR(10) 컬럼에 'apple'이라는 값이 들어오는 순간 -> 'apple      ' 5글자 뒤에 5만큼 공백 존재(10채우기)
                                          '이현아' 라는값 -> '이현아 ' 3글자 뒤 공백존재   1만큼 공백 존재 한글은 글자당 3바이트
                                          ->고정된 글자수의 데이터만 담길 경우 사용
                                            EX) 성별 CHAR(3) ->'남', '여'
                                                    '박혁거세' -> 데이터 값 넘어가므로 오류
                                                    '이혁' 들어오는 순간 -> '이혁'
                                                    
                                          
 >VACHAR2(바이트크기)
 :최대 4000바이트까지 지정가능(4000 기입가능)
 :가변길이(담고자하는 데이터값에 맞춰서 공간이 저절로 줄어든다)
 
 한글 한글자당 3BYTE로 인식/ 영문, 숫자, 특수문자 등 한글자당 1BYTE로 인식

*/


-->회원에 대한 데이터를 담기위한 테이블 MEMBER생성
CREATE TABLE MEMBER(
        MEM_NO  VARCHAR2(20),
        MEM_ID VARCHAR2(20), --회원식별번호
        MEM_PWD VARCHAR2(20), --회원아이디
        MEM_NAME VARCHAR(20), --회원비번
        GENDER CHAR (3), --성별
        MEM_DATE DATE --회원가입일
        
);


--삭제구문
--DROP TABLE MEMBER;


--데이터 딕셔너리: 다양한 객체들의 정보를 저장하고 있는 시스템 테이블들
--USER TABLE: 이 사용자가 가지고있는 테이블들의 전반적인 구조를 보고자 할 때 제시할 수 있는 시스템테이블
SELECT * FROM USER_TABLES;

--USER_TAB_COULMNS: 이 사용자가 가지고있는 테이블 상의 모든 컬럼에 대한 정보를 가지고 있는 시스템 테이블
SELECT * FROM USER_TAB_COULMNS;

SELECT * FROM MEMBER;

-----------------------------------------
/*
컬럼에 주석 달기(컬럼에 대한 설명같은거)

[표현법]
COMMENT ON COLUMN 테이블명.컬럼명 IS '주석내용';
>>잘못 실행했을 경우 수정한 후 다시 실행 

*/

COMMENT ON COLUMN MEMBER.MEM_NO IS '회원고유번호';
COMMENT ON COLUMN MEMBER.MEM_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEM_NAME IS '회원명';
COMMENT ON COLUMN MEMBER.GENDER IS '회원명';
COMMENT ON COLUMN MEMBER.MEM_DATE IS '성별(남/여)';
COMMENT ON COLUMN MEMBER.MEM_PWD IS '회원비밀번호';


--테이블에 데이터 추가시키는 구문(DML : INSERT) -> 한 행 단위로 추가
--INSERT INTO 테이블명 VALUES(값1, 값2 ...) -> 값 작성 순서는 컬럼 순서와 매칭되어야함
INSERT INTO MEMBER VALUES(1, 'user01', 'pass01', '홍길동', '남', SYSDATE);
INSERT INTO MEMBER VALUES(2, 'user02', 'pass02', '홍길녀', 'M', SYSDATE);

INSERT INTO MEMBER VALUES(null, NULL, NUL, '홍길녀', NULL, NULL); --NULL값은 삽입이되지만 어떤 부분에 있어서는 절대 들어갈 수 없게 해야함

SELECT * FROM MEMBER;

--------------------------------
/*
제약조건 CONSTRAINTS
-원하는 데이터값만 유지하기 위해서 특정 컬럼에 부여하는 제약
유효한 형식의데이터 값만 보관해야함. ->데이터무결성 보장

종류
NOT NULL, UNIQUE, CHECK(조건), PRIMARY KEY(기본키), FOREIGN KEY(외래키)

*/

/*

NOT NULL 제약조건
해당 컬럼에 반드시 값이 존재해야할 경우 NOT NULL 부여
삽입, 수정시 NULL값을 허용하지 않도록 제약

제약조건 부여(테이블생성시 진행)하는 방식 ->컬럼레벨 방식 /테이블 레벨 방식
*NOT NULL 제약조건은 오로지 컬럼레벨방식만 가능

*/
DROP TABLE MEM_NOTNULL;



--컬럼레벨방식: 컬럼명 자료형 제약조건(한줄한줄 작성)
CREATE TABLE MEM_NOTNULL(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL , --컬럼레벨방식
    MEM_PWD VARCHAR2(20)  NOT NULL,
    MEM_NAME VARCHAR2(20)  NOT NULL,    
    GENDER VARCHAR2(20),    
    MEM_DATE VARCHAR2(20) NOT NULL
);

INSERT INTO MEM_NOTNULL VALUES(1, 'user01', 'pass01', '이루프', NULL, SYSDATE);
INSERT INTO MEM_NOTNULL VALUES(2, 'user01', 'pass01', '이깔끔', '여', SYSDATE);  --ID곂치는데 잘 실행됨 오류나야 정상
INSERT INTO MEM_NOTNULL VALUES(3, 'user03', 'pass03', '요루들', '남', SYSDATE);

SELECT * FROM MEM_NOTNULL;

-------------------------------------------------------------------
/*
-UNIQUE제약조건
해당 컬럼에 중복된 값이 들어가서는 안될 경우
컬럼값에 중복값을 제약하는 제약조건
삽입/수정시 기존에있는 데이터 값 중 중복값이 있을 경우 오류 발생
*/
DROP TABLE MEM_UNIQUE;
--테이블레벨방식 : 모든 컬럼들 다 나열한 후, 마지막에 기술
CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL, --컬럼레벨방식
    MEM_PWD VARCHAR2(20)  NOT NULL,
    MEM_NAME VARCHAR2(20)  NOT NULL,    
    GENDER VARCHAR2(20),    
    MEM_DATE VARCHAR2(20) NOT NULL,
    UNIQUE(MEM_ID)
);

INSERT INTO MEM_UNIQUE VALUES(1, 'user01', 'pass01', '이루프', NULL, SYSDATE);

-->어떤 컬럼에 유니크 제약조건 위배인지 자세히 알려주지않음, 쉽게 파악하기 어려움
-->제약조건명 으로 오류내용 알려줌

SELECT* FROM MEM_UNIQUE;