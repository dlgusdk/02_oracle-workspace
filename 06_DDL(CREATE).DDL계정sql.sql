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

/*
CREATE TABLE 테이블명(
    컬럼명 자료형(크기),
    컬럼명 자료형 [CONSTRAINT 제약조건명] 제약조건, --컬럼레벨방식
    ..,
    [CONSTRAINT 제약조건명] 제약조건(컬럼명)  --테이블레벨방식
    
    제약조건명 직접 지정한지 않을 경우 ->시스템이 임의로 SYS_CXXXXX로 만들어줌  --

);

*/


CREATE TABLE MEM_UNIQUE(
         MEM_NO NUMBER CONSTRAINT MEMNO_NN NOT NULL,
        MEM_ID VARCHAR2(20) CONSTRAINT MEMID_NN NOT NULL,
        MEM_PWD VARCHAR2(20) NOT NULL,
        MEM_NAME VARCHAR2(20) NOT NULL,
        GENDER CHAR(3),
        MEM_DATE DATE NOT NULL,
        CONSTRAINT MEMID_UQ UNIQUE(MEM_ID)
        );
 

INSERT INTO MEM_UNIQUE VALUES(1, 'user01', 'pass01', '홍길동', null, SYSDATE);
INSERT INTO MEM_UNIQUE VALUES(2, 'user01', 'pass02', '강개똥', '남', SYSDATE);


SELECT* FROM MEM_UNIQUE;

INSERT INTO MEM_UNIQUE VALUES(3, 'user03', 'pass03', '홍길동녀', 'D', SYSDATE);
--성별에 다른 문자가 들어와서 잘 들어가짐.

--------------------------
/*

CHECK(조건식) 제약조건
해당 컬럼에 들어올 수 있는 값에 대한 조건을 제시해 둘 수 있음
조건에 만족하는 데이터값만  담길 수 있
*/



CREATE TABLE MEM_CHECK(
        MEM_NO NUMBER NOT NULL,
        MEM_ID VARCHAR2(20) NOT NULL,
        MEM_PWD VARCHAR2(20) NOT NULL,
        MEM_NAME VARCHAR2(20) NOT NULL,
        GENDER CHAR(3) CHECK (GENDER IN ('남', '여')),
        MEM_DATE DATE NOT NULL,
        ADMIN_YN CHAR(1) NOT NULL, 
        UNIQUE(MEM_ID),
        CONSTRAINT ADMIN_CK CHECK(ADMIN_YN IN ('Y', 'N'))
        );


INSERT INTO MEM_CHECK VALUES(1, 'user01', 'pass01', '홍길동', null, SYSDATE , 'Y');
INSERT INTO MEM_CHECK VALUES(2, 'user02', 'pass02', '강개똥', '남', SYSDATE,  'N');

SELECT* FROM MEM_CHECK;

INSERT INTO MEM_CHECK VALUES(3, 'user03', 'pass03', '홍길동녀', '여', SYSDATE, 'N');

INSERT INTO MEM_CHECK VALUES(3, 'user03', 'pass03', '홍길동녀', '여', SYSDATE, 'N');

---------------------------------------------
/*
*PRIMARYKEY(기본키)제약조건
테이블에서 각 행들을 식별하기 위해 사용될 컬럼에 부려하는 제약조건(식별지역할의 컬럼)

EX)회원번호, 학번, 사번, 부서코드, 주문번호, 예약번호, 운송장번호..

PRIMARYKEY 로 지정하면 -> NOT NULL +UNIQUE

*/

CREATE TABLE MEM_PRI(
        MEM_NO NUMBER CONSTRAINT MEMNO_PK PRIMARY KEY, --컬럼레벨 방식
        MEM_ID VARCHAR2(20) NOT NULL,
        MEM_PWD VARCHAR2(20) NOT NULL,
        MEM_NAME VARCHAR2(20) NOT NULL,
        GENDER CHAR(3) CHECK (GENDER IN ('남', '여')),
        MEM_DATE DATE NOT NULL,
        ADMIN_YN CHAR(1) NOT NULL, 
        UNIQUE(MEM_ID),
        CHECK (ADMIN_YN IN ('Y', 'N'))
        --CONSTRAINT 제약조건명 PRIMARY KEY(MEM_NO)  적용 -->테이블레벨방식
        );


INSERT INTO MEM_PRI
VALUES(1, 'user01', 'pass01', '홍길동', '여',  '23/12/15', 'N');


INSERT INTO MEM_PRI
VALUES(1, 'user02', 'pass02', '강개똥', '남', SYSDATE,  UPPER('n'));
--유니크 조건 위배

INSERT INTO MEM_PRI
VALUES(2, 'user02', 'pass02', '강개똥', '남', SYSDATE,  UPPER('n'));

