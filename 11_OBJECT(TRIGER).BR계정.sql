/*
트리거
X특정 테이블에 INSDET, UPDATE, DELETE등 DML문에 의해 변경사항이 생길 때 
즐, 테이블에 이벤트가 발생될 때
매번 자동으로 실행시킬 내용을 미리 정의해 둘 수 있는 객체

EX)
-회원탈퇴 시 기존의 회원테이블에 데이트 DELETE 후 곧바로 탈퇴회원테이블에 INSERT를 수행해야할 경우 
-회원의 신고횟수가 일정 수를 넘었을 때 자동으로 블랙리스트 처리가 되도록 
-입출고에 대한 데이터가 기록될 때마다 상품테이블에 재고수량을 수정해야할 경우 (INSERT -> UPDATE)

----------------------
*트리거 종류
-SQL문의 실행시기에 따른 분류 
 >BEFORE TRIGER : 내가 지정한 테이블에 이벤트가 발생되기 전에 트리거 실행
>AFTER TRIGER: 내가 지정한 테이블에 이벤트가 발생된 후에 트리거 실행

-SQL에 의해 영향을 받는 행에 따른 분류 
>STATEMENT TRIGER(문장 트리거) : 이벤트가 발생한 SQL문에 대해 딱 한번만 트리거를 실행시킴
>ROW TRIGER(행 트리거): 이벤트가 발생한 SQL문에 수행횟수만큼 매번 트리거가 실행(FOR EACH ROW 옵션 기재)
                                                 -  :OLD :BEFORE UPDATE (수정전 자료), BEFORE DELETE(삭제전 자료) 
                                                 -  :NEW :AFTER UPDATE(수정후 자료), AFTER INSERT(추가된 자료)
                                                 

*트리거 생성 방법
CREATE TRIGGER 트리거명
BEFORE|AFTER INSER|UPDATE|DELETE ON 테이블명
[FOR EACH ROW]
[DECLARE 
  변수선언;]
BEGIN 
    실행내용(위에 지정된 이벤트 발생시 묵시적으로 (자동으로) 실행할 구문)
[EXCEPTION
 예외처리구문;]
 )
 END;
/
*/


--임플로이 테이블에 새로운 행 INSERT시 자동으로 메시지 출력시켜주는 트리거 정의
    CREATE OR REPLACE TRIGGER TEG_01
    AFTER INSERT ON EMPLOYEE
    
 BEGIN
    DBMS_OUTPUT.PUT_LINE( '신입사원님 환영합니다!');
 END;

/

SET SERVEROUTPUT ON;

INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME,EMP_NO, JOB_CODE, HIRE_DATE)
VALUES(500, '강개똥', '611234-1231231', 'J4', SYSDATE); 

--------------------------------------------------------------

--상품입고 및 출고 예시
-- 필요 테이블 및 시퀀스 생성

--1.상품에 대한 데이터 보관할 테이블(TB_PRODUCT)
CREATE TABLE TB_PRODUCT(
    PCODE VARCHAR2(10) PRIMARY KEY,
    PNAME VARCHAR2(30) NOT NULL,
    BRAND  VARCHAR2(30) NOT NULL,
    PRICE NUMBER,
    STOCK NUMBER DEFAULT 0 NOT NULL
);

--상품코드용 시퀀스(SEQ_PCODE)
CREATE SEQUENCE SEQ_PCODE
START WITH 11 
NOCACHE;
  
  --샘플데이터
INSERT INTO TB_PRODUCT VALUES('PRO_' || LPAD(SEQ_PCODE.NEXTVAL, 3, '0') , '마우스', '로지텍', 90000, DEFAULT);
INSERT INTO TB_PRODUCT VALUES('PRO_' || LPAD(SEQ_PCODE.NEXTVAL, 3, '0') , '키보드', '레오폴드', 130000, 10);
INSERT INTO TB_PRODUCT VALUES('PRO_' || LPAD(SEQ_PCODE.NEXTVAL, 3, '0') , '모니터', '삼성', 300000, 20);

COMMIT;

