/*
GROUP BY 절
그룹을 묶어줄 기준을 제시할 수 있는 구문

*/
SELECT SUM(SALARY)
FROM EMPLOYEE; --전체사원을 하나의 그룹

--각 부서별 총 급여합
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

--각 부서별 총 사원수, 급여합, 평균급여
SELECT DEPT_CODE, COUNT(*) "총 사원수", SUM(SALARY) "급여합", AVG(SALARY) "평균급여"
FROM EMPLOYEE
--WHERE SUBSTR(EMP_NO, 8, 1) IN( '1', '3')
GROUP BY DEPT_CODE;

--각 직급별 총 사원수, 보너스 받는 사원수, 급여합, 평균급여, 최저급여, 최고급여
SELECT JOB_CODE
            , COUNT(*) "총 사원수"
            ,  COUNT(BONUS) "보너스 받는 사원수"
            , SUM(SALARY) "급여합"
            , CEIL(AVG(SALARY)) "평균급여"
            , MIN(SALARY)"최저급여"
            , MAX(SALARY)"최고급여"
FROM EMPLOYEE
GROUP BY JOB_CODE;

--GROUP BY 절에 함수식 기술 가능
--성별별
SELECT DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남', '2', '여')"성별", COUNT(*)
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO, 8, 1);

--GROUP BY 절에 컬럼 여러개쓰기
SELECT DEPT_CODE, JOB_CODE, COUNT(*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE-- 부서랑 직급이 같은 애들끼리 그룹으로 묶임
ORDER BY DEPT_CODE;


---------------------------------------
/*
HAVING
그룹에 대한 조건을 제시할 때 사용되는 구문(주로 그룹함수식을 가지고 조건식을 제시할 때)
*/
--각 부서별 평균 급여 조회
SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

--부서별 평균 급여가 300만원 이상인 부서들만 조회 
SELECT DEPT_CODE, ROUND(AVG(SALARY)) --4
FROM EMPLOYEE --1
--WHERE AVG(SALARY) >= 3000000  --그룹함수 가지고 WHERE에 조건제시하면 오류발생
GROUP BY DEPT_CODE --2
HAVING AVG(SALARY) >= 3000000 ; --3


--직급별 총급여합(단, 급여합이 1000만원 이상이 직급만 조회)
SELECT JOB_CODE, SUM(SALARY) 
FROM EMPLOYEE 
GROUP BY JOB_CODE 
HAVING SUM(SALARY) >= 10000000 ; 

--부서별 보너스를 받는 사원이 없는 부서만 조회
SELECT DEPT_CODE , COUNT(BONUS)
FROM EMPLOYEE 
WHERE SUBSTR(EMP_NO, 8, 1) IN ('1', '3') --남자인 사원만(그룹으로 묶이기 전에 조건검사가 수행되어야함)
GROUP BY DEPT_CODE
HAVING  COUNT(BONUS) = 0
        OR DEPT_CODE = 'D9'; --그룹함수식 또는 GROUP BY절에 제시한 컬럼가지고 

-----------------------------------------------------------------------------------------------

/*
<SELECT문 실행순서>

SELECT * |조회하고자하는 컬럼 AS(생략가능) "별칭 |산술식 "별칭"| 함수식 --5
FORM 조회하고자하는 테이블명 --1
WHERE 조건식 (연산자들 가지고 기술)  --2
GROUP BY 그룹기준으로 삼을 컬럼 | 함수식, 컬럼, ...  --3
HAVING 조건식(그룹함수식을 가지고 기술) --4
ORDER BY 컬럼|별칭|컬럼순번 [ASC|DASC]  [NULLS FIRST|NULLS LAST ], 새로운 정렬 기준...    --*(생략가능, 생략하면 오름차순 DEFAULT) --6
*/


--후임을 3명 이상 가지고 있는 사원
SELECT MANAGER_ID, COUNT(*)
FROM EMPLOYEE
GROUP BY MANAGER_ID
HAVING COUNT(*) >= 3
        AND MANAGER_ID IS NOT NULL;

--급여가 500만원 이상 있는 경우 고급, 350만 이상일 경우 중급, 그 외에는 초급
--등급별 사원수 조회

SELECT  CASE  WHEN SALARY >= 5000000 THEN '고급'
                 WHEN SALARY >= 3500000 THEN '중급'
                 ELSE '초급'
              END AS "등급", COUNT(*) "사원수"
FROM EMPLOYEE
GROUP BY CASE  WHEN SALARY >= 5000000 THEN '고급'
                 WHEN SALARY >= 3500000 THEN '중급'
                 ELSE '초급'
              END;

--지역별 부서수
SELECT LOCATION_ID , COUNT(*)
FROM DEPARTMENT
GROUP BY LOCATION_ID;

---------------------------------------------------

/*
<집합 연산자 ==SET OPERATION

여러개의 쿼리문을 가지고 하나의 쿼리문으로 만드는 연산자
*/

   -- UNION : 합집합 (여러개 쿼리문 수행한 결과값을 더한 후 중복되는 값은 한번만 더해지도록)
-- INTERSECT : 교집합 (여러개 쿼리문 수행한 결과값의 중복된 결과값)
   -- UNION ALL : 합집합 + 교집합(중복값이 여러번 표현될 수 있음)
    -- MINUS : 차집합 (선행 쿼리 결과값에 후행 쿼리 결과값을 뺀 나머지)


--급역가 500만 이상 ->고급
SELECT '고급', COUNT(*)
FROM EMPLOYEE
WHERE SALARY >= 5000000
UNION 
--급여가 350만 이상 500만 미만 ->중급
SELECT '중급', COUNT(*)
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY < 5000000
UNION
--급여가 350만 이상 500만 미만 ->초급
SELECT '초급', COUNT(*)
FROM EMPLOYEE
WHERE SALARY < 3500000;

--부서코드가 D5인 사원 또는 급여가 300만원 초과인 사원조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE =  'D5'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;
----위와 밑은 같음
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE =  'D5' OR SALARY > 3000000;

--2.INTERSECT(교집합)
--부서코드가 D5이면서 급여까지도 300만원 초과인 사원조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE =  'D5'
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE =  'D5' 
        AND SALARY > 3000000;
        
        
--3. UNION ALL 여러개의 쿼리 결과를 무조건 다 더해서 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE =  'D5'
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
ORDER BY EMP_NAME;

--4.MINUS
--부서코드가 D5인 사원들 중 급여가 300만원 초과인 사원들은 제외해서 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE =  'D5'
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE =  'D5' AND SALARY > 3000000;