SELECT* FROM MEM_PRI;

--MEM_ID ->식별자의 역할을 하긴함(대체키)

CREATE TABLE MEM_PRI2(
        MEM_NO NUMBER,
        MEM_ID VARCHAR2(20) NOT NULL,
        MEM_PWD VARCHAR2(20) NOT NULL,
        MEM_NAME VARCHAR2(20) NOT NULL,
        GENDER CHAR(3) CHECK (GENDER IN ('남', '여')),
        MEM_DATE DATE NOT NULL,
        ADMIN_YN CHAR(1) NOT NULL, 
        UNIQUE(MEM_ID),
        CHECK (ADMIN_YN IN ('Y', 'N')),
        PRIMARY KEY(MEM_NO, MEM_ID) --테이블방식으로만 여러개를 프라이머리키로 지정가능하다.컬럼방식X

        );

--여러컬럼을 묶어서 프라이머리키로 하면 ->복합키(두 컬럼값을 묶어서 중복판별)

INSERT INTO MEM_PRI2
VALUES(1, 'user01', 'pass01', '홍홍', NULL,  SYSDATE,  'N');
--1, 'user01' 를 묶어서 중복판별

INSERT INTO MEM_PRI2
VALUES(2, 'user02', 'pass02', '강개똥',NULL, SYSDATE,  'N');

SELECT* FROM MEM_PRI2;


--복합키 사용예시(회원테이블/상품테이블/찜테이블 -> 어떤회원이 어떤 상품을 언제 찜했는지를 보관)
CREATE TABLE PRODUCT(
    PRO_NO NUMBER PRIMARY KEY,
    PRO_NAME VARCHAR2(100) NOT NULL,
    PRICE NUMBER
);


INSERT INTO PRODUCT VALUES(1, 'A', 100000);
INSERT INTO PRODUCT VALUES(2, 'B', 200000);

SELECT * FROM PRODUCT;

DROP TABLE TB_LIKE;

CREATE TABLE TB_LIKE (
        MEM_NO NUMBER,
        PRO_NO NUMBER,
        LIKE_DATE DATE,
        PRIMARY KEY(MEM_NO, PRO_NO)
);
/*
1번 회원 1번상품 찜
1번 회원, 2번 상품 찜
-->한 회원이 똑같은 상품을 여러번 찜할수는 없음
*/

INSERT INTO TB_LIKE VALUES(1, 1, SYSDATE);
--INSERT INTO TB_LIKEVALUES(1, 1, SYSDATE); --실행불가
INSERT INTO TB_LIKE VALUES(1, 2, SYSDATE);
INSERT INTO TB_LIKE VALUES(2, 1, SYSDATE);
INSERT INTO TB_LIKE VALUES(2, 2, SYSDATE);

--어떤 회원이 어떤 상품을 언제 찜했는지
SELECT * FROM TB_LIKE;

--어떤회원이(상품명, 회원명,날짜시간)어떤 상품을 언제 찜했는지 다 보기
SELECT MEM_ID, MEM_NAME, GENDER, PRO_NAME, PRICE, TO_CHAR(LIKE_DATE, 'YYYY-MM-DD HH:MI:SS')
FROM TB_LIKE L
JOIN MEM_PRI M ON (L.MEM_NO = M.MEM_NO)
JOIN PRODUCT P ON (L.PRO_NO = P.PRO_NO);

----------상품목록 조회시 해당 상품에 찜한 횟수도 같이 조회하는 (상품번호, 상품명, 가격, 찜한 횟수)
SELECT P.PRO_NO"상품번호", P.PRO_NAME"상품이름", P.PRICE"상품가격",  (
                                                                                                                                              SELECT COUNT(*)
                                                                                                                                               FROM TB_LIKE 
                                                                                                                                               WHERE MEM_NO != L.PRO_NO
                                                                                                                                               --WHERE PRO_NO = P.PRO_NO
                                                                                                                                               ) "찜한 횟수"
FROM PRODUCT P 
JOIN TB_LIKE L ON (L.PRO_NO = P.PRO_NO) --제외가능
JOIN MEM_PRI M ON (L.MEM_NO = M.MEM_NO); --제외가능

SELECT * FROM TB_LIKE;

--방법 2
SELECT P.PRO_NO"상품번호", P.PRO_NAME"상품이름", P.PRICE"상품가격", 찜한횟수
FROM(
            SELECT PRO_NO, COUNT(*)"찜한횟수"
            FROM TB_LIKE
            GROUP BY PRO_NO
            ) L
JOIN PRODUCT P  ON (L.PRO_NO = P.PRO_NO);


------------
--회원등급 테이블(MEM_GRADE)
--컬럼 1 :등급코드(GRADE_CODE) ->넘타입/기본키
--2. 등급명(GRADE_NAME) -바차2 타입(30) /NOT NULL

