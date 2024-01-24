/*

        < PL/SQL >
        PROCEDURE LANGUAGE EXTENSION TO SQL
        
        SQL문 내에서 변수의 정의, 조건처리(IF), 반복처리(LOOP, FOR, WHILE) 등을 지원하여
        SQL문의 기능을 확장한 개념
        다수의 SQL문을 한번에 실행 가능 (BLOCK구조)
        
        * PL/SQL 구조
        - 선언부 DECLARE SECTION : DECLARE로 시작, 변수나 상수를 선언 및 초기화하는 부분
        - 실행부 EXECUTABLE SECTION : BEGIN으로 시작, SQL문 또는 제어문(조건문,반복문)등의 로직을 작성하는 부분
        - 예외처리부 EXCEPTION SECTION : EXCEPTION으로 시작, 예외발생 시 해결하기 위한 구문을 미리 작성해놓는 영역
*/

---간단하게 화면에 HELLO ORACLE출력


--화면에 내용을 출력하고자할 때 ERVEROUTPUT ON으로 켜야함
SET SERVEROUTPUT ON;

BEGIN 
--system.out.print ==
    DBMS_OUTPUT.PUT_LINE('HELLO ORACLE');
    END;
/--지우기

-----------------------------------------------

/*--1. DECLARE선언부
변수 및 상수 선언하는 공간(선언과 동시에 초기화도 가능)
단, 타입을 지정해야함(일반타입변수, 래퍼런스타입변수, ROW타입변수)

1_1)일반타입 변수 선언 및 초기화
    변수명 [CONSTRANT] 자료형 =  [:=값];

*/

DECLARE
    EID NUMBER;
    ENAME VARCHAR2(20);
    ACADEMY CONSTANT VARCHAR2(30) := '구디아카데미';
BEGIN
      --  EID := 800;
   --     ENAME := '홍길동';
        
        EID := &번호;
        ENAME := '&이름';
        
        DBMS_OUTPUT.PUT_LINE('EID: ' || EID);
         DBMS_OUTPUT.PUT_LINE('ENAME: ' || ENAME);
        DBMS_OUTPUT.PUT_LINE('ACADEMY: ' || ACADEMY);

END;
/


/*
1-2) 레퍼런스 타입 변수 선언 및 초기화
    변수명 테이블명.컬럼명 %TYPE; (해당 테이블의 해당 컬럼 타입으로 맞춰주겠다)
    
*/

DECLARE
        EID EMPLOYEE.EMP_ID%TYPE;
        ENAME EMPLOYEE.EMP_NAME%TYPE;
        SAL EMPLOYEE.SALARY&TYPE;
BEGIN
    EID := '300';
    ENAME := '홍길동';
    --SAL := 1000000;
    
    --200번 사원의 사번, 사원명, 급여 조회해서 각 변수에 대입 
    SELECT EMP_ID, EMP_NAME, SALARY
        INTO EID, ENAME, SAL
        FROM EMPLOYEE
         WHERE EMP_ID = '&조회할사번 ';

        DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
         DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
        DBMS_OUTPUT.PUT_LINE('SAL : ' || SAL);

END;
/


------------실습
--레퍼런스변수 EID, ENAME, JCODE, DTITLE 선언
--자료형은 EMPLOYEE(EMP_ID, EMP_NAM,JOB_CODE, SALARY)
--DEPARTTENT(DEPT_TITLE)참조
--사용자가 입력한 사번에 해당되는 사원을 조회해서 각 변수에 대입하고 출력


DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    JCODE EMPLOYEE.JOB_CODE%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY, DEPT_TITLE
    INTO EID, ENAME, JCODE, SAL, DTITLE
    FROM EMPLOYEE E
    JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
    WHERE EMP_ID = '&조회할사번';
    
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('JCODE : ' || JCODE);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || SAL);
    DBMS_OUTPUT.PUT_LINE('DTITLE : ' || DTITLE);
END;
/


/*1-3)ROW타입변수
 테이블의 한 행에 대한 모든 칼럼값을 한꺼번에 담을 수 있는 변수 
 변수명 테이블명 %ROWTYPE;*/
 
DECLARE
    E EMPLOYEE%ROWTYPE;
BEGIN 
    SELECT *
    INTO E
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    
    DBMS_OUTPUT.PUT_LINE('사원명 : ' || E.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || E.SALARY || '원');
    DBMS_OUTPUT.PUT_LINE('보너스 : ' || NVL((E.BONUS),0));
END;
/

