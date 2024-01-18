/*
JOIN
두 개 이상의 테이블에서 데이터를 조회하고자 할 때 사용하는 구문
조회 결과는 하나의 결과물로 나옴

관계형 데이터베이스(RDBMS)는 최소한의 데이터로 각각의 테이블에 따로따로 데이터를 담고있음
(중복을 최소화하기 위해)

->테이블간의 관계를 맺는 방법 == JOIN
테이블간의 연결고리로써 활용할만한 컬럼이 있어야함!


"오라클 전용구문"과 "ANSI 구문" (ANSI ==미국국립표준협회)
                                                    [JOIN 용어 정리]
오라클전용구문                                     |                           ANSI구문
--------------------------------------------------------------------------------------------------------
등가조인                                                  |     내부조인(INNER JOIN)
(EQUAL JOIN)                                        |      자연조인(NATURAL JOIN)
---------------------------------------------------------------------------------------------------------
포괄조인                                                        오른쪽 외부조인(RIGHT OUTER JOIN)
(LEFT OUTER, RIGHT OUTER)           |    왼쪽 외부조인(LEFT OUTER JOIN)
                                                                        전체 외부조인(FULL OUTER JOIN)
----------------------------------------------------------------------------------------------------------
자체 조인(SELF JOIN)
비등가 조인(NON EQUAL JOIN)          |       JOIN ON
----------------------------------------------------------------------------------------------------------


*/

--전체 사원들의 사번, 사원명, 부서코드 , 부서명
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE;
--EMPLOYEE, DEPARTMENT 있는 부서명을 연결
SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT;


---전체 사원들의 사번, 사원명, 직급코드 , 직급명
SELECT EMP_ID, EMP_NAME, JOB_CODE
FROM EMPLOYEE;
--EMPLOYEE, JOB에 있는 직급코드를 연결
SELECT JOB_CODE, JOB_NAME
FROM JOB;

/*
1.등가조인(EQUAL JOIN)
== 내부조인(INNER JOIN)

연결시키는 컬럼의 값이 일치하는 행들만 조인되서 조회 

*/

-->오라클 전용 구문
--FROM절에 조회하고자하는 테이블들 나열 (, 로)
--WHERE절에 매칭시킬 컬럼에 대한 조건제시 
--사번, 사원명, 부서코드, 부서명을 같이 조회 

--1)연결할 두 컬럼명이 다른 경우(DEPT_CODE, DEPT_ID)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT-->23 * 9 207개의 행이 조회되버림*곱집합
WHERE DEPT_CODE = DEPT_ID;  -->DEPT_CODE가 NULL인 사원 2명이 있는데 조회 X 0>DEPT_ID가 NULL인게 없어서 
-->DEPT_ID가 D3, D4 , D7인 부서 3개 도 조회 X -->DEPT_CODE에 없기 때문

--2)연결할 두 컬럼명이 같은 경우(JOB_CODE, JOB_CODEㅡ,EMPLOYEE, JOB에 있는 직급코드를 연결)
---사번, 사원명, 직급코드, 직급명
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE, JOB
WHERE JOB_CODE = JOB_CODE;


--해결방법 1. 테이블명을 이용하는 법
SELECT EMP_ID, EMP_NAME, EMPLOYEE.JOB_CODE, JOB.JOB_NAME
FROM EMPLOYEE, JOB
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE;

--해결방법2. 테이블에 별칭을 활용하는 법
SELECT EMP_ID, EMP_NAME , J.JOB_CODE, JOB_NAME --E, J뭘로 지정해줘도 상관없음
FROM EMPLOYEE "E", JOB "J"  --테이블에 별칭등록, AS불가, 소문자로 이름 지정시 "e"처럼 " " 묶어서 해줘야함. 아니면 자동으로 대문자로 인식해서 오류
WHERE E.JOB_CODE = J.JOB_CODE;

