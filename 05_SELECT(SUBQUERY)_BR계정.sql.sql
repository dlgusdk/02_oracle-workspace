/*
서브쿼리
하나의 SQL문 안에 포함된 또다른 SELECT문
메인 SQL문을 위해 보조 역할을 하는 쿼리문

*/

--간단 서브쿼리
--노옹철 사원과 같은 부서에 속한 사원들조회
--1)노옹철 사원의 부서코드 조회
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME =  '노옹철'; --D9

--2)부서코드가 D9인 사원들 조회 
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--서브쿼리 적용
SELECT EMP_NAME 
FROM EMPLOYEE
WHERE DEPT_CODE = /*노옹철 사원의 부서코드*/(SELECT DEPT_CODE 
                                                                                            FROM EMPLOYEE 
                                                                                            WHERE EMP_NAME = '노옹철');
                                                                                            
    
--전사원의 평균급여보다 더 많이 받는 사원들의 사번, 이름, 직급코드, 급여
--1)전체 사원의 평균 급여 조회
--2)SALARY 컬럼값이 1)과정으로 조회된 결과값보다 더 큰 사원

SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > /*전체사원의 평균급여*/(SELECT AVG(SALARY)
                                                                                FROM EMPLOYEE);
                                                                                
              
              
                                                                                
/*
서브쿼리 종류 (서브쿼리 수행 결과값이 몇 행 몇일이냐에 따라서 분류됨)
-단일행 [단일행] 서브쿼리 : 서브쿼리 수행 결과값이 오로지 1개일때
-다중행 서브쿼리 : 서브쿼리 수행 결과값이 여러행일 때 (컬럼은 한개)
-다중열 서브쿼리 : 서브쿼리 수행 결과값이 한 행이지만 컬럼이 여러개일 때 
-다중행 다중일 서브쿼리 : 서브쿼리 수행 결과값이 여러행 여러 컬럼일 때 

*/

/*
1.단일행 서브쿼리(SINNGLE ROW SUBQUERY)
결과값이 오로지 1개이기 떄문에 일반 비교연산자 사용가능(=  =!  ><  ...)

*/

--1)전 직원의 평균급여보다 급여를 더 적게 받는 사원들의 사원명, 직급코드, 급여
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY <  /*전직원의 평균 급여*/(SELECT AVG(SALARY)
                                                                            FROM EMPLOYEE)  --단일행 서브쿼리
ORDER BY SALARY ASC;


--2)최저급여를 받는 사원들 사번, 이름, 급여, 입사일 조회
SELECT EMP_NAME, JOB_CODE, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY = /*최저급여*/ (SELECT MIN(SALARY) 
                                                            FROM EMPLOYEE);
                                                            



--============================오류 
--3)노옹철 사원의 급여보다 더 많이 받는 사원들의 사번, 이름, 부서코드, 급여
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE SALARY > (SELECT SALARY
                                    FROM EMPLOYEE  
                                    WHERE EMP_NAME = '노옹철')  AND DEPT_CODE - DEPT_ID(+);

-->ANSI
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTNENT ON (DEPT_CODE = DEPT_ID)
WHERE SALARY > (SELECT SALARY
                                    FROM EMPLOYEE  
                                    WHERE EMP_NAME = '노옹철');
--===============================

--4)전지연 사원과 같은 부서원들의 사번, 사원명, 전화번호, 입사일, 직급명 조회
--단 전지연은 제외


--ANSI
SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE, JOB_NAME
FROM EMPLOYEE E
LEFT JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
WHERE DEPT_CODE = (SELECT DEPT_CODE
                                             FROM EMPLOYEE  
                                             WHERE EMP_NAME = '전지연')
           AND EMP_NAME  <> '전지연';
                                             
--오라클
SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE, JOB_NAME
FROM EMPLOYEE E, JOB J 
WHERE DEPT_CODE = (SELECT DEPT_CODE
                                             FROM EMPLOYEE  
                                             WHERE EMP_NAME = '전지연') 
            AND E.JOB_CODE = J.JOB_CODE(+) 
            AND EMP_NAME  <> '전지연';
            

--5)사수가 선동일인 사원들의 사번, 이름 급여