--2. 상품 입출고 상세 이력 테이블(1:다) (TB_PRODETAIL)
-- 어떤 상품이, 어떤 날짜에 몇개가 있고 또는 출고 되었는지를 기록하는 테이블 
CREATE TABLE TB_PRODETAIL(
    DCODE NUMBER PRIMARY KEY,
    PCODE VARCHAR2(10) REFERENCES TB_PRODUCT,
    PDATE DATE NOT NULL,
    AMOUNT NUMBER NOT NULL,
    STATUS CHAR(6) CHECK(STATUS IN ('입고', '출고'))
);

--이력번호용 시퀀스
CREATE SEQUENCE SEQ_DCODE; --그냥하면 1부터 1씩 증가하는 시퀀스로 설정된다

--PRO_011 상품이 오늘날짜로 10개입고 
-->TB_PRODETAIL 이력데이터 INSERT
INSERT INTO TB_PRODETAIL
VALUES(SEQ_DCODE.NEXTVAL, 'PRO_011', SYSDATE, 10, '입고');
-->TB_PRODUCT 상품데이터 재고값을 UPDATE(재고수량 늘리기)
UPDATE TB_PRODUCT
SET STOCK = STOCK + 10
WHERE PCODE = 'PRO_011'; 

COMMIT;

--PRO_012 오늘 날짜로 5개 출고
INSERT INTO TB_PRODETAIL
VALUES(SEQ_DCODE.NEXTVAL, 'PRO_012', SYSDATE, 5, '출고');

UPDATE TB_PRODUCT
SET STOCK = STOCK - 5
WHERE PCODE = 'PRO_012';


--TB_PRODETAIL테이블에 이력데이터가 INSERT시  TB_PRODUCT 테이블에 매번 자동으로 재고수량 UPDATE되게 트리거 정의

/*
상품이 입고된 경우(INSERT된 이력데이터값의 STATUS컬럼값이 입고일 경우에 해당
-UPDATE TB_PRODUCT 
 SET STOCK = STOCK + 입고된수량(INSERT 된데이터의 AMOUNT컬럼값)
 WHERE PCODE = 현재입고된상품코드(INSERT된 데이터의 PCODE값)
 
 상품이 출고된 경우(INSERT된 이력데이터값의 STATUS컬럼값이 출고일 경우에 해당
-UPDATE TB_PRODUCT 
 SET STOCK = STOCK - 출고된수량(INSERT 된데이터의 AMOUNT컬럼값)
 WHERE PCODE = 출고된상품코드(INSERT된 데이터의 PCODE값)
*/

CREATE OR REPLACE TRIGGER TRG_02
AFTER INSERT ON TB_PRODETAIL
FOR EACH ROW
BEGIN 
    IF :NEW.STATUS = '입고'
        THEN
                UPDATE TB_PRODUCT
                    SET STOCK = STOCK + :NEW.AMOUNT
                WHERE  PCODE = :NEW.PCODE;
    ELSE
        UPDATE TB_PRODUCT
            SET STOCK = STOCK - :NEW.AMOUNT
         WHERE PCODE = :NEW.PCODE;
    END IF;
END;
/


--PRO_012 상품이 오늘 날짜로 5개 출고
INSERT INTO TB_PRODETAIL
VALUES(SEQ_DCODE.NEXTVAL, 'PRO_012', SYSDATE, 5, '출고');

--PRO_013 상품이 오늘 날짜로 100개입고
INSERT INTO TB_PRODETAIL
VALUES(SEQ_DCODE.NEXTVAL, 'PRO_013', SYSDATE, 100, '입고');


--문장트리거 ->이벤트 발생 행 수가 여러행이어도 트리거는 한번만 실행
CREATE OR REPLACE TRIGGER TRG_03
AFTER UPDATE ON EMPLOYEE
BEGIN 
        DBMS_OUTPUT.PUT_LINE('수정');
END;
/

UPDATE EMPLOYEE
    SET SALARY = 1000000
WHERE MANAGER_ID = 200;



--행트리거 
CREATE OR REPLACE TRIGGER TRG_03
AFTER UPDATE ON EMPLOYEE
FOR EACH ROW
BEGIN 
        DBMS_OUTPUT.PUT_LINE('수정');
END;
/

UPDATE EMPLOYEE
    SET SALARY = 1000000
WHERE MANAGER_ID = 200;