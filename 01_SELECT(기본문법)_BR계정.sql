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
SELECT SYSDATE -- 현재 시스템 날짜 및 시간
FROM DUAL; -- 오라클에서 제공하는 가상테이블(더미테이블)

SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
FROM EMPLOYEE;
-- DATE - DATE : 결과값은 딜 단위
-- 값이 지저분한 이유는 DATE타입이 시,분,초까지 즉, 시간정보까지 관리하기 때문

-------------------------------------------------------------

/*
    < 컬럼명에 별칭 지정하기 >
    RESULTSET(조회된결과)에 컬럼명 자리에 내가 원하는 별칭으로 부여
    (표현법 4가지)
    컬럼명 별칭 / 컬럼명 AS 별칭
    컬럼명 "별칭" / 컬럼명 AS "별칭"
    
    AS는 중요하지 않지만 부여할 별칭에 띄어쓰기 혹은 특수문자가 있을 경우 ""로 묶어야함
*/

SELECT EMP_NAME 사원명, SALARY AS 급여, BONUS,
    SALARY * 12 "연봉(원)", (SALARY + BONUS * SALARY) * 12 AS "총 소득"
FROM EMPLOYEE;

---------------------------------------------------------------

/*
    < 리터럴 >
    임의로 지정한 문자값9(' ')
    
    SELECT절에 리터럴을 제시하면 마치 테이블상에 존재하는 데이터 처럼 조회 가능
    조회된 RESULTSET의 모든 행에 반복적으로 같이 출력
*/

-- 사번, 사원명, 급여, 단위
SELECT EMP_ID, EMP_NAME, SALARY || '원' AS 급여
FROM EMPLOYEE;

/*
    < 연결 연산자 : || >
    여러 컬럼값들을 하나의 컬럼인 것 처럼 연결하거나, 컬럼값과 리터럴을 연결
*/

SELECT EMP_ID || EMP_NAME || SALARY || '원' AS 급여
FROM EMPLOYEE;

-- 컬럼값과 리터럴 연결
-- XXX의 월급은 XXXX원 입니다.
SELECT EMP_NAME || '의 월급은 ' || SALARY || '원 입니다.' AS "급여 정보"
FROM EMPLOYEE;

--------------------------------------------------------------

/*
    < DISTINCT >
    컬럼에 중복된 값들을 한번씩만 표시하고자 할 때 사용
*/
-- 현재 사원들이 어떤부서에 분포되어 있는지 알고 싶음
SELECT * 
FROM DEPARTMENT; -- 9개 행

SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE; -- 7개 행 (D3, D4, D7 제외)

-- 현재 사원들이 어떤 직급에 분포되어있는지
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

-- 유의사항 : DISTINCT는 SELECT절에 딱 한번만 기술 할 수 있음
/*
SELECT DISTINCT DEPT_CODE, DISTINCT JOB_CODE
FROM EMPLOYEEE;
*/

-- (DEPT_CODE, JOB_CODE) 쌍으로 묶어서 중복 판별
SELECT DISTINCT DEPT_CODE, JOB_CODE
FROM EMPLOYEE;

-- =========================================

/*
    * WHERE 절
     조회하고자 하는 테이블로부터 특정 조건에 만족하는 데이터만을 조회하고자 할 때
     WHERE절에 조건식을 작성하게 됨
     조건식 => 다양한 연산자 기술 가능
     
     (표현법)
     SELECT 컬럼, 컬럼, ..., 산술연산자 AS 별칭
     FROM 테이블명
     WHERE 조건식;
     
     - 비교연산자
      > < >= <=     -> 대소비교 연산자
      = !=          -> 동등비교 연산자
      != ^= <>      -> 불일치비교 연산자
*/

-- 사원들 중 부서가 'D9'인 사원들만 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

-- 사원들 중 부서코드가 'D1'인 사원들의 사원명, 급여 조회
SELECT EMP_NAME, SALARY --, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

-- 사원들 중 부서코드가 'D1'이 아닌 사원들으 사원명, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
--WHERE DEPT_CODE != 'D1'; -- (DEPT_CODE)RK NULLDLS 사원 2명이 제외
--WHERE DEPT_CODE ^= 'D1';
WHERE DEPT_CODE <> 'D1';

-- 사원들 중 급여가 400만원 이상인 사원들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 4000000;

-------------------- 실습문제 ----------------------------
-- 1. 사원들 중 재직중인 사원들의 사번, 이름, 입사일 조회
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN != 'Y' AND HIRE_DATE < '96/10/30'; -- DATE타입은 대소비교 연산 가능
-- 2. 급여가 300만원 이상인 사원들의 사원명, 급여, 입사일, 연봉 조회
SELECT EMP_NAME, SALARY, HIRE_DATE, SALARY * 12
FROM EMPLOYEE
WHERE SALARY >= 3000000;
-- 3. 연봉이 5000만원 이상인 사원들의 사원명, 급여, 연봉, 부서코드 조회
SELECT EMP_NAME, SALARY, SALARY * 12, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY*12 >= 50000000;
-- 실행순서 FROM절 -> WHERE절 -> SELECT절(별칭부여)
-- 4. 직급코드가 'J3'이 아닌 사원들의 사번, 사원명, 직급코드, 퇴사여부 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, ENT_YN
FROM EMPLOYEE
WHERE JOB_CODE != 'J3';