SELECT EMP_ID,EMP_NAME, SALARY
FROM EMPLOYEE 
WHERE  MANAGER_ID = (SELECT EMP_ID
                                                FROM EMPLOYEE  
                                                WHERE EMP_NAME = '선동일');
                                          
                                
--===========================다시
--6)부서별 급여합이 가장 큰 부서의 부서코드, 급여합 조회
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE 
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = /*부서별 급여합 중 가장 큰 급여합*/ (SELECT MAX(SUM(SALARY)) 
                                                                                                                FROM EMPLOYEE 
                                                                                                                GROUP BY DEPT_CODE);
                                                                                                                
-----------------------------------------------------               

/*
다중행 서브쿼리 (MULTI ROW SUBQUERY)
서브쿼리 수행 결과값이 여러개일 경우

일반 비교연산자 사용 X

-IN 서브쿼리:여러개의 결과값 중에서 한개라도 일치하는 값이 있으면 조회
IN(값, 값, 값...)  값들이 =을 대체함

-> >ANY 서브쿼리(서브쿼리 값중에 한개라도 클경우 조회)(가장 작은 값보다 클 경우 조회)(OR의 의미와 같음)
-> <ANY 서브쿼리(서브쿼리 값중에 한개라도 작을 경우 조회)(가장 작은 값보다 작을 경우 조회)

비교대상컬럼 > ANY (값1, 값2...)
->비교대상컬럼 > 값1 OR 비교대상컬럼 > 값2 ... 하나라도 값이 큰게 있다면 조회

-> > ALL 서브쿼리(서브쿼리의 모든 값보다 작다면 조회)(값이 모두 작으면 조회)(AND의 의미와 같음)
-> < ALL 서브쿼리(서브쿼리의 모든 값이 크다면 조회)

비교대상컬럼 > ALL (값1, 값2...)
->비교대상컬럼 > 값1 AND 비교대상컬럼 > 값2 ... 모든 값과 비교해서 비교대상컬럼의 값이 크다면 조회, 하나라도 작다면 조회X


*/

--1)유재식 또는 윤은해 사원과 같은 직급인 사원들의 사번, 사원명, 직급코드, 급여 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN /*유재식 또는 윤은해의 직급코드*/ (SELECT JOB_CODE 
                                                                                                        FROM EMPLOYEE 
                                                                                                        WHERE EMP_NAME = '유재식' OR EMP_NAME = '윤은해' );
                                                                                                        --EMP_NAME IN( '유재식' , '윤은해') 
--단일행은 결과가 한개이므로 =으로 비교가 가능하지만 다중행은 결과값이 여러개이므로 =으로 하면 오류. IN으로 여러값 비교를 해줘야함                                                                                                
        
 SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE = ANY /*유재식 또는 윤은해의 직급코드*/ (SELECT JOB_CODE 
                                                                                                        FROM EMPLOYEE 
                                                                                                        WHERE EMP_NAME = '유재식' OR EMP_NAME = '윤은해' );
--여러개의 결과값 중에 하나라도 맞는게 있다면 조회하겠다 ANY


SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE = ALL /*유재식 또는 윤은해의 직급코드*/ (SELECT JOB_CODE 
                                                                                                        FROM EMPLOYEE 
                                                                                                        WHERE EMP_NAME = '유재식' OR EMP_NAME = '윤은해' );
 --여러개의 결과값이 비교칼럼 JOB_CODE과  모두 맞다면 조회하겠다 ALL ->모두 맞지않으므로 지금은 출력 X
 
 
 --2)부서가 D9인 사람들이 사수인 사원들의 사번, 이름, 사수사번
SELECT EMP_ID,EMP_NAME, MANAGER_ID
FROM EMPLOYEE 
WHERE MANAGER_ID IN (SELECT EMP_ID 
                                              FROM EMPLOYEE 
                                              WHERE DEPT_CODE= 'D9');
                       
