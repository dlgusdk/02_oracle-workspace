/*
시퀀스 (SEQUENCE)
자동으로 숫자를 발생시켜주는 역할의 객체(구조)
정수값을 순차적으로 일정값씩 증가시키면서 생성

EX)회원번호, 사원번호, 게시글번호, ...(PK역할의 칼럼)
*//*

1.시퀀스 생성
[표현법]
CREATE SEQUENCE 시퀀스명
[START WITH 시작숫자]           *[]생략가능    ->처음 발생시킬 시작값 지정(기본값 1)
[INCREMENT BY 숫자]  --> 몇 씩 증가시킬건지 지정(기본값 1)
[MAXVALUE 숫자]  ->최대값 지정 (기본값 겁나큼)
[MINVALUES 숫자]  -->최소값 지정(기본값 1) 
[CYCLE|NOCYCLE] -->값 순환 여부 지정(기본값 NOCYCLE)
[NOCACHE|CACHE 바이트 크기] ->캐시메모리 할당(기본값 CACHE 20)

*캐시메모리 : 미리 발생될 숫자값들을 생성시켜서 저잘해두는 공간
>호출할 때마다 새로이 숫자를 생성시키는게 아니라 이미 생성되어있는 수자를 가져오기 때문에 속도가 빠름
단점이라 한다면 접속이 해제되는 순간 캐시메모리상에 만들어졌던 번호들을 날리는셈

*/
--테이블명: TB_
--시퀀스명 : SEQ_
--트리거 : TRG_
--뷰 : VW_

DROP SEQUENCE SEQ_EMPNO;

CREATE SEQUENCE SEQ_EMPNO
START WITH 300
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE;

--참고 : USER_SEQUENCES : 이 사용자가 가지고 있는 시퀀스들의 구조 (시스템테이블)
SELECT * FROM USER_SEQUENCES;

/*
시퀀스 사용

시퀀스명.CURRVAL : 현재 시퀀스 값을 알아내고자할 때(마지막으로 성공적으로 수행한 NEXTVAL값

시퀀스명.NEXTVAL :일정값을 증가시켜서 새로이 발생된 값
                                    CURRVAL +INCREMENT BY 증가값 == NEXTVAL

*/

SELECT SEQ_EMPNO.CURRVAL FROM DUAL;
--NEWXTVAL를 수행하면 CREATVAL 사용불가
--왜: CURRVAL마지막으로 수행된 NEXTVAL값을 임시보관하는 값

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;--300
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; --305
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; --310

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; --지정한 맥스벨류 값을 초과해서 오류 

SELECT SEQ_EMPNO.CURRVAL FROM DUAL;


/*
시퀀스 변경

ALTER SEQUENCE 시퀀스명
[INCREMENT BY 숫자]  --> 몇 씩 증가시킬건지 지정(기본값 1)
[MAXVALUE 숫자]  ->최대값 지정 (기본값 겁나큼)
[MINVALUES 숫자]  -->최소값 지정(기본값 1) 
[CYCLE|NOCYCLE] -->값 순환 여부 지정(기본값 NOCYCLE)
[NOCACHE|CACHE 바이트 크기] ->캐시메모리 할당(기본값 CACHE 20)

*START WITH는 수정 불가능

*/
ALTER SEQUENCE SEQ_EMPNO
INCREMENT BY 10
MAXVALUE 400;

SELECT SEQ_EMPNO.CURRVAL FROM DUAL;

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;

------------------------------------
--INSERT 문에서 시퀄스 활용
CREATE SEQUENCE SEQ_EID
START WITH 300;

INSERT
    INTO EMPLOYEE
    (
        EMP_ID, 
        EMP_NAME,
        EMP_NO, 
        JOB_CODE,
        HIRE_DATE
    )
    VALUES
    (
    SEQ_EID.NEXTVAL,
    '강개순', --사용자가 화면에서 입력한 값
    '970820-1290344',
    'J5',
    SYSDATE
    );


ROLLBACK;



--=========================
CREATE TABLE PHONE (
        PHO_CODE VARCHAR2(10) PRIMARY KEY, 
        PHO_NAME VARCHAR2(20) NOT NULL,
        BRAND VARCHAR2(20),
        PRICE NUMBER, 
        REGIST_DATE DATE DEFAULT SYSDATE
);


--PHO_001  아이폰 11 애플 1000000 SYSDATE
--PHO_002 ... 갤럭시21 삼성 1300000 SYSDATE
--PHO_003  플립 삼성 12000000 SYSDATE
--순차적으로 증가 ->SEQUENCES

-->EX) PHO _010 -> PHO_111
--LPAD (SEQ_POH.NEXTVAL, 최종적으로 반환할 길이 ,덧붙이고자하는 문자)

CREATE SEQUENCE SEQ_PHO
MAXVALUE 999;

INSERT 
    INTO PHONE
    (
        PHO_CODE, 
        PHO_NAME,
        BRAND, 
        PRICE
    )
        VALUES
    (
    'PHO_'  || LPAD(SEQ_PHO.NEXTVAL, 3, '0'),
    '아이폰11', 
    '애플',
    1000000
     );
     
     
     INSERT 
    INTO PHONE
    (
        PHO_CODE, 
        PHO_NAME,
        BRAND, 
        PRICE
    )
        VALUES
    (
    'PHO_'  || LPAD(SEQ_PHO.NEXTVAL, 3, '0'),
    '갤럭시21', 
    '삼성',
    130000
     );
     
     
      INSERT 
    INTO PHONE
    (
        PHO_CODE, 
        PHO_NAME,
        BRAND, 
        PRICE
    )
        VALUES
    (
    'PHO_'  || LPAD(SEQ_PHO.NEXTVAL, 3, '0'),
    '플립', 
    '삼성',
    1200000
     );
     