--10번 등급 일반회원
--20번 등급 우수회원
--30번 특별회원
DROP TABLE MEM_GRADE;
DROP TABLE MEM;


CREATE  TABLE MEM_GRADE(
    GRADE_CODE NUMBER PRIMARY KEY,
    GRADE_NAME VARCHAR2(30) NOT NULL
);

INSERT INTO MEM_GRADE VALUES (10, '일반회원') ;
INSERT INTO MEM_GRADE VALUES (20, '우수회원');
INSERT INTO MEM_GRADE VALUES ( 30, '특별회원');

SELECT * FROM  MEM_GRADE;


CREATE TABLE MEM2(
        MEM_NO NUMBER PRIMARY KEY,
        MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
        MEM_PWE VARCHAR2(20) NOT NULL,
        GENDER CHAR(3) CHECK(GENDER IN('남', '여')),
        MEM_DATE DATE NOT NULL,
        GRADE_ID NUMBER -- 회원등급번호를 보관할 컬럼
);

INSERT INTO MEM VALUES(1, 'user01', 'pass01', '남', sysdate, 10);
INSERT INTO MEM VALUES(2, 'user02', 'pass02', NULL, sysdate, NULL);
INSERT INTO MEM VALUES(3, 'user03', 'pass03', '여', sysdate, 40); --유효하지않은 등급에도 잘 들어감

SELECT * FROM MEM;

/*
FOREIGN KEY 외래키 제약조건
다른 테이블에 존재하는 값만 들어와야하는 특정 컬럼에 부여하는 제약조건 (
-
-컬럼레벨 방식
컬럼명 자료형 REPERNCES 참조할테이블명[(참조할컬럼명)]   *참조컬럼명은 생략가능(프라이머리키가 기본)

-테이블레벨방식
FOREIGN KEY(컬러명) REFERENCES 참조할테이블명[(참조할컬럼명)]

->(참조할 컬럼명) 생략시 참조할테이블에 PRIMARYKEY로 설정되어있는 컬럼으로 자동 매칭


*/

CREATE TABLE MEM(
        MEM_NO NUMBER PRIMARY KEY,
        MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
        MEM_PWE VARCHAR2(20) NOT NULL,
        GENDER CHAR(3) CHECK(GENDER IN('남', '여')),
        MEM_DATE DATE NOT NULL,
        GRADE_ID NUMBER REFERENCES  MEM_GRADE -- 회원등급번호를 보관할 컬럼
);

INSERT INTO MEM VALUES(1, 'user01', 'pass01', '남', sysdate, 10);
INSERT INTO MEM VALUES(2, 'user02', 'pass02', NULL, sysdate, NULL); -- 외래키 제약조건 컬럼에 NULL가능
INSERT INTO MEM VALUES(3, 'user03', 'pass03', NULL, sysdate, 30);

SELECT * FROM MEM;

-->부모테이블(MEM_GRADE)로부터 데이터값 삭제시 문제 발생
--데이터 삭제: DELETE FROM 테이블명 WHERE 조건;

--MEM_GRADE 테이블로부터 등급번호가 20번인 데이터 지우기

DELETE FROM MEM_GRADE WHERE GRADE_CODE = 20; --->자식테이블(MEM)에 20이라는 값을 사용하지않고있기  때문에 잘 삭제됨

SELECT * FROM MEM_GRADE; --20번 삭제

DELETE FROM MEM_GRADE WHERE GRADE_CODE = 10; 
--MEM_GRADE테이블의 GRADE_CODE컬럼에서 10이라는 값이 있는데 10을 쓰고있는 자식데이터가 있어 삭제 불가능

SELECT * FROM MEM_GRADE;

/*
외래키 제약조건 설정시 삭제관련 옵션을 설정할 수 있음
-ON DELETE RESTRICTED (기본값) :삭제제한 옵션,자식데이터를 사용하고있으면 부모데이터 삭제안됨
-ON DELETE SET NULL(무조건 삭제해 바꿔서 널로) : 부모데이터 삭제시 해당 데이터를 쓰고 있는 지식데이터 값을 NULL로 변경
-ON DELETE SET  CASCADE : 부모데이터 삭제시 해당 데이터를 쓰고 있는 지식데이터 값을 같이 삭제시키겠다

*/




/*
외래키 제약조건 설정 순간

외래키 제약조건이 있는 컬럼의 테이블            참조하고 있는 테이블
MEM(자식테이블)                                                      MEM_GRADE(부모테이블)

*/



DROP TABLE MEM;
DROP TABLE MEM_GRADE;