--사원>대리>과장>차장>부장                       
--3)차장직급이지만 부장들 보다 급여를 많이 받는 사원의 사번, 이름, 직급명
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE 
JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '차장'
        AND SALARY > ALL /*모든 부장들의 급여*/(SELECT SALARY    --MAX를 쓰면 단일행서브쿼리로 바꿀 수 있음
                                                                                      FROM  EMPLOYEE 
                                                                                     JOIN JOB USING (JOB_CODE)
                                                                                     WHERE JOB_NAME = '부장');
                                                                                     
---------------------------------------------------------------------

/*
(단일행)다중열 서브쿼리 

*/

--2) 하이유 사원과 같은 부서이면서 같은 직급인 사원조회
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_CODE =/*하이유 사원의 부서코드*/ (SELECT DEPT_CODE
                                                                                            FROM EMPLOYEE
                                                                                            WHERE EMP_NAME = '하이유')  --단일행 서브쿼리
        AND JOB_CODE =/*하이유와 같은 직급*/(SELECT JOB_CODE
                                                                                    FROM EMPLOYEE
                                                                                     WHERE EMP_NAME = '하이유');  --단일행 서브쿼리;
                                                                                     
     --> 다중일 서브쿼리
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE ( DEPT_CODE, JOB_CODE) = /*하이유의 부서 직급 코드*/  (SELECT DEPT_CODE, JOB_CODE
                                                                                                                            FROM EMPLOYEE
                                                                                                                            WHERE EMP_NAME = '하이유');   
                                                                                                                            
--2)박나라 사원과 같은 직급, 같은 사수를 가지고있는사원들의 사번, 이름, 직급코드 , 사수사번 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, MANAGER_ID
FROM EMPLOYEE
WHERE (JOB_CODE,  MANAGER_ID) = (SELECT JOB_CODE, MANAGER_ID
                                                                          FROM EMPLOYEE
                                                                          WHERE EMP_NAME = '박나라'); 
                                                                          
                                                                          

--================================================

/*
4.다중행 다중열 서브쿼리
*/

--1)각 직급별 최소급여를 받는 사원 조회(사번, 사원명, 직급코드, 급여)
-->각 직급별 최소급여
SELECT JOB_CODE, MIN(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE;

SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
GROUP BY JOB_CODE = 'J2' AND SALARY = 1800000
                OR JOB_CODE = 'J2' AND SALARY = 1380000
                OR JOB_CODE = 'J2' AND SALARY = 2800000;
                
 SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (SELECT JOB_CODE, MIN(SALARY)
                                                                FROM EMPLOYEE
                                                                GROUP BY JOB_CODE);

--2)부서별 최고급여를 받는 사원들의 사번, 사원명, 부서코드, 급여

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE (NVL(DEPT_CODE, '없음'), SALARY) IN (SELECT NVL(DEPT_CODE, '없음'), MAX(SALARY) --NULL인 값도 조회 SELECT절에는 SVL안썼기 때문에 없음이 아닌 NULL로 쓰여짐.
                                                                FROM EMPLOYEE
                                                                GROUP BY DEPT_CODE);
   
 --부서별 최고급여를 받는 사원들의 사번, 사원명, 부서코드, 급여를 조회하고 급여가 높은 순대로 5명 순위를 매기기, 만약 연봉이 같다면 같은 순위가 매겨지도록 (부서없는 사람 포함)                                                             
SELECT E.*
FROM (
            SELECT EMP_ID, DEPT_CODE, EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC)"연봉순위"
            FROM EMPLOYEE
            WHERE (NVL(DEPT_CODE, '없음'), SALARY) IN (SELECT NVL(DEPT_CODE, '없음'), MAX(SALARY)
                                                                                                    FROM EMPLOYEE
                                                                                                    GROUP BY DEPT_CODE
                                                                                                    )
            ) E
WHERE  연봉순위 <= 5;                                       

----------------------------------------------------------------------------------

/*
5.인라인 뷰 (INLINE -VIEW)
FROM 절에 서브쿼리를 작성한 것
서브쿼리를 수행한 결과값들을 마치 하나의 테이블처럼 사용하겠다
*/

--사번, 이름, 보너스포함연봉(별칭부여), 부서코드 조회 
--보너스 포함연봉이 3000만원 이상인 사원만 조회
SELECT EMP_ID, EMP_NAME, (SALARY + (SALARY * NVL(BONUS, 0)))* 12 "연봉", DEPT_CODE
FROM EMPLOYEE
WHERE  (SALARY + (SALARY * NVL(BONUS, 0)))* 12  >=  30000000;