-->ANSI 구문
--FROM 절에 테이블 하나 기술한 후 
-- JOIN절에 같이 조회하고자하는 다른 테이블을 기술하고 뿐만 아니라 매칭시킬 컬럼에 대한 조건도 기술
--JOIN USING, JOIN ON

--1)연결할 두 컬럼명이 같은 경우(오로지 JOIN ON만 사용가능)
---사원명, 부서명(사원들이 어느부서인지 알고자할 때)
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT  ON (DEPT_CODE = DEPT_ID); 

--부서들마다 어떤 사원들이 속해있는지 알고자할 때
SELECT DEPT_TITLE, EMP_NAME
FROM DEPARTMENT
JOIN EMPLOYEE  ON (DEPT_ID = DEPT_CODE); --부서배치 안된 사원 2명 조회 X


--2)연결할 두 컬럼명이 같은 경우
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB ON (JOB_CODE = JOB_CODE);--마케팅부, 국내영업, 해외영업3부 조회 X 

--해결방법 1) 위와 마찮가지로 별칭 만들어서 표기

--해결방법 2. JOIN USING구문 사용(두 컬럼명이 일치할 때만 사용가능)
SELECT EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
/*INNER*/JOIN JOB USING(JOB_CODE);

----- [ 참고사항 ] ------
-- 자연조인 (NATURAL JOIN) : 각 테이블마다 동일한 컬럼이 딱 한 개만 존재할 경우
SELECT EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
NATURAL JOIN JOB;

SELECT EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
NATURAL JOIN JOB;




--========================================================================================
--★(ORACLE)등가, (ANSI)내부조인 중요★

-- 직급명이 대리인 사원들의 사번, 이름, 직급명, 급여 조회
-->> 오라클전용구문
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE
      AND JOB_NAME = '대리';
      
-->> ANSI 구문
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE JOB_NAME = '대리';

------------------------------------- 실습문제 --------------------------------------
-- 1. 인사관리부인 사원들의 사번, 이름, 보너스 조회
-->> ORACLE방식
SELECT EMP_ID, EMP_NAME, BONUS
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID
      AND DEPT_TITLE = '인사관리부';

-->> ANSI방식
SELECT EMP_ID, EMP_NAME, BONUS
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
WHERE DEPT_TITLE = '인사관리부';

--2.  DEPARTMENT와 LOCATION을 참고해서 전체 부서들의 부서코드, 부서명, 지역코드, 지역명 조회
-->> ORACLE방식
SELECT * FROM DEPARTMENT;
SELECT * FROM LOCATION;

SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID, LOCAL_NAME
FROM DEPARTMENT D, LOCATION L
WHERE D.LOCATION_ID = L.LOCAL_CODE;

-->> ANSI방식
SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID, LOCAL_NAME
FROM DEPARTMENT D
JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE;

--3. 보너스를 받는 사원들의 사번, 사원명, 보너스, 부서명 조회 -- 부서가 없는(NULL) 사원이 있음
-->> ORACLE방식
SELECT EMP_ID, EMP_NAME, BONUS, NVL(DEPT_TITLE, '부서없음') "부서명"
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID(+) --> 8명이었지만, 포괄조인을 하게되면 9명으로 잘 조회됨
     AND BONUS IS NOT NULL;

-->> ANSI방식
SELECT EMP_ID, EMP_NAME, BONUS, NVL(DEPT_TITLE, '부서없음') "부서명"
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID --> 기준이되는 EMPLOYEE가 FROM절에있으니 LEFT,
WHERE BONUS IS NOT NULL;

--4. 부서가 총무부가 아닌 사원들의 사원명, 급여 조회 -> 부서가 NULL인 사원이 2명있음.
-->> ORACLE방식
SELECT EMP_NAME, SALARY
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID(+)
     AND DEPT_TITLE != '총무부' ------> 오라클방식은 WHERE절이 여러조건일경우 적용이 안됨 SO, UNION 으로 합함
                  UNION ALL
SELECT EMP_NAME, SALARY
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID(+)
      AND DEPT_TITLE IS NULL;

