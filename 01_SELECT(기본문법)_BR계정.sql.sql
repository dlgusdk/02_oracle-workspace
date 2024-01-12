/*
    * SELECT
    데이터를 조회할 때 사용하는구문
    
    >> RESULT SET : SELECT문을 통해서 조회된 결과물(즉, 조회된 행들의 집합을 의미)
    
    [표현법]
    SELECT 조회하고자하는컬럼, 컴럼, ... || * : 모든
    FORM 테이블명;
        
*/
-- EMPLOYEE 테이블에 모든 컬럼 조회
SELECT * 
FROM EMPLOYEE;

-- EMPLOYEE 테이블에 사번, 이름, 급여만 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE; -- ORACLE의 키워드, 테이블명, 컬럼명 들은 대소문자를 가리지 않음(소문자 사용 가능)
               -- 실제 담긴 데이터값은 대소문자를 가림
      
-- JOB 테이블의 모든 컬럼 조회         
SELECT * FROM JOB;

---------- 실습문제 ------------
-- 1. JOB테이블에 직급명 컬럼만 조회
SELECT JOB_NAME
FROM JOB;
-- 2. DEPARTMENT 테이블의 모든 컬럼 조회
SELECT * FROM DEPARTMENT;
-- 3. DEPARTMENT 테이블에 부서코드, 부서명만 조회
SELECT DEPT_ID,DEPT_TITLE
FROM DEPARTMENT;
-- 4. EMPLOYEE 테이블에 사원명, 이메일, 전화번호, 입사일, 급여 조회
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY
FROM EMPLOYEE;

--------------------------------------------------------------------
/*
    < 컬럼값을 통한 산술연산 >
    SELECT절 컬럼명 작성시 산술연산식 기술 가능(산술연산된 결과값이 조회)
*/
-- 사원명, 사원의 연봉(급여*12) 조회
SELECT EMP_NAME, SALARY * 12
FROM EMPLOYEE;

-- 사원명, 급여, 보너스, 연봉, 보너스 포함 연봉(급여 + 보너스*급여) * 12
SELECT EMP_NAME, SALARY, BONUS, SALARY * 12, (SALARY + BONUS * SALARY) * 12
FROM EMPLOYEE;
--> 산술연산 과정 중 NULL이 있을 경우 산술연산 결과 마저도 NULL이 나옴

-- 사원명, 입사일, 근무일수(오늘날짜 - 입사일) ORACLE은 날짜간의 계산도 가능(일 단위)
SELECT SYSDATE
FROM DUAL; -- 오라클에서 제공하는 가상테이블(더미테이블)

SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
FROM EMPLOYEE;
--DATE - DATE : 결과값은 일 단위
--값이 지저분한 이유는 DATE타입이 년월일시분초 까지 즉, 시간정보까지 관리하기 때문

----------------------------------------------------------------
/*
<컬럼명에 별칭 지정하기>
ResultSet(조회된 결과)에 컬럼명 자리에 내가 원하는 별칭으로 부여

[표현법]
컬럼명 별칭 / 컬럼명 AS 별칭
컬럼명 "별칭" / 컬럼명 AS "별칭"

As를 붙이든 안붙이든 부여하고자 하는 별칭에 띄어쓰기 혹은 특수문자가 포함될 경우 반드시 ""로 묶어야함
*/

SELECT EMP_NAME 사원명, SALARY AS 급여, BONUS, 
       SALARY*12 "연봉(원)", (SALARY + BONUS*SALARY)*12 AS "총 소득"
FROM EMPLOYEE;

-----------------------------------------------------------

/*
<리터럴>
임의로 지정한 문자값

SELECT절에 리터럴을 제시하면 마치 테이블상에 존재하는 데이터처럼 조회 가능
조회된 ResultSet의 모든 행에 반복적으로 같이 출력
*/

---사번, 사원명, 급여, 단위
SELECT EMP_ID, EMP_NAME, SALARY, '원' AS 단위
FROM EMPLOYEE;

/*
<연결 연산자 : ||>

여러 컬럼값들을 마치 하나의 것처럼 연결하거나, 컬럼값과 리터럴을 연결할 수 있음
System.out.println("num : " + num); 자바에서의 문자열 덧셈같은 느낌

*/

SELECT EMP_ID || EMP_NAME || SALARY 
FROM EMPLOYEE;


--컬럼값이랑 리터럴과 연결
--XXX의 월급은 XXXX원 입니다.
SELECT EMP_NAME || '의 월급은 ' || SALARY ||'원 입니다.' AS "급여정보"
FROM EMPLOYEE;

------------------------------------------------------------------

/*
<DISTINCT>
컬럼에 중복된 값들은 한번씩만 표시하고자 할 때 사용
*/

--현재 사원들이 어떤 부서에 분포되어있는지 알고싶음.
SELECT * 
FROM DEPARTMENT; --9개 행

SELECT DISTINCT DEPT_CODE
FROM EMLOYEE; --7개 행

--현재 사원들이 어떤 직급에 분포되어있는지
SELECT DISTINCT JOB_CODE
FROM EMLOYEE;

--유의사항: DISTINCT는 SELECT절 딱 한번만 기술 SELECT DISTINCT DEPT_CODE
--(DEPT_CODE, JOB_CODE)묶어서 중복판별
SELECT DISTINCT DEPT_CODE, JOB_CODE
FROM EMLOYEE;

--====================

/*
<WHERE절>
조회하고자하는 테이블로부터 특정 조건에 만족하는 데이터만을 조회하고자 할 떄
WHERE 절에 조건식을 작성하게 됨

--[표현법]
--SELECT 칼럽, 컬럼,,, 산술연산 AS별칭
FORM 테이블명
WHERE 조건식;

-비교연산자
> <>= <= 대소비교연산자
== 동등비교연산자
!= ^= <> 일치하지않는지
*/