-----------------------------------------
/*2.BEGIN 실행부
<조건문>
1)IF조건식 THEN 실행내용 END IF;(단일 IF문)

*/

--특정 사원의 사번, 이름, 급여 , 보너스율(%)출력
--단, 보너스를 받지않는 사원을 보너스율 출력 전 보너스를 지급받지않는 사원입니다 출력

DECLARE
     EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    JCODE EMPLOYEE.JOB_CODE%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
    BONUS EMPLOYEE.BONUS%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, JCODE, SALARY,  NVL(BONUS, 0)
    INTO EID, ENAME, JCODE, SALARY, BONUS
     FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    
    DBMS_OUTPUT.PUT_LINE('사번 : ' || EID);
    DBMS_OUTPUT.PUT_LINE('사원명 : ' || ENAME);
     DBMS_OUTPUT.PUT_LINE('급여 : ' || SALARY || '원');

    IF BONUS = 0
        THEN DBMS_OUTPUT.PUT_LINE('보너스를 지급받지 않는 사원입니다.');
    END IF;
    
          DBMS_OUTPUT.PUT_LINE('보너스율 : ' || BONUS*100|| '%');
END;
/

---2)IF조건식 THEN 실행내용 ELSE 실행내용 END IF;(IF-ELSE);

DECLARE
     EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    JCODE EMPLOYEE.JOB_CODE%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
    BONUS EMPLOYEE.BONUS%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, JCODE, SALARY,  NVL(BONUS, 0)
    INTO EID, ENAME, JCODE, SALARY, BONUS
     FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    
    DBMS_OUTPUT.PUT_LINE('사번 : ' || EID);
    DBMS_OUTPUT.PUT_LINE('사원명 : ' || ENAME);
     DBMS_OUTPUT.PUT_LINE('급여 : ' || SALARY || '원');

    IF BONUS = 0
        THEN DBMS_OUTPUT.PUT_LINE('보너스를 지급받지 않는 사원입니다.');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('보너스율 : ' || BONUS*100|| '%');
    END IF;
    
END;
/


--특정사원의 사번, 이름, 부서명, 근무국가코드 조회 대입 LOCATION
--국내팀인지 해외팀인지 담을 소속 변수명 TEAM VACHAR2(10)
--근무국가코드 KO일경우 ->TEAM에 국내팀 대입 아니면 해외팀대입

DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    JCODE EMPLOYEE.JOB_CODE%TYPE;
    DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
    NCODE LOCATION.NATIONAL_CODE%TYPE;
    TEAM VARCHAR2(10);
BEGIN
    -- SELECT 문으로 데이터 조회
    SELECT EMP_ID, EMP_NAME, JOB_CODE, DEPT_TITLE, NATIONAL_CODE
    INTO EID, ENAME, JCODE, DTITLE, NCODE
    FROM EMPLOYEE 
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    LEFT JOIN LOCATION ON (LOCAL_CODE = LOCATION_ID)
    WHERE EMP_ID = '&사번';

    -- NATIONAL_CODE에 따라 팀 구분
    IF NCODE = 'KO' THEN
        TEAM := '국내팀';
    ELSE 
        TEAM := '해외팀';
    END IF;

    -- 결과 출력
    DBMS_OUTPUT.PUT_LINE(EID || ', ' || ENAME || ', ' || JCODE || ', ' || DTITLE || ', ' || NCODE || ', ' || TEAM);

END;
/


/*3)IF 조건식1 THEN 실행내용;
        ELSIF 조건식2 THEN 실행내용2
        ...
        [ELSE 실행내용 N]
        END IF;


*/

--특정 사원의 급여를 조회해서 SAL 변수에 대입
--500만원 이상일 경우'고급
--300만원 이상 중급 그 미만 초급
--해당사원의 급여 등급은 XX입니다

DECLARE
    SAL EMPLOYEE.SALARY%TYPE;
    GRADE VARCHAR2(10);
BEGIN
    SELECT SALARY
    INTO SAL
    FROM EMPLOYEE
    WHERE EMP_ID= '&사번';
    
    IF SAL >=5000000
     THEN GRADE := '고급'; 
    ELSIF SAL >= 3000000
     THEN GRADE := '중급';
    ELSE 
     GRADE :='초급';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('해당 사원의 급여등급은 ' || GRADE||'입니다.');
END;
/

/*
4)CASE비교대상자 THEN 비교값1 THEN 반환활결과값1 
                                    THEN 비교값2 THEN 반환활결과값2...
                                    ELSE 결과값N
                        END;
                        (SWITCH문)


*/

