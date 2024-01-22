SELECT * FROM EMP_02 ORDER BY EMPNO;

/*
2. INSERT ALL
두개 이상의 테이블에 각각 INSERT할 때 이때 사용되는 서브쿼리가 동일할 경우

*/

-->테스트 코드

CREATE TABLE EMP_DEPT
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
        FROM EMPLOYEE
        WHERE 1=0;
        
CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID, EMP_NAME, MANAGER_ID
        FROM EMPLOYEE
        WHERE 1=0;
        
SELECT * FROM EMP_DEPT;
SELECT * FROM EMP_MANAGER;

--부서코드가 D1인 사원들의 사번, 이름, 부서코드, 입사일 사수사번 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
        FROM EMPLOYEE
        WHERE DEPT_CODE = 'D1';
   
        
        /*
        [표현법]
        INSERT ALL
        INTO 테이블명 1 VALUES (컬럼명, 컬럼명, ...)
        INTO 테이블명 2 VALUES (컬럼명, 컬럼명, ...)
                    서브쿼리;
        */
   
             
INSERT ALL
INTO EMP_DEPT VALUES (EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
INTO EMP_MANAGER VALUES(EMP_ID, EMP_NAME, MANAGER_ID)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
        FROM EMPLOYEE
        WHERE DEPT_CODE = 'D1';
        
SELECT * FROM EMP_DEPT;
SELECT * FROM EMP_MANAGER;

--조건을 사용해서 각 테이블에 INSERT가능
--2000년도 이전 입사한 입사자들에 대한 정보 담을 테이블
CREATE TABLE EMP_OLD
AS SELECT EMP_ID, EMP_NAME,HIRE_DATE, SALARY
        FROM EMPLOYEE
        WHERE 1=0;
        
        
  --2000년도 이후
CREATE TABLE EMP_NEW
AS SELECT EMP_ID, EMP_NAME,HIRE_DATE, SALARY
        FROM EMPLOYEE
        WHERE 1=0;
       
        
 /*[표현법]
 INSERT ALL
 WHEN 조건 1 THEN
    INTO 테이블명 1 VALUES (컬럼명, 컬럼명.)
  WHEN 조건 2 THEN
    INTO 테이블명 2 VALUES (컬럼명, 컬럼명.)   .
 서브쿼리;
 */
 
 
 
 INSERT ALL
 WHEN HIRE_DATE < '2000/01/01' THEN
        INTO EMP_OLD VALUES (EMP_ID, EMP_NAME,HIRE_DATE, SALARY)
  WHEN HIRE_DATE >= '2000/01/01' THEN
        INTO EMP_NEW VALUES (EMP_ID, EMP_NAME,HIRE_DATE, SALARY)       
SELECT EMP_ID, EMP_NAME,HIRE_DATE, SALARY
FROM EMPLOYEE;

SELECT * FROM EMP_OLD; --8
SELECT * FROM EMP_NEW; --16

--------------------------------------------------------
/*
.UPDATE
테이블에 기록되어있는 기존의 데이터를 수정하는 구문

[표현식]
UPDATE 테이블명 
SET 컬럼명 ->바꿀값,
        컬럼명 ->바꿀값,
        ... ->여러개의 컬럼값 동시변경 가능
[WHERE 조건 ] ; -> 생략시 모든 행의 데이터가 변경되버림

*/


--복사본 테이블
CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;


--D9Q부서의 부서명을 '전략기획팀'
UPDATE DEPT_COPY
SET DEPT_TITLE = '전략기획팀'
WHERE DEPT_ID = 'D9' ;

SELECT * FROM DEPT_COPY;

ROLLBACK; --마지막으로 커밋 시점으로 돌아감( 시점: 직접 커밋할수도 있고 아니면 DDL구문 실행할 수도 있음)

DROP TABLE EMP_SALARY;

---실습
CREATE TABLE EMP_SALARY
AS SELECT DEPT_CODE, EMP_ID, EMP_NAME,HIRE_DATE, SALARY, BONUS
        FROM EMPLOYEE;

SELECT * FROM EMP_SALARY;

----노옹철 사원의 급여를 100만원으로 변경(EMP_SALARY)
UPDATE EMP_SALARY
SET SALARY = 1000000
WHERE EMP_NAME = '노옹철';

--선동일 사원의 급여를 700만원으로 , 보너스도 0.2로 변경
 UPDATE EMP_SALARY
SET SALARY = 7000000,
        BONUS = 0.2
WHERE EMP_NAME = '선동일';

SELECT * FROM EMP_SALARY;

--전체 사원의 급여를 기존의 급여에 10프로 인상한 금액으로 수정(기존급여 * 1.1)
UPDATE EMP_SALARY
SET SALARY = (SALARY * 1.1);

--UPDATE시 서브쿼리 사용가능

/*
UPDATE테이블명
SET 컬럼명 = (서브쿼리)
WHERE 컬럼명 = (서브쿼리)

*/ 

--방명수 사원의 급여와 보너스값을 유재식 사원의 급여와 보너스값으로 변경
UPDATE EMP_SALARY
SET (SALARY, BONUS) = (SELECT SALARY, BONUS
                                                FROM EMP_SALARY
                                                WHERE EMP_NAME = '유재식')    
 WHERE EMP_NAME = '방명수'  ;
 
 SELECT * FROM EMP_SALARY;
 
 
 --ASIA지역에 근무하는 사원들의 보너스값을 0.3으로 변경(EMP_SALARY)
 --사번이 ASIA지역에 근무하는 사원들의 사번과 일치하는
 UPDATE EMP_SALARY
 SET BONUS = 0.3
 WHERE EMP_ID IN (/*아시아 지역에 근무하는 사원들의 사번*/
                                    SELECT EMP_ID
                                     FROM EMP_SALARY
                                    JOIN DEPARTMENT ON (DEPT_CODE =  DEPT_ID)
                                    JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
                                     WHERE LOCAL_NAME LIKE 'ASIA%'
                                     );
 


--======실패되는 코드 
 --UPDATE시에도 제약조건에 위배되면 안됨

 UPDATE EMPLOYEE
 SET EMP_NAME =NULL
 WHERE EMP_ID =200;
 
 --노옹철 사원의 직급코드 J9로 변경
  UPDATE EMPLOYEE
 SET JOB_CODE = 'J9'
 WHERE EMP_NAME = '노옹철';
 --------------------------------------------
 
 
 /*
 
 DELETE 
 테이블에 기록된 데이터를 삭제하는 구문(한 행 단위로 삭제됨)\
 
 [표현식]
 DELETE FROM 테이블명;
 [WHERE 조건];
 
 */
 
 COMMIT;
 
 SELECT * FROM EMPLOYEE;

 
 
 --장채현 사원의 데이터 지우기
 DELETE FROM EMPLOYEE
  WHERE EMP_NAME = '장채현';
  
 ROLLBACK;
 
  DELETE FROM EMPLOYEE
  WHERE EMP_NAME = '강람보';
 
  COMMIT;
  
  --DEPARTMENT로부터 D1부서 삭제
  DELETE FROM DEPARTMENT
  WHERE DEPT_ID = 'D1' ; -->D1값을 가져다쓰는 자식데이터가 있어 삭제 불가 
  --자식: EPLOYEE(DEPT_CODE) --> 부모: DEPARTMENT(DEPT_ID)
  
  --D3부서 삭제
  DELETE FROM DEPARTMENT
  WHERE DEPT_ID ='D3'; --외래키 제약조건이 설정되어 있어도 참조되고 있지않은 부모값에 대해서는 삭제가능
  
  SELECT * FROM DEPARTMENT;
  
  ROLLBACK;
  
  
  --삭제시 FOREIGN KEY 제약조건 비활성화 시키기
  ALTER  TABLE EMPLOYEE
  --DISABLE CONSTRAINT SYS_C007263 CASCADE;--DISABLED상태로 바뀜 D1이 삭제 가능해진다
 ENABLE  CONSTRAINT SYS_C007263; -- 다시활성화 삭제한 D1을 다시 넣어줘야 실행가능
  
  INSERT INTO DEPARTMENT VALUES ('D1', '인사관리부', 'L1');
  
  --TRUNCATE : 테이블의 전체행 삭제하는 구문, WHERE절 작성이 불가해서 일부삭제가 불가, 롤백불가능
                --             DELETE 보다 수행속도가 더 빠름
                --             ROLLBACK이 불가능함
                --[표현식] TRUNCATE TABLE 테이블명;
SELECT * FROM EMP_SALARY;

TRUNCATE TABLE EMP_SALARY;