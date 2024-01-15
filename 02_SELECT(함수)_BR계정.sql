/*
    <함수 FUNTION>
    전달된 값들을 가지고 연산한 후 결과를 반환
    
    -단일행 함수: N개의 값을 읽어들여서 N개의 결과값을 리턴 (매 행마다 함수 실행 결과 반환)
    
    -그룹 함수: N개의 값을 읽어들여서 1개의 결과값을 리턴 (그룹을 지어 그룹별로 함수 실행 결과 반환)
    
    -->SELECT절에 단일행 함수랑 그룹함수를 같이 사용할 수 없음.
    왜? 결과 행의 갯수가 다르기 때문
    
    --> 함수식을 기술할 수 있는 위치 : SLECET절, WHERE절, ORDER BY절, GROUP BY절, HAVING절, DML구문(INSERT, UPDATE ...)
*/


--======================<단일행 함수>========================

/*
<문자 처리 함수>

*LENGTH / LENGTHB  -> 결과값은 NUMBER타입으로 반환

LENGTH(컬럼|'문자열값') : 해당 문자열의 글자수 반환
LENGTHB(컬럼|'문자열값') : 해당 문자열 값의 바이트수 반환

'ㄱ','ㅏ' 등 한글 한글자당 3BYTE
영문자, 숫자, 특수문자 한글자당 1BYTE
*/
SELECT LENGTH('오라클'), LENGTHB('오라클'),
                LENGTH('oracle'),   LENGTHB('oracle')
FROM DUAL;

SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME), EMAIL
FROM EMPLOYEE
WHERE LENGTH(EMAIL) IN (13, 14); --이메일의 길이가 13, 14인 것들 검색


------------------------

/*
<INSERT>
문자열로부터 특정 문자의 시작위치를 찾아서 반환(JAVA에서 String클래스의 indexOf메소드 같은 느낌)
INSTR(컬럼| '문자열값', '찾고자하는 문자', 찾을 위치의 시작값,  [순번])                *[ ] 생략가능
*/

SELECT INSTR('AABAACAAAAACB', 'B') FROM DUAL; --찾을 위치의 시작값 1 기본값, 순번 1 기본값
SELECT INSTR('AABAACAAAAACB', 'B', 1, 1) FROM DUAL;
SELECT INSTR('AABAACAAAAACB', 'B', -1) FROM DUAL;
SELECT INSTR('AABAACAAAAACB', 'B', -1, 2) FROM DUAL;
SELECT INSTR('AABAACAAABAACB', 'B', 4, 1) FROM DUAL; --4번위치에서 탐색시작 이때 2번째로 찾아진 B의위치
SELECT INSTR('AABAACAAABAACB', 'B', 4, 4) FROM DUAL;  --찾아진 문자가 없다면 0 반환

SELECT EMAIL, INSTR(EMAIL, '_') "_위치", INSTR(EMAIL, '@') "@위치"
FROM EMPLOYEE;


/*
<SUBSTR 자바에서의 string 클래스의 substring()메소드와 유사
문자열에서 특정 문자열을 추출해서 반환
SUBSTR(STRING,, POSITION, [LENGTH] ) ->결과값은 CHARACTER타입
-STRING: 문자타입의 컬럼 또는 '문자열값'
-POSITION :문자열을 추출할 시작위치(음수값으로도 제시 가능)
-[LENGTH] :추출할 문자 갯수(생략시 끝까지 의미)


*/

SELECT SUBSTR('HELLOORACLE' ,7 ) FROM DUAL; --7번부터 끝까지 추출
SELECT SUBSTR('HELLOORACLE' ,4, 2 ) FROM DUAL; --4번부터 2개 추출
SELECT SUBSTR('HELLOORACLE' ,-3, 2 ) FROM DUAL; -- -3번(뒤에서 3번째)부터 2개 추출

--여자만 조회
SELECT EMP_NAME, EMP_NO
FROM EMPLOYEE
WHERE SUBSTR( EMP_NO, 8 ,1)  = '2' OR SUBSTR( EMP_NO, 8 ,1) = '4'; --주민번호 뒷자리에서 맨 앞이 2일경우 여자


---남자만
SELECT EMP_NAME, EMP_NO,  SUBSTR( EMP_NO, 8 ,1) "성별"
FROM EMPLOYEE
WHERE SUBSTR( EMP_NO, 8 ,1) IN ('1', '3');



--함수충접사용
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) "아이디"
FROM EMPLOYEE;

