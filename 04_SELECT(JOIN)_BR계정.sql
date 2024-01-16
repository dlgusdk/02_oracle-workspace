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