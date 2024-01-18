--1. 춘 기술대학교의 학과 이름과 계열을 표시하시오. 단, 출력 헤더는 학과 명, 계열로 표시되도록 한다

SELECT DEPARTMENT_NAME "학과명", CATEGORY "계열"
FROM TB_DEPARTMENT;

--2. 학과의 학과 정원을 다음과 같은 형태로 화면에 출력한다

SELECT DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || '명 입니다.'  "학과별 정원"
FROM TB_DEPARTMENT;

--3. “국어국문학과”에 다니는 여학생 중 현재 휴학중인 여학생을 찾아달라는 요청이 들어왔다. 누 
--구인가? (국문학과의 “학과코드”는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아내도록 하자

SELECT STUDENT_NAME 
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '국어국문학과' AND ABSENCE_YN = 'Y' AND SUBSTR(STUDENT_SSN, 8,1)  IN ('2', '4');

--4. 도서관에서 대출 도서 장기 연체자들을 찾아 이름을 게시하고자 한다. 그 대상자들의 학번이 
--다음과 같을 때 대상자들을 찾는 적절한 SQL 구문을 작성하시오. A513079, A513090, A513091, A513110, A513119

SELECT STUDENT_NAME, STUDENT_NO
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_NO, 1, 4) = 'A513' AND SUBSTR(STUDENT_NO, 7)  IN ('9', '1', '0')  
ORDER BY STUDENT_NAME DESC;

--5. 입학 정원이 20명 이상 30명 이하인 학과들의 학과 이름과 계열을 출력하시오
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN  20 AND 30 ;

--6. 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다. 그럼 춘 기술대학 
--교 총장의 이름을 알아낼 수 있는 SQL문장을 작성하시오
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

--7. 혹시 전산상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 한다. 어떠한 
--SQL문장을 사용하면 될 것인지 작성하시오
SELECT STUDENT_NAME 
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;

--8. 혹시 전산상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 한다. 어떠한 
--SQL문장을 사용하면 될 것인지 작성하시오.
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

--9. 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 조회해보시오
SELECT  DISTINCT CATEGORY --혹시라도 중복값있을까봐 DISTINCT작성
FROM TB_DEPARTMENT
ORDER BY CATEGORY ASC;

--10.  02학번 전주 거주자들의 모임을 만들려고 한다. 휴학한 사람들은 제외한 재학중인 학생들의 
--학번, 이름, 주민번호를 출력하는 구문을 작성하시오
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE  ABSENCE_YN != 'Y' AND SUBSTR(STUDENT_NO, 1,3) = 'A21' AND STUDENT_ADDRESS LIKE '%전주%';


--11. 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른 순으로
--표시하는 sql문장을 작성하시오. (단, 헤더는 “학번”, “이름”, “입학년도”가 표시되도록 한다.
SELECT STUDENT_NO, STUDENT_NAME, ENTRANCE_DATE
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY ENTRANCE_DATE ASC;

SELECT *
FROM (
                SELECT STUDENT_NO"학번", STUDENT_NAME"이름", ENTRANCE_DATE"입학년도"
                FROM TB_STUDENT 
                JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
                WHERE DEPARTMENT_NAME LIKE '영어영문%'
                ) "영어영문학과"
ORDER BY 입학년도 ASC;


--12. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 한 명 있다고 한다. 그 교수의 이름
--과 주민번호를 화면에 출력하는 SQL문장을 작성해 보자.






--=============실습 2======================

/*19. 춘 기술대학교의 “환경조경학과”가 속한 같은 계열 학과들의 학과 별 전공과목 평점을 파악
하기 위한 적절한 SQL문을 찾아내시오. 단, 출력헤더는 “계열 학과명”, “전공평점”으로 표시되도
록 하고, 평점은 소수점 한 자리까지만 반올림하여 표시되도록 한다.
*/

SELECT DEPARTMENT_NAME"전공학과명", (SELECT POINT 
                                                                            )
FROM TB_DEPARTMENT
LEFT JOIN 
WHERE CATEGORY = (SELECT CATEGORY
                                         FROM TB_DEPARTMENT
                                        WHERE DEPARTMENT_NAME LIKE  '환경조경%')
GROUP BY CATEGORY;






