--다시 연봉구문을 안쓰는 방식(인라인뷰)
SELECT EMP_ID, 연봉
FROM (
                SELECT EMP_ID, EMP_NAME, (SALARY + (SALARY * NVL(BONUS, 0)))* 12 "연봉", DEPT_CODE
                FROM EMPLOYEE
            ) -- 이 결과값을 하나의 테이블처럼  사용하겠다
WHERE  연봉 >= 30000000;


--!!인라인뷰를 무조건 사용해야하는 경우!! -> TOP-N분석


--사원들 중 급여가 가장 높은 상위 5명만 조회
--ROWNUM 오라클에서 제공하는 컬럼, 조회된 순서대로 1부터 순번을 부여
SELECT EMP_NAME, SALARY , ROWNUM
FROM EMPLOYEE
WHERE ROWNUM <= 5
ORDER BY SALARY DESC;

--급여가 가장 작은 상위 5명
SELECT EMP_NAME, SALARY, ROWNUM  --ROWNUM,* 을 같이 쓸 수 없음. 사용하려면 테이블에 별칭 (E)를 지정해서 사용해야함
-- ROWNUM, E.* 
FROM   (
               SELECT EMP_NAME, SALARY --다른 데이터도 조회하고 싶으면 여기에 작성해야함, 또는 *사용
                FROM EMPLOYEE  
               ORDER BY SALARY ASC
               ) E
WHERE ROWNUM <= 5;

--최근 입사한 입사자 3명 조회(사원명, 급여, 입사일)
SELECT ROWNUM, E.*
FROM   (
               SELECT EMP_NAME, HIRE_DATE , SALARY
                FROM EMPLOYEE  
               ORDER BY HIRE_DATE DESC
               ) E
WHERE ROWNUM <= 3;



--각 부서별 평균급여가 높은 상위 3개의 부서 조회(부서코드, 평균급여(정수형태로)
SELECT *
FROM   (
               SELECT DEPT_TITLE "부서", ROUND(AVG(SALARY)) "평균급여"-- 만약 안에 AVG(SALARY)라 쓰고 
               --바깥 SELECT 문에 ROUND(AVG(SALARY))라 쓸 때는 ROUND("AVG(SALARY)")라고 표시해야함. ""안하면 SARARY를 계산하려함. 안쪽을 불러오는게 아니라
                FROM EMPLOYEE E
                LEFT JOIN  DEPARTMENT D ON (D.DEPT_ID = E.DEPT_CODE)
                GROUP BY DEPT_TITLE
                ORDER BY 2 DESC --  ORDER BY ROUND(AVG(SALARY)) DESC, 2번째 열인 ROUND(AVG(SALARY)) "평균급여"로 내림차순
               ) 
WHERE ROWNUM <= 3;

-----------------------------------------------------------------

/*
*순위 매기는 함수
(WINDOW FUNTION)

-RANK() OVER(정렬기준)   : EX)공동 1위가 3명일때 그 다음 순위를 4위로
-DENSE_RANK() OVER(정렬기준) :EX)동일한 순위가 몇 명이든 간에 그 다음 순위를 1씩 증가 1위, 2위...
--정렬기준 자리에 ORDER BY를 넣을 수 있음

*/

--급여가 높은 순대로 순위를 매기기
SELECT EMP_NAME, SALARY , RANK() OVER(ORDER BY SALARY DESC)"순위"
FROM EMPLOYEE;

--상위 5명만 조회
SELECT EMP_NAME, SALARY , RANK() OVER(ORDER BY SALARY DESC)"순위"
FROM EMPLOYEE;
--WHERE RANK() OVER(ORDER BY SALARY DESC) <=5;   --오류 WHERE절에는 쓸 수 없음
                                       
                                       
                                       -->인라인뷰로 해야함                                 
SELECT E.*
FROM   (
               SELECT EMP_NAME, SALARY , RANK() OVER(ORDER BY SALARY DESC) "순위"
                FROM EMPLOYEE
               ) E
WHERE 순위 <= 5;

-----------------------------------------------------------------
/*
*상관서브쿼리
일반적인 서브쿼리 방식은 서브쿼리가 만들어낸 고정된 결과값을 가지고 메인쿼리가 가져다쓰는 형식
상관 서브쿼리는 반대로 메인쿼리에 만들어진 값을 가지고 서브쿼리에서 이용함

*/

--1)급여를 본인 직급별 평균급여보다 더 많이 받는 사원의 이름,. 직급코드, 급여 조회
SELECT E.EMP_NAME, E.JOB_CODE, E.SALARY
FROM EMPLOYEE E
WHERE SALARY >/*매행조회되는 사원의 직급(E.JOB_CODE)의 평균급여*/ (
                                                                                                                                            SELECT AVG(SALARY)
                                                                                                                                            FROM EMPLOYEE
                                                                                                                                            WHERE JOB_CODE = E.JOB_CODE
                                                                                                                                            );