-----------------------------------------------------------------------

/*
    < 논리연산자 >
    여러개의 조건을 엮어서 하나로 제시하고자 할 때
    AND (~이면서, 뿐만아니라 , 그리고) 
    OR (~이거나, 또는)
*/
-- 부서코드가 D9면서 급여가 500만원 이상인 사원들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9' AND SALARY >= 5000000;

-- 급여가 350만원 이상 600만원 이하인 사원들의 사원명, 급여 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000;

-- 부서코드가 D6이거나 급여가 300만원 이상인 사람들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR SALARY >= 3000000;

-- 부서코드가 D9거나 D6 사원들 중 입사일이 99/12/31 보다 이전인 사원명, 부서코드, 입사일 조회
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE < '99/12/31' AND (DEPT_CODE = 'D6' OR DEPT_CODE = 'D9');
-- 같은 논리연산자라고 해도 묶지않고 나열되어있는 경우 AND 먼저 수행

--------------------------------------------------------------------------

/*
    < BETWEEN AND >
    몇 이상 몇 이하인지 범위에 대한 조건을 제시할 때 사용되는 연산자
    [표현법]
    비교대상컬럼 BETWEEN 하한값 AND 상한값
*/
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;

SELECT EMP_NAME, SALARY
FROM EMPLOYEE
--WHERE SALARY < 3500000 OR SALARY > 6000000; -- 가능
--WHERE NOT SALARY BETWEEN 3500000 AND 6000000; -- 가능
WHERE SALARY NOT BETWEEN 3500000 AND 6000000; -- 가능
-- NOT : 논리부정연산자(자바의 ! 같은 존재)
-- 컬럼명 앞에 또는 BETWEEN 앞에 기입 가능

-- 입사일이 '90/01/01/ ~ "01/01/01'
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01' 
    AND DEPT_CODE = 'D9'; -- DATE 타입에도 BETWEEN AND 사용 가능
    
    --------------------------------------------------------

/*
    < LIKE >
    비교하고자 하는 컬럼 값이 내가 제시한 특정패턴에 만족될 경우 조회
    [표현법]
    비교대상컬럼 LIKE '특정패턴'
    
    - 특정패턴 작서시 %, _를 와일드카드로 사용할 수 있다.
    EX) 비교대상컬럼 LIKE '문자%' => 비교대상컬럼값이 해당 문자로 시작될 경우 조회
        비교대상컬럼 LIKE '%문자' =>           "              끝날 경우 조회
        비교대상컬럼 LIKE '%문자%' =>          "             에 해당문자가 '포함'되어 있을 경우 조회
    >> I글자 의미
    EX)비교대상 컬럼 LIKE'_문자' -> _앞에 "한자리"  __앞에 "두자리"
*/

SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%';

-- 이름 중에 하가 포함된 사원들만 조회 (사원명, 주민번호, 전화번호)
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%';

-- 이름 가운데 글자(이름은 3글자)가 하인 사람들의 서명, 전화번호
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_하_';

-- 전화번호의 3번째 자리가 1인 사원들을 조회
SELECT EMP_ID, EMP_NAME, PHONE, EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

-- 이메일 값중에 _ 문자 앞에 3글자인 사원들 조회 (사번, 이름, 이메일)
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
--WHERE EMAIL LIKE '____%'; => 연산불가 4번째 자리의 _를 와일드카드로 인식해버림
WHERE EMAIL LIKE '___!_%' ESCAPE '!';
-- 데이터값으로 취급하고자 하는 문자 앞에 나만의 와일드 카드를 제시하고 ESCAPE를 이용해서 등록해야함

-- 그 외의 사원들을 조회
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL NOT LIKE '___!_%' ESCAPE '!';
-- NOT은 컬럼명 앞 또는 LIKE 앞에 기술

----------------------------------------------------------

/*
    < IS NULL / IS NOT NULL >
    컬럼값에 NULL이 있을 경우 NULL을 비교할 때 사용하는 연산자
*/
-- 보너스를 받지 않는 사원들의 사번, 사원명, 급여, 보너스 조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;

-- 보너스를 받는 (NULL이 아닌) 사원

SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

-- 사수가 없는 사원
SELECT *
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL 
    AND BONUS IS NOT NULL;

