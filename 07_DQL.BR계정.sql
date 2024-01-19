/*
DQL(DATA QUERY LANGUAGE) : 데이터 질의 언어

        DML(DATA MANIPULATION LANGUAGE) : 데이터 조작 언어 , INSERT/UPDATE/DELETE + SELECT
        DDL(DATA DEFINITION LANGUAGE) :  데이터 정의 언어, CREATE, ALTER, DROP
        DCL(DATA CONTROL LANGUAGE) : 데이터 제어 언어, GRANT/REVOKE + COMMIT/ROLLBACK

        TCL(TRANSACTION CONTROL LANGUAGE) : 트랜젝션 제어 언어, COMMIT, REVOKE
        
        <DML 데이터 추가언어>
        데이터값을 추가(INSERT)하거나 , 수정(UPDATE)하거나, 삭제(DELETE)하는 구문
*/




/*
        1. INSERT 
        테이블에 새로운 행을 추가시키는 구문
        
        1) 특정 컬럼을 지정하지 않고 삽입하고자 할 때
            INSERT INTO 테이블명 VALUES (값, 값, 값, ...);
            컬럼순번 지켜서 VALUES에 값 제시
            
            부족하게 값을 제시했을 경우 => NOT ENOUGH VALUESE오류
*/

INSERT INTO EMPLOYEE
VALUES (900, '장채현', '970812-2234853', 'jang_ch@br.com', '01011112222', 'D0', 'J7'
                , 40000000, NULL, 200, SYSDATE, NULL, DEFAULT);
ROLLBACK;

--테이블 생성 후 뒤늦게 제약조건 추가하기(DDL --> ALTER)
-- ALTER TABLE 테이블명 변경할 내용;
/*
>>변경할 내용
ADD PRIMARY KEY(컬럼명)         -- PRIMARY KEY 제약조건 추가법
ADD FOREIGN KEY(컬럼명)  REFERENCES 참조할테이블명[(참조할 컬럼명)]       --FOREIGN KEY 제약조건 추가법
ADD UNIQUE(컬럼명)
ADD CHECK(컬럼에 대한 조건식)
MODIFY 컬럼명 NOT NULL

[CONSTRAINT 제약조건명] 제약조건
*/

-- EMPLOYEE테이블에 DEPT_CODE 컬럼에 외래키제약조건추가 => DEPARTMENT 참조 (부모테이블)
DELETE FROM EMPLOYEE WHERE EMP_NAME = '장채헌';
SELECT * FROM EMPLOYEE;
ROLLBACK;

ALTER TABLE EMPLOYEE ADD FOREIGN KEY (DEPT_CODE) REFERENCES DEPARTMENT (DEPT_ID);
-- EMPLOYEE테이블에 JOB_CODE 컬럼에 외래키제약조건추가 => JOB참조 (부모테이블)
ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_EMP_JCODE FOREIGN KEY (JOB_CODE) REFERENCES JOB (JOB_CODE);


INSERT INTO EMPLOYEE
VALUES(900, '장채헌', '980123-2345678', 'jang_ch@br.com', '01011112222', 'D1', 'J7', 4000000, NULL, 200, SYSDATE, NULL, 'N');

SELECT * FROM EMPLOYEE;

/*
    2) 특정 컬럼을 지정해서 그 값만 제시하고 싶을 때
    INSERT INTO 테이블명(컬럼명,  컬럼명, 컬럼명) VALUES (값, 값, 값)
    
    한 행 단위로 추가되기 때문에 선택되지 않은 컬럼에는 기본적으로 NULL 아니면 DEFAULT값이 들어가짐
*/

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE)
VALUES('901', '홍길동', '971231-123456', 'J2', TO_DATE('120114 090000' ,  'RRMMDD HH24MISS'));

SELECT * FROM EMPLOYEE WHERE EMP_ID = 901;

-------------------------------------------------------------------------------------------------------

/*
3)서브쿼리 수행 결과값을 통째로 INSERT하기
INSERT INTO 테이블명
(서브쿼리);

*/
CREATE TABLE EMP_01(
        EMPNO NUMBER,
        EMPNAME VACHAR2(20),
        DEPTITLE VARCHAR2(20)
    );
    
   SELECT * FROM EMP_01;
   
   
   
   INSERT INTO EMP_01
   (
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE
    FROM EMPLOYEE, DEPARTMENT
    WHERE DEPT_CODE = DEPT_ID(+)
    );
    
SELECT * FROM EMP_01 ORDER BY EMPNO;

/*
4)INSERT 수행시 한 컬럼 값으로 서브쿼리 수행 결과값을 INSERT 
INSERT INTO 테이블명[(컬럼명, 컬럼명...)]  VALUES (값, 값...서브쿼리)
*/

INSERT INTO EMP_01
VALUES(902, '김개똥',  (SELECT DEPT_TITLE
                                            FROM DEPAETMENT
                                           WHERE DEPT_ID = 'D2'));


SELECT * FROM EMP_01 ORDER BY EMPNO;

---------------------------------------------------------------------------------------------------------------------------------------------
-->7) 박나라 사원과 같은 직급의 사원들의 사원명, 직급명을 조회하시오. (오라클구문, ANSI구문 둘다 작성하시오.)
--      단, 박나라는 제외하고 조회하시오.
--ANSI
SELECT  EMP_NAME, J.JOB_NAME
FROM  (SELECT EMP_NAME, JOB_CODE
               FROM  EMPLOYEE 
               WHERE JOB_CODE = (
                                                        SELECT JOB_CODE
                                                         FROM EMPLOYEE        
                                                         WHERE EMP_NAME = '박나라'
                                                         )
              ) E
LEFT JOIN  JOB J ON (E.JOB_CODE = J.JOB_CODE)
WHERE EMP_NAME <> '박나라';

/*WHERE 박나래 제외*/