-----------------------------------------------

/*
<LPAD, RPAD>
문자열을 조회할 때 통일감있게 조회하고자 할 경우 사용

LPAD, RPAD(STRING, 최정적으로 반환할 문자의 길이, 덧붙이고자하는 문자)  --> 결과값은 CHAR형 타입

문자열에 덧붙이고자하는 문자를 왼쪽 또는 오른쪽에 붙여서 최종 N 길이만큼의 문자열 변환
*/

SELECT EMP_NAME, LPAD( EMAIL , 16) --덧붙이고자 하는 문자 생략시 기본값은 공백 문자
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD( EMAIL , 16 , '#') --덧붙이고자 하는 문자 생략시 기본값은 공백 문자
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD( EMAIL , 16 , '#') , LPAD(SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1), 8) "아이디"
FROM EMPLOYEE;

--주민번호
SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 1, 8) || '******' 
FROM EMPLOYEE;

SELECT EMP_NAME, EMP_NO, RPAD(SUBSTR(EMP_NO, 1, 8) , 14, ' * ')
FROM EMPLOYEE;
--------------------------------------------------------

/* 

<LTRIM / RTRIM>
문자열에서 특정 문자를 제거한 나머지를 반환

LTRIM / RTRIM(STRING, [제거하고자하는 문자들] ) -->결과값은 CHARACTER타입
*/

SELECT LTRIM('      B      P ')  FROM DUAL;  --제거하고자하는 문자 생략시 공백문자
SELECT LTRIM('123123BR123 ', '123')  FROM DUAL; -- 1또는 2또는 3 모두 제거
SELECT LTRIM('ACABACCYR ', 'ABC')  FROM DUAL; ---- A또는 B또는 C 모두 제거(문자 하나하나 찾아 제거)

SELECT RTRIM('3456ACCYR ', '0123456789')  FROM DUAL; 

/*
   * TRIM
    문자열의 앞/뒤/양쪽에 있는 지정한 문자들을 제거한 나머지 문자열 반환
    
    TRIM(LEADING | TRAILING | BOTH 제거할 문자 FROM | STRING)
    단, 제거할 문자는 한 문자로 제시해야됨

*/

SELECT TRIM('     B R     ') FROM DUAL; -- 기본적으로 양쪽에 있는 문자들 다 찾아서 제거
SELECT TRIM('Z' FROM 'ZZZZBRZZZ') FROM DUAL;

SELECT TRIM(LEADING 'Z' FROM 'ZZZZBRZZZ') FROM DUAL; -- LEADING : 앞 (==LTRIM)
SELECT TRIM(TRAILING 'Z' FROM 'ZZZZBRZZZ') FROM DUAL; -- TRAILING : 뒤(==RTRIM)
SELECT TRIM(BOTH 'Z' FROM 'ZZZZBRZZZ') FROM DUAL; -- BOTH : 양옆(==TRIM)(생략시 기본값)

---------------------------------------------------------------------------------------------------------------------------------------

/*
*LOWER/UPPER/INITCAP

LOWER/UPPER/INITCAP(STRING)  -->결과값은 CAHRACTER타입

-INITCAP :단어 앞글자마다 대문자로 변경한 문자열 반환


*/

SELECT LOWER('Welcom To My Wolrd!')  FROM DUAL;
SELECT UPPER('Welcom To My Wolrd!')  FROM DUAL;
SELECT INITCAP('welcom to mywolrd!')  FROM DUAL;

/*
CONCAT
문자열 두 개 전달받아서 하나로 합친 후 결과 반환

CONCAT(STRING, STRING)  -->결과값 CHARACTER타입

*/
SELECT CONCAT('가나다', 'ABC')  FROM DUAL;
--SELECT CONCAT('가나다', 'ABC' ,'123')  FROM DUAL; --CONCAT은 문자열 두 개까지만 연결가능
SELECT '가나다'||'ABC'||'123'  FROM DUAL;


-------------------------------------------------------
/*
*REPLACE
REPLACE(STRING, STR1, STR2)   -->결과값  CHARACTER타입

*/

SELECT EMP_NAME, REPLACE(EMAIL, 'br.com', 'gmil.com')
FROM EMPLOYEE;



/*
<숫자처리함수>

*ABS
숫자의 절대값을 구해주는 함수

ABS(NUMBER) -> 결과값은 NUMBER타입

*/

SELECT ABS(-10) FROM DUAL;
SELECT ABS(-5.7) FROM DUAL;