-->> ANSI방식
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE E 
LEFT JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
WHERE DEPT_TITLE != '총무부'
        OR DEPT_TITLE IS NULL;

------------------------------------------------------------------------------------------------------------------

/*
        2. 포괄 조인 / 외부 조인 (OUTER JOIN)
        JOIN 해서 조회시 일치하지 않는 행도 포함시켜서 조회 가능
        단, 반드시 기준 테이블을 지정해야함 (LEFT / RIGHT)
*/

-- 사원명, 부서명, 급여 (ANSI방식)
SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE
/*INNER*/ JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE;

-- 1) LEFT OUTER JOIN : 두 테이블 중 왼편에 기술된 테이블을 기준으로 JOIN
SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE
LEFT /*OUTER*/ JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE; -- 부서를 배치 받지 않았던 2명의 사원도 같이 조회

-->> 오라클 전용 구문 --> 기준으로 삼고자하는 WHERE절 테이블의 반대편 컬럼 뒤에 (+)
SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+);

-- 전체 부서에 대한 정보를 조회하되 해당 부서에 어떤 사원들이 속해있는지 -> DEPARTMENT 메인 (부서조회가 메인이니까)
-- 부서명, 사원명, 급여 조회
SELECT DEPT_TITLE, EMP_NAME, SALARY
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID; --21행/ 마케팅부(D3), 국내영업부(D4), 해외영업3부(D7) 조회X

--(+)은 WHERE절 기준이되는 컬럼의 [반대컬럼 뒤]에
-- 2) RIGHT [OUTER] 조회 -- FROM ~ JOIN절 기준컬럼쪽에 LEFT, RIGHT
SELECT DEPT_TITLE, EMP_NAME, SALARY
FROM EMPLOYEE
RIGHT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID; -- 24행/

--> 오라클 방식
SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID; --DEPARTMENT가 기준컬럼이니, 반대컬럼인 EMPLOYEE.DEPT_CODE 뒤에 (+) 

-- 3) FULL [OUTER] JOIN => ANSI구문에서 가능 / 오라클전용구문으로 안됨
SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE
FULL JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;

--> 오라클 방식 ( (+) 한테이블만 가능) -> UNION 사용하면 합칠수있음
SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID

UNION

SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+);

--------------------------------------------------------------------------------------------------------------------

/*      3. 
            비등가 조인(NON EQUAL JOIN)
            매칭시킬 컬럼에 대한 조건 작성시 '=' 를 사용하지 않는 조인문
*/

-- 사원명, 급여, 급여등급
SELECT EMP_NAME, SALARY
FROM EMPLOYEE;

SELECT SAL_LEVEL, MIN_SAL, MAX_SAL
FROM SAL_GRADE;

-->오라클 방식
SELECT EMP_NAME, SALARY, SAL_LEVEL
FROM EMPLOYEE, SAL_GRADE
--WHERE SALARY >= MIN_SAL AND SALARY <= MAX_SAL;
WHERE SALARY BETWEEN MIN_SAL AND MAX_SAL;

-->ANSI 방식
SELECT EMP_NAME, SALARY, SAL_LEVEL
FROM EMPLOYEE
JOIN SAL_GRADE ON (SALARY BETWEEN MIN_SAL AND MAX_SAL);

-----------------------------------------------------------------------------

/*
        4. 자체 조인 (SELF JOIN)
        같은 테이블을 다시 한번 조인하는 경우
*/
SELECT * FROM EMPLOYEE;

-- 전체 사원들의 사번, 사원명 => EMPLOYEE
--                      사수사번, 사수명 => EMPLOYEE

-->> 오라클 방식 (SELF JOIN)
SELECT E.EMP_ID "사원 사번", E.EMP_NAME "사원명", E.DEPT_CODE "사원 부서",
              M.EMP_ID "사수 사번", M.EMP_NAME "사수명", M.DEPT_CODE "사수 부서"
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_ID = M.EMP_ID(+);

-->> ANSI 방식 (SELF JOIN + MULTI JOIN)
SELECT E.EMP_ID "사원 사번", E.EMP_NAME "사원명", E.DEPT_CODE "사원 부서", D.DEPT_TITLE "사원 부서명",
              M.EMP_ID "사수 사번", M.EMP_NAME "사수명", M.DEPT_CODE "사수 부서", MD.DEPT_TITLE "사수 부서명"
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON E.MANAGER_ID = M.EMP_ID
LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
LEFT JOIN DEPARTMENT MD ON M.DEPT_CODE = MD.DEPT_ID;

------------------------------------------------------------------------------------------------------------------------

/*
        5. 카테시안 곱 / 교차조인
            모든 테이블 각 행들이 서로서로 매핑되서 조회됨 (곱집합)
            
            => 방대한 데이터 출력 => 과부화의 위험
*/
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT; -- 23*9 => 207행

SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
CROSS JOIN DEPARTMENT; -- 23*9 => 207행

------------------------------------------------------------------------------------------------------------------------

-- 다중 조인 (3개 이상 테이블 가지고 JOIN)

-- 사번, 사원명, 부서명, 직급명
SELECT * FROM  EMPLOYEE; --JOB_CODE / DEPT_CODE
SELECT * FROM  DEPARTMENT; -- DEPT_ID / DEPT_TITLE
SELECT * FROM  JOB; -- JOB_CODE / JOB_NAME

--> 오라클 방식
SELECT DEPT_CODE, EMP_NAME, D.DEPT_TITLE "부서명", J.JOB_NAME "직급명"
FROM EMPLOYEE E, DEPARTMENT D, JOB J
WHERE (E.DEPT_CODE = D.DEPT_ID(+)) 
    AND (E.JOB_CODE = J.JOB_CODE(+));

--> ANSI 방식
SELECT DEPT_CODE, EMP_NAME, D.DEPT_TITLE "부서명", J.JOB_NAME "직급명"
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
LEFT JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);
--LEFT JOIN JOB J USING(JOB_CODE); --> E와 J테이블에만 오직 JOB_CODE가 존재해 USING 사용가능

-- 사번, 사원명, 부서명, 직급명, 지역명, 국가명(NATIONAL)
--> 오라클 방식
SELECT EMP_ID "사번", EMP_NAME "사원명", D.DEPT_TITLE "부서명", J.JOB_NAME "직급명", L.LOCAL_NAME "지역명", N.NATIONAL_NAME "국가명", SAL_LEVEL "급여등급"
FROM EMPLOYEE E, DEPARTMENT D, JOB J, LOCATION L, NATIONAL N, SAL_GRADE S
WHERE E.DEPT_CODE = D.DEPT_ID(+)
     AND E.JOB_CODE = J.JOB_CODE(+)
     AND D.LOCATION_ID = L.LOCAL_CODE(+)
     AND L.NATIONAL_CODE = N.NATIONAL_CODE(+)
     AND E.SALARY BETWEEN S.MIN_SAL AND S.MAX_SAL;
    
--> ANSI 방식    ( JOIN절 순서 굉장히 중요 )
SELECT EMP_ID "사번", EMP_NAME "사원명", D.DEPT_TITLE "부서명", J.JOB_NAME "직급명", L.LOCAL_NAME "지역명", N.NATIONAL_NAME "국가명", SAL_LEVEL "급여등급"
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON (D.DEPT_ID = E.DEPT_CODE)
JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE) --> 바로 상단에 E가 메인이 되어 D와 비교했기때문에, LEFT 생략가능
LEFT JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE) --> 비교 메인대상이 E가 아니기때문에 다시 LEFT 삽입하여 구분
LEFT JOIN NATIONAL N ON (L.NATIONAL_CODE = N.NATIONAL_CODE)
JOIN SAL_GRADE S ON (SALARY BETWEEN MIN_SAL AND MAX_SAL); --> 비교 메인대상이 없기때문에 OUTER 생략가능