-- 1. EMPLOYEE에서 이름이 '연'으로 끝나는 사원들의 사원명, 입사일 조회
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%연';
-- 2. EMPLOYEE에서 전화번호 처음 3자리가 010이 아니거나 전화번호가 등록되어있지 않은 사원들의 사원명, 전화번호 조회
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE IS NULL OR PHONE NOT LIKE '010%' ;
-- 3. EMPLOYEE에서 이름에 '하'가 포함되어있고 급여가 240만원 이상인 사원들의 사원명, 급여 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%' AND SALARY >= 2400000 ;
-- 4. DEPARTMENT에서 해외영업부인 부서들의 부서코드, 부서명 조회 
SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT
WHERE DEPT_ID  BETWEEN 'D5' AND 'D7';
-- 5. 사수가 없고 부서배치도 받지 않은 사원들의 (사원명, 사수(관리자)사번, 부서코드) 조회
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL AND DEPT_CODE IS NULL;
    
-- 6. 연봉(보너스포함연봉아님)이 3000만원 이상이고 보너스를 받지 않는 사원들의 (사번, 사원명, 급여, 보너스) 조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE SALARY*12 >= 30000000 AND BONUS IS NULL;
-- 7. 입사일이 '95/01/01'이상이고 부서배치를 받은 사원들의 (사번, 사원명, 입사일, 부서코드) 조회
SELECT EMP_ID, EMP_NAME, HIRE_DATE, DEPT_CODE
FROM EMPLOYEE
WHERE HIRE_DATE >= '95/01/01' AND DEPT_CODE IS NOT NULL;
-- 8. 급여가 200만원 이상 500만원 이하고 입사일이 '01/01/01'이상이고 보너스를 받지 않는 사원들의 
--    (사번, 사원명, 급여, 입사일, 보너스) 조회
SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE, BONUS
FROM EMPLOYEE
WHERE HIRE_DATE >= '01/01/01' 
        AND SALARY BETWEEN 2000000 AND 5000000 
        AND BONUS IS NULL;
-- 9. 보너스포함연봉이 NULL이 아니고 이름에 '하'가 포함되어있는 사원들의 (사번, 사원명, 급여, 보너스포함연봉)
SELECT EMP_ID, EMP_NAME, SALARY, (SALARY + BONUS * SALARY) * 12 AS "보너스포함 연봉"
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%' AND BONUS IS NOT NULL;

-----------------------------------------------------------------------------------------------------------------

/*
    < IN >
    비교대상컬럼값이 내가 제기한 목록들 중에 일치하는 값이 있는지
    [표현법]
    비교대상컬럼 IN('값1', '값2', ...)
*/
-- 부서코드가 D6이거나 D8이거나 D5인 사원들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
--WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5'; -- 12개
WHERE DEPT_CODE IN ('D6', 'D8', 'D5'); -- 12개

-- 그외의 사원들
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE NOT IN  ('D6', 'D8', 'D5'); -- 9RO

-------------------------------------------------------------------------------------------------------------------

/*
    < 연산자 우선순위 >
    0. () 
    1. 산술연산자 ( *, /, +, - )
    2. 연결연산자 ( || )
    3. 비교연산자
    4. IS NULL / LIKE '특정패턴' / IN
    5. BETWEEN AND
    6. NOT
    7. AND
    8. OR
*/
--------------------------------------------------------------------------------------------------------

/*
    * ORDER BY 절
    SELECT 문 가장 마지막중레 작성하고 실행순서 또한 마지막에 실행
    [표현법]
    SELECT 조회할컬럼, .., 산술연산식 [AS] "별칭" | *
    FROM 조회하고자하는 테이블명
    WHERE 조건식
    ORDER BY 정렬기준의컬럼명 | 별칭 | 컬럼순번 (ASC(DEFAULT) | DESE) [NULLS FIRST | NULLS LAST]
    
    - ASC : 오름차순 정렬 (생략시 기본값)
    -DESC : 내림차순 정렬
    
    - NULLS FIRST : 정렬하고자 하는 컬럼값에 NULL인 데이터를 맨 앞에 조회 (생략시 DESC일때의 기본값)
    - NULLS LAST :                                "                                         맨 뒤에 조회 (생략시 ASC일때의 기본값)
*/

SELECT *
FROM EMPLOYEE
-- ORDER BY BONUS; -- ASC 기본값, NULLS LAST 기본값
-- ORDER BY BONUS DESC; -- DESC일 경우 NULLS FIRST 기본값
-- ORDER BY BONUS DESC NULLS LAST;
ORDER BY BONUS DESC, SALARY ASC; -- 정렬기준 여러개 제시가능(앞에 제시한 커럼값이 동일할 경우 두번째 정렬기준으로 반영)

-- 연봉별 내림차순 정렬
SELECT EMP_NAME, SALARY * 12  "연봉"
FROM EMPLOYEE
-- ORDER BY SALARY * 12 DESC;  -- 산술연산식 가능
--ORDER BY 연봉 DESC; -- 별칭 사용 가능
ORDER BY 2 DESC; -- 컬럼 순번 사용가능

/*
    3. SELECT절
    1. FROM절
    2. WHERE절
    4. ORDER BY절
*/