DECLARE
  EMP EMPLOYEE%ROWTYPE;
  DNAME VARCHAR2(30);
BEGIN
    SELECT *
    INTO EMP
    FROM EMPLOYEE
    WHERE EMP_ID= '&사번';
    
    DNAME := CASE EMP.DEPT_CODE
                            WHEN 'D1' THEN '인사팀'
                            WHEN 'D2' THEN '회계팀'
                            ELSE '기타팀'
                        END;
    
        DBMS_OUTPUT.PUT_LINE(EMP.EMP_NAME || '님은 ' ||  DNAME|| '입니다.');
END;
/


/*
<반복문>
1)BASIC LOOP문
LOOP
    반복적으로 수행할 구문;
    *반복문을 빠져나갈 수 있는 구문*
END LOOP;

*반복문을 빠져나갈 수 있는 구문*

1) IF 조건식 THEN EXIT; END IF;
2)EXIT WHEN 조건식;
*/

--1~5까지 1씩 증가되는 값 출력 후 반복문 빠져나오게
DECLARE
        NUMBER := 1;
BEGIN
    LOOP
    DBSM_OUTPPUT.PUT_LINE(I);
    I := I+1;
    
    IF I = 6 THEN EXIT
    END IF;
    END LOOP;
 END;
/

/*
    2) FOR LOOP문
    
    FOR 변수 IN [REVERSE] 초기값..최종값
    LOOP
        반복적으로 실행할 구문
    END LOOP;
*/
DECLARE
    I NUMBER := 1;
BEGIN

    FOR I IN 1..5
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
        END LOOP;
        
END;
/

/*
 3)WHILE LOOP문
 WHILE 반복문이 수행될 조건
LOOP 
    반복적으로 실행될 구문;
END LOOP;

*/
DECLARE
    I NUMBER := 1; -- 변수명을 I로 변경하고 초기값 설정
BEGIN 
    WHILE I < 6
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
        I := I + 1;
    END LOOP;
END;
/

--반복문 활용 예시
CREATE TABLE BOARD
(
    BOARD_NO NUMBER PRIMARY KEY
    , BOARD_TITLLE VARCHAR2(100) NOT NULL
    , BOARD_CONTENT VARCHAR2(4000) NOT NULL
    , REGIST_DATE DATE NOT NULL
);

--게시글 번호로 활용될 시퀀스
CREATE SEQUENCE SEQ_BNO;

SELECT* FROM BOARD;

BEGIN
    FOR I IN 1..100
    LOOP
        INSERT INTO BOARD (BOARD_NO, BOARD_TITLLE, BOARD_CONTENT, REGIST_DATE)
        VALUES(SEQ_BNO.NEXTVAL, '제목입니다' || I , '내용입니다' || I, SYSDATE);
    END LOOP;
END;
/
SELECT* FROM BOARD;


/*
    3. 예외처리부
    예외 : 실행 중 발생되는 오류
    
    EXCEPTION
        WHEN 예외명1 THEN 예외처리구문1;
        WHEN 예외명2 THEN 예외처리구문2;
        ...
        WHEN OTHERS THEN 예외처리구문N;
        
        * 시스템예외 (오라클에서 미리 정의해둔 예외)
        - NO_DATE_FOUND : SELECT한 결과가 한 행도 없을 경우
        - TOO_MANY_ROWS : SELECT한 결과가 여러행일 경우
        - ZERO_DIVIDE : 0으로 나누기 했을 경우
        - DUP_VAL_ON_INDEX : UNIQUE 제약조건에 위배 되었을 경우
        ...
*/
DECLARE
    RESULT NUMBER;
BEGIN
    RESULT := 10 / &숫자;
    DBMS_OUTPUT.PUT_LINE ('결과 : ' || RESULT);
EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('나누기 연산시 0으로 나눌수 없습니다');
END;
/
-- UNIQUE제약조건
BEGIN
-- 노옹철사원의 사번을 사용자가 입력한 값으로 수정
    UPDATE EMPLOYEE
    SET EMP_ID = '&변경할사번'
    WHERE EMP_NAME = '노옹철';
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('이미 존재하는 사번입니다');
END;
/
ROLLBACK;

DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME
    INTO EID, ENAME
    FROM EMPLOYEE
    WHERE MANAGER_ID = '&사수사번';
    
    DBMS_OUTPUT.PUT_LINE(EID || ', ' || ENAME);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN DBMS_OUTPUT.PUT_LINE('너무 많은 사원이 조회되었습니다.');
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('조회 결과가 없습니다.');
END;
/