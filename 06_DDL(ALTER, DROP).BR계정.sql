/*
<ALTER>
객체, 구조를 변경하고자 할 때 작성하는 구문 DDL

[표현식]
ALTER TABLE 테이블명 변경할내용;


*변경할 내용
1)컬럼 추가/ 수정/삭제
2)제약조건 추가/삭제
3)컬럼명/제약조건/테이블명 변경

*/

--1)컬럼 추가/수정/삭제
--1_1)컬럼추가(ADD) : ADD 컬럼명 데이터타입(크기)
--DEPT_COPY에 CNAME컬럼추가
ALTER TABLE DEPT_COPY ADD CNAME VARCHAR2(20);
-->기존의 여러행의 데이터가 있을 경우 새로운 컬럼이 만들어지고 기본적으로 NULL로 채워짐

--ㅣLNAME  추가
ALTER TABLE DEPT_COPY ADD LNAME VARCHAR2(30) DEFAULT '한국';
-->새로운 컬럼이 만들어지고 내가 지정한 DEFAULT값으로 채워짐, 안넣으면 NULL

--1_2)컬럼수정(MODIFY)
            -->데이터 타입수정: MODIFY 컬럼명 바꾸고자하는데이터타입
            -->DEFAULT값 수정: MODIFY 컬럼명 DEFAULT 바꾸고자하는기본값
            
ALTER TABLE DEPT_COPY MODIFY DEPT_ID NUMBER; --오류발생
ALTER TABLE DEPT_COPY MODIFY CNAME NUMBER; --아예 다른 자료형으로 변경하고자 할 경우 -> 데이터값이 비워져있어야만 함
ALTER TABLE DEPT_COPY MODIFY DEPT_ID CHAR(30);
ALTER TABLE DEPT_COPY MODIFY DEPT_TITLE VARCHAR2(10);--용량을 넘어가는 데이터가 있어 오류  


--DEPT_TITLE 컬럼을 VARCHAR2(40)로
--LACATION _ID칼럼을 VARCRCHAR2(2)
--LNAME컬럼의 기본값을 미국
ALTER TABLE DEPT_COPY 
             MODIFY DEPT_TITLE VARCHAR2(40),
             MODIFY LOCATION_ID VARCHAR2(2),
             MODIFY LNAME DEFAULT '미국';
             
---1_3)컬럼 삭제 (DROP COLUMN) DROP COLUMN 삭제하고자하는컬럼명
ALTER TABLE EMP_OLD DROP COLUMN SALARY;
ALTER TABLE EMP_OLD DROP COLUMN  HIRE_DATE;
ALTER TABLE EMP_OLD DROP COLUMN  EMP_NAME;
ALTER TABLE EMP_OLD DROP COLUMN  EMP_ID;--최소 한개의 컬럼은 존재해야함 삭제불가

----------
--2)제약조건 추가/삭제
/*
PRIMARY KEY : ADD PRIMARY KEY(컬럼명)
FOREIGN KEY : ADD FOREIGN KEY(컬럼명) REPERENCED 참조할테이블명 -- (참조할컬럼)
UNIQUE : ADD UNIQUE(컬럼명)
CHECK : ADD CHECK(컬럼명)

NOT NULL : MODIFY 컬럼명 NOT NULL| NULL
제약조건명을 지정하고자 한다면 [CONDTRAINT 제약조건명] 제약조건
*/

--DEPT_COPY로부터 DEPT_ID 에 PRIMARY 제약조건 추가
--DEPT_TITLE에 UNIQUE제약 추가
--LNAME에 NOT NULL제약조건으로
UPDATE DEPT_COPY
SET LNAME = '한국'
WHERE DEPT_ID ='D0';

DROP TABLE DEPT_COPY;
ROLLBACK;

ALTER TABLE DEPT_COPY
    ADD CONSTRAINT DCOPY_PK PRIMARY KEY (DEPT_ID)
    ADD CONSTRAINT DCOPY_UQ UNIQUE (DEPT_TITLE)
    MODIFY LNAME CONSTRAINT DCOPY_NN NOT NULL; 
    
    
    --2_2)제약조건 삭제 : DROP CONSTRAINT 제약조건명/ MODIFY 
    ALTER TABLE DEPT_COPY
    DROP CONSTRAINT DCOPY_UQ
    MODIFY LNAME NULL;
    
        ALTER TABLE DEPT_COPY
                DROP CONSTRAINT SYS_C007283;

----------------------------------------------------------------

--3)컬럼명/제약조건명/테이블명 RENAME
--3_1)컬럼명 변경 RENAME COULMN 기존컬럼명 TO 바꿀컬럼명
ALTER TABLE DEPT_COPY RENAME COLUMN DEPT_TITLE TO DEPT_NAME;

--변경: RENAME CONSTRAINT 기존제약명 TO 바꿀컬럼명
ALTER TABLE DEPT_COPY RENAME CONSTRAINT DCOPY_PK TO DCOPY_DID_PK; --제약조건 이름 변경

--3_3) 테이블명 변경: RENAME 기존테이블명 TO 바꿀테이블명
ALTER TABLE DEPT_COPY RENAME TO DEPT_TEST;

-----------------------------------------------
--테이블 삭제(DROP TABLE 삭제하고자하는 테이블명)
DROP TABLE DEPT_TEST; 

--DROP TABLE JOB; --단 어딘가에서 참조되고 있는 부모테이블은 함부로 삭제 안됨
--방법1 자식테이블 먼저 삭제 후 부모테이블 삭제
--방법2 DROP TABLE  테이블명 CASCADE CONSTRAINT; -->제약조건까지 같이 삭제하는 방법 -->강제로 테이블삭제\