--보너스값을 본인 부서의 평균 보너스보다 더 많이 받는 사원의 이름, 부서코드, 급여 , 보너스 조회
SELECT E.EMP_NAME, E.DEPT_CODE, E.SALARY
FROM EMPLOYEE E
WHERE BONUS > (
                                      SELECT AVG(BONUS) "평균급여"
                                      FROM EMPLOYEE
                                      WHERE DEPT_CODE = E.DEPT_CODE
                                      --E.DEPT_CODE 는 메인쿼리의 한행 한행 스캔할 때마다 매번 값이 달라짐. DEPT_CODE는 그저 비교값
                                      );
            
--3.전체사원의 사번, 이름, 사수사번, 사수명 조회
--셀프조인 
SELECT E.EMP_ID, E.EMP_NAME, E.MANAGER_ID, M.EMP_NAME
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON (E.MANAGER_ID = M.EMP_ID)
WHERE ;
--------------------------------------------------------------------------------------------------선동일만 나오게 또는 선동일만 제외

--서브쿼리
SELECT E.EMP_ID, E.EMP_NAME, E.MANAGER_ID, 
/* 매행 조회되는 MANAGER_ID값을 번호로 가지고 있는 사원명*/
           NVL ((
            SELECT EMP_NAME
            FROM EMPLOYEE
            WHERE EMP_ID = MANAGER_ID
            ) , '없음')"사수명"
FROM EMPLOYEE E;


--4) 전 사원의 사번, 이름 , 직급코드, 직급명 조회
--JOIN ANSI
SELECT EMP_ID"사번", EMP_NAME"이름", JOB_CODE"직급코드", JOB_NAME"직급명"
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_CODE);

--서브쿼리
SELECT *
FROM ( 
               SELECT EMP_ID"사번", EMP_NAME"이름", JOB_CODE"직급코드", JOB_NAME"직급명"
                 FROM EMPLOYEE
                LEFT JOIN JOB USING (JOB_CODE)
                );

--서브쿼리 2
SELECT  EMP_ID"사번", EMP_NAME"이름", JOB_CODE"직급코드", 
                ( SELECT JOB_NAME"직급명"
                FROM JOB
                WHERE JOB_CODE = E.JOB_CODE)
FROM EMPLOYEE E;


--전 사원 다 조회,  전 사원의 사번, 이름, 부서코드, 해당부서의 부서원 수 
SELECT  EMP_ID"사번", EMP_NAME"이름", DEPT_CODE"부서코드",
            (
            SELECT COUNT(*)
            FROM EMPLOYEE  
            WHERE NVL(DEPT_CODE, 'X') = NVL(E.DEPT_CODE, 'X') 
              ) "부서원 수"
FROM EMPLOYEE E;
                                                   
------_________---------------------위 셀프조인 다시 보기 이론부터



--스칼라서브쿼리 : 상관서브쿼리이면서 결과값이 매번 1개 
--                     특징: 서브쿼리의 수행횟수를 최소화하기 위해 
            --          입력값과 출력값을 내부캐시라는 공간에 저장함
            --            입력값을 캐시에서 찾아보고 있으면 출력값을 반환하고 없으면 서브쿼리의 SELECT문이 실행됨
                                                                                                                        