CREATE TABLE MEM(
        MEM_NO NUMBER PRIMARY KEY,
        MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
        MEM_PWE VARCHAR2(20) NOT NULL,
        GENDER CHAR(3) CHECK(GENDER IN('남', '여')),
        MEM_DATE DATE NOT NULL,
        GRADE_ID NUMBER REFERENCES  MEM_GRADE ON DELETE SET NULL -- 회원등급번호를 보관할 컬럼
);

INSERT INTO MEM VALUES(1, 'user01', 'pass01', '남', sysdate, 10);
INSERT INTO MEM VALUES(2, 'user02', 'pass02', NULL, sysdate, NULL); 
INSERT INTO MEM VALUES(3, 'user03', 'pass03', NULL, sysdate, 30);

SELECT * FROM MEM_GRADE;
SELECT * FROM MEM;

DELETE FROM MEM_GRADE WHERE GRADE_CODE = 10; -- ON DELETE SET NULL을 썼기 때문에 자식에 사용했단 데이터여도 삭제 잘된다.
---ON DELETE SET  CASCADE사용했다면 MEM테이블로부터 GRADE ID가 10인 지식데이터 행도 아예 삭제되었을 것


-------------------------------------------------------------------------------------------------------

-->찜테이블(TB_LIKE) 회원번호, 상품번호 컬럼에 외래키 제약조건 성장하기 
-- DROP으로 테이블 삭제 후 --> 회원번호 컬럼에는 MEM_PRI테이블 참조하게, 상품번호 컬럼에는 프로덕트 테이블 참조, 회원번호와 상품번호 -->복합키로

--GRADE_ID NUMBER REFERENCES  MEM_GRADE -- 회원등급번호를 보관할 컬럼
DROP TABLE TB_LIKE;

CREATE TABLE TB_LIKE (
        MEM_NO NUMBER , --컬럼레벨
        PRO_NO NUMBER ,
        LIKE_DATE DATE,
        PRIMARY KEY(MEM_NO, PRO_NO),
        FOREIGN KEY (MEM_NO) REFERENCES MEM_PRI, --테이블레벨
       FOREIGN KEY (PRO_NO) REFERENCES PRODUCT 
);


/*
<DEFAULT 기본값> -> 제약조건 아님!
컬럼을 지정하지 않고 INSERT시 기본적으로 NULL이 들어감
이때 NULL이 아닌 내가 원하는 기본값을 넣고자 할 경우 해당 컬럼에 DEFULT값을 제시해둘 수 있음

*/
DROP TABLE MEMBER;

CREATE TABLE MEMBER(
    MEM_NO NUMBER PRIMARY KEY, 
    MEM_NAME VARCHAR2(20) NOT NULL,
    MEM_AGE NUMBER,
    HOBBY VARCHAR2(50) DEFAULT '없음',
    ENROLL_DATE DATE DEFAULT SYSDATE
);

--방법1. 테이블의 모든 컬럼값을 다 제시해서 한 행 INSERT하는 법 
INSERT INTO MEMBER VALUES (1, '강길동', 20, NULL, DEFAULT);
INSERT INTO MEMBER VALUES (2, '강길순', DEFAULT, NULL, DEFAULT);

--방법 2. 테이블의 특정 컬럼만 저장해서 그 컬럼에 추가하고자하는 값만 제시하는 방법
--지정하지 않은 컬럼에는 기본적으로 NULL이 들어감(단, 디폴트 값이 부여되어있을 경우 -> 디폴트 값이 들어
--INSERT INTO 테이블명(컬럼명, 컬럼명) VALUES (값, 값); 
INSERT INTO MEMBER(MEM_NO, MEM_NAME) VALUES(3, '김말똥');


----------------------------------------------------BR계정
/*
서브쿼리를 이용한 테이블 생성
테이블 복사뜨는 개념

[표현법]
CREATE TABLE 테이블명
AS 서브쿼리; 

*/

--EMPLOYEE테이블 그대로 복제한 새로운 테이블 생성
CREATE TABLE EMPLOYEE_COPY
AS SELECT *
        FROM EMPLOYEE;

DROP TABLE EMPLYOEE_COPY;

-->조회되고있는 컬럼과 컬럼의 데이터 타입, 제약조건은 NOT_NULL 만 복사됨

--EPLOYEE 테이블의 사번, 가원명, 급여, 보너스 (구조만을 복사하고자 할 경우)
CREATE TABLE EMPLOYEE_COPY2
AS SELECT EMP_ID, EMP_NAME, SALARY, BONUS
         FROM EMPLOYEE
      WHERE  1 = 0;  --데이터를 굳이 조회시키고 싶지 않을 때

CREATE TABLE EMPLOYEE_COPY3
AS SELECT EMP_ID, EMP_NAME, SALARY, SALARY*12"연봉"
        FROM EMPLOYEE;
        
SELECT * FROM EMPLOYEE_COPY3;