------------------------------------------------------


/*
*MOD
두 수를 나눈 나머지값을 반환해주는 함수

MOD(NUMBER, NUMBER)  -->결과값 NUMBER타입

*/
SELECT 10/3 FROM DUAL;
--SELECT 10 %3 FROM DUAL; --오라클에서는 %없음
SELECT MOD(10,3) FROM DUAL;
SELECT MOD(-10.9,3) FROM DUAL;

------------------

/*

*ROUND
반올림한 결과를 반환

ROUND(NUMBER, [위치]) ->결과값은 NUMBER타입
*/

SELECT ROUND(123.456) FROM DUAL; --위치 생략시 기본값 0
SELECT ROUND(123.456, 0) FROM DUAL;
SELECT ROUND(123.456, 1) FROM DUAL;
SELECT ROUND(15703, -3) FROM DUAL;


/*
CEIL
올림처리해주는 함수

CEIL(NUMBER)
*/

SELECT CEIL(123.152) FROM DUAL;
--SELECT CEIL(123.152) FROM DUAL; --위치지정 불가능
SELECT CEIL(123.000) FROM DUAL;


/*
FLOOR/ TRUNC

FLOOR(NUMBER)
TRUNC(NUMBER, 위치)
*/

SELECT FLOOR(123.952) FROM DUAL;
SELECT TRUNC(123.952, 1) FROM DUAL;
SELECT TRUNC(123.952, -1) FROM DUAL;

/*
날짜처림 한수

*/
SELECT  STSDATE FROM DUAL;
SELECT  STSDATE -1 FROM DUAL;


SELECT  STSDATE -1 FROM DUAL;

/*
            <날짜 처리 함수>
            * SYSDATE 시스템 날짜 및 시간 반환
*/

SELECT SYSDATE FROM DUAL;
SELECT SYSDATE - 1 FROM DUAL; -- 1일전 날짜

-- * MONTHS_BETWEEN(DATE1, DATE2) : 두 날짜 사이의 개월 수 => 내부적으로 DATE1 - DATE2 후 나누기 30, 01 진행
--      => 결과값은 NUMBER타입
-- 사원들의 근무개월 수

SELECT EMP_NAME, HIRE_DATE
    , FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) || '개월차' "근무개월수"
    ,  ROUND(SYSDATE - HIRE_DATE)"근무일수"
FROM EMPLOYEE;


-- ADD_MONTHS(DATE, NUMBER) :특정 날짜에 해당 숫자만큼 개월 수를 더해서  그날짜 리턴
-->결과값 DATE타입
SELECT ADD_MONTHS(SYSDATE, 5) FROM DUAL;

--사원들의 입사일, 정규직으로 전환된 날짜 조회(입사후 6개월 후) 
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 6)
FROM EMPLOYEE;

--NEXT_DAY(DATE, 요일(요일|문자)) :특정날짜 이후에 가까운 해당 요일의 날짜를 반환해주는 함수
-->결과값은 DATE

SELECT SYSDATE, NEXT_DAY(SYSDATE, '금요일') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '금') FROM DUAL;

---1:일요일 2:월요일 ` ~ 6:금요일 , 7: 토요일
--SELECT SYSDATE, NEXT_DAY(SYSDATE, '6') FROM DUAL;
 --SELECT SYSDATE, NEXT_DAY(SYSDATE, 'FRIDAY') FROM DUAL; --에러 현재언어가 KOREAN이기 때문
 
 --언어변경
 
 ALTER SESSION SET NLS_LANGUAGE = AMERICAN;  --프라이데이 적용 ㅇ , 금요일, 금 적용 X
 
 ALTER SESSION SET NLS_LANGUAGE = KOREAN; 


--LAST_DAY(DATE) : 해당 월의 마지막 날짜를 구해서 반환

SELECT LAST_DAY(SYSDATE) FROM DUAL;

--사원명, 입시일, 입사한 달의 마지막 날짜, 입사한 달에 근무한 일수
SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE), LAST_DAY(HIRE_DATE) - HIRE_DATE+1 "입사달의 근무일 수"
FROM EMPLOYEE;

/*
  EXTRACT
  특정날짜로부터 년도|월|일 값을 추출해서 반환하는 함수
  
  EXTRACT(YEAR|MONTH|DAY FROM DATE)
  
*/

--사원명, 입사년도, 입사월, 입사일 조회
SELECT EMP_NAME,
                EXTRACT(YEAR FROM HIRE_DATE) "입사년도",
                EXTRACT(MONTH FROM HIRE_DATE) "입사월",
                EXTRACT(DAY FROM HIRE_DATE) "입사일"
FROM EMPLOYEE
ORDER BY 입사년도, 입사월, 입사일;

--입사년도가 2000년도인 사원
SELECT *
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM HIRE_DATE) = 2000;
--WHERE HIRE_DATE BETWEEN '00/01/01' AND '00/12/31';
--WHERE SUBSTR(HIRE_DATE, 1, 2) = '00;

-------------------------------------------------------------------------------------------------------
/*
<형변환 함수>
TO _CHAR(숫자|날짜, [포맷]) : 숫자 타입 또는 날짜 타입의 값을 문자타입으로 변환시켜주는 함수

*/
--숫자타입 -> 문자타입
SELECT 1234, TO_CHAR(1234) FROM DUAL; --'1234'

SELECT TO_CHAR(1234, '99999') FROM DUAL;--5칸짜리 공간확보, 오른쪽 정렬, 빈칸 공백 채우기
SELECT TO_CHAR(1234, 'fm0000') FROM DUAL; --0은 빈칸을 -으로 채우기, 맨 앞 한칸의 공백 -->음수일 경우 -를 뽑기 
 
 
 SELECT TO_CHAR(1234, 'L99999') FROM DUAL; --L화폐단위
 SELECT TO_CHAR(15000, 'L99999') FROM DUAL;
 SELECT TO_CHAR(100000, 'L99999') FROM DUAL;

 
 SELECT TO_CHAR(1234, 'FM$99999') FROM DUAL; --L화폐단위

SELECT EMP_NAME, SALARY, TO_CHAR(SALARY, 'fmL999,999,999'), TO_CHAR(SALARY*12, 'L999,999,999')
FROM EMPLOYEE;

--날짜타입 ->문자타입
SELECT SYSDATE, TO_CHAR(SYSDATE) FROM DUAL; --'24/01/15'


--년도 관련된 포맷
SELECT TO_CHAR(SYSDATE, 'yyyy'),
                TO_CHAR(SYSDATE, 'YY'),
                TO_CHAR(SYSDATE, 'RRRR'),
                TO_CHAR(SYSDATE, 'RR'),
                TO_CHAR(SYSDATE, 'YEAR')
FROM DUAL;


--월과 관련 포맷
SELECT TO_CHAR(SYSDATE, 'MM'),
                TO_CHAR(SYSDATE, 'MON'),
                TO_CHAR(SYSDATE, 'MONTH'),
                TO_CHAR(SYSDATE, 'RM')
FROM DUAL;


--일과 관련 포맷
SELECT TO_CHAR(SYSDATE, 'fmDDD'), --해당 년도 기준 몇 일 째인지
                TO_CHAR(SYSDATE, 'DD'), --해당 월을 기준으로 몇 일째인지
                TO_CHAR(SYSDATE, 'D')   --해당 주를 기준으로 몇 일째인지 EX) 2 (1~7 일 ~ 토)
FROM DUAL;


SELECT TO_CHAR(SYSDATE, ' YYYY-MM-DD DAY DY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, ' YYYY/fmMM/DD (DY)') FROM DUAL;  --fm은 0을 떼주지만 붙인 자리 이후의 0은 모두 제거해준다.(부분적으로 X)
SELECT TO_CHAR(SYSDATE, ' AM HH:MI:SS') FROM DUAL; --오전오후는 AM PM으로 표시, HH 12시간 형식
SELECT TO_CHAR(SYSDATE, ' AM HH24:MI:SS') FROM DUAL; --HH24 24시간 형식

--EX)'1990년 02월 06일 (수)' 형식으로 
SELECT EMP_NAME, TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일" (DY)') --" "로 묶어줘야 제대로 표시된다.
FROM EMPLOYEE;


--------------------------------------------------------------
/*
TO_DATE(숫자|문자, [포맷]) : 숫자타입 또는 문자타입을 날짜타입으로 변환시켜주는 함수
*/
SELECT TO_DATE(20240101) FROM DUAL;
SELECT TO_DATE(20240101) FROM DUAL;

SELECT TO_DATE(970101) FROM DUAL; --2098년도로 세팅하고자 할 경우 ->>1998년도 세팅되어버림
SELECT TO_DATE('070101') FROM DUAL;

SELECT TO_DATE('070101 123005', 'YYMMDD HH24MISS ') FROM DUAL;

SELECT TO_DATE('140630', 'YYMMDD'), TO_DATE('980630', 'YYMMDD') FROM DUAL; --YY무조건 현재세기로 반영
SELECT TO_DATE('140630', 'RRMMDD'), TO_DATE('980630', 'YYMMDD') FROM DUAL;--RR두 자리년도가 50미만인 경우 현재세기 반영, 50이상이면 이전세기 반영

---------------------------------------------

/*
TO_NUMBER(문자, [포맷]) :문자타입의 데이터를 숫자타입으로 변환시켜주는 함수

*/

SELECT TO_NUMBER('05123') FROM DUAL;

SELECT '1,000,000' + '550,000' FROM DUAL; -->자동형변환 돼서 덧셈연산됨
SELECT TO_NUMBER('1,000,000', '999,999,999') + TO_NUMBER('550,000',  '999,999,999') FROM DUAL;


-------------------------------------------------

/*
NULL처리함수

*/
--NVL(컬럼, 해당컬럼이 NULL일 경우 반환할 값)
SELECT EMP_NAME, NVL(DEPT_CODE, '부서없음') --NVL( BONUS, 0) 보너스가 넘버타입이므로 숫자값만 제시해야함
FROM EMPLOYEE;

SELECT EMP_NAME, (SALARY + SALARY * NVL(BONUS, 0))  * 12 "보너스포함연봉"
FROM EMPLOYEE;

--====================실습문제========================

-- 1. 전 사원들의 직원명과 주민번호를 조회
--    단, 주민번호 9번째 자리부터 끝까지는 '*' 로 채워서 조회
--    EX) 771120-1******

/*SELECT SUBSTR('HELLOORACLE' ,7 ) FROM DUAL; --7번부터 끝까지 추출
SELECT SUBSTR('HELLOORACLE' ,4, 2 ) FROM DUAL; --4번부터 2개 추출

SELECT EMP_NAME, RPAD( EMAIL , 16 , '#') --덧붙이고자 하는 문자 생략시 기본값은 공백 문자
FROM EMPLOYEE;
*/

SELECT EMP_NAME, EMP_NO, RPAD(SUBSTR(EMP_NO, 1, 8) , 14, ' * ')
FROM EMPLOYEE;

-- 2. 전 사원들의 직원명, 직급코드, 보너스포함연봉(원) 조회
--    단, 보너스포함연봉값에 절대 NULL이 나와서는 안됨
--    뿐만아니라 이때 보너스포함연봉은 \57,000,000원 형식으로 조회되게 함


-- 3. 부서코드가 D5, D9인 직원들 중 2004년에 입사한 직원들의 사번, 사원명, 부서코드, 입사일 조회
/*
-사원명, 입사년도, 입사월, 입사일 조회
SELECT EMP_NAME,
                EXTRACT(YEAR FROM HIRE_DATE) "입사년도",
                EXTRACT(MONTH FROM HIRE_DATE) "입사월",
                EXTRACT(DAY FROM HIRE_DATE) "입사일"
FROM EMPLOYEE
ORDER BY 입사년도, 입사월, 입사일;
*/

SELECT EMP_ID ,EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE = 'D9' OR  DEPT_CODE = 'D5') AND EXTRACT(YEAR FROM HIRE_DATE) = 2004;

-- 4. 직원명, 입사일, 입사한 달의 근무일수(주말에 대한건 고려하지 말 것) 조회


-- 5. 직원명, 부서코드, 생년월일 조회
--    단, 생년월일은 XX년 XX월 XX일 형식으로 조회되게 함

/*
--EX)'1990년 02월 06일 (수)' 형식으로 
SELECT EMP_NAME, TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일" (DY)') --" "로 묶어줘야 제대로 표시된다.
FROM EMPLOYEE;


*/

SELECT EMP_NAME, DEPT_CODE, 
EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO, 1, 2), 'YY" ')) AS "YEAR", 
EXTRACT(MONTH FROM TO_DATE(SUBSTR(EMP_NO, 3,4), 'MM')) AS "MONTH"
FROM EMPLOYEE;
-- 6. 부서코드가 D5, D6, D9인 사원들만 조회를 하되 이때 직원명, 부서코드, 부서명을 조회
--    (부서명에 대한 값으로는
--     해당 부서코드가 D5일 경우는 총무부로, D6일 경우 기획부로, D9일 경우 영업부로 조회되게끔 하시오)
--    => CASE WHEN도 사용해보고, DECODE도 사용해보삼!