명령의 13 행에서 시작하는 중 오류 발생 -
SELECT * 
FROM EMPLOYEE
오류 발생 명령행: 14 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 17 행에서 시작하는 중 오류 발생 -
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
오류 발생 명령행: 18 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 22 행에서 시작하는 중 오류 발생 -
SELECT * FROM JOB
오류 발생 명령행: 22 열: 15
오류 보고 -
SQL 오류: ORA-04044: procedure, function, package, or type is not allowed here
04044. 00000 -  "procedure, function, package, or type is not allowed here"
*Cause:    A procedure, function, or package was specified in an
           inappropriate place in a statement.
*Action:   Make sure the name is correct or remove it.

명령의 26 행에서 시작하는 중 오류 발생 -
SELECT JOB_NAME
FROM JOB
오류 발생 명령행: 27 열: 6
오류 보고 -
SQL 오류: ORA-04044: procedure, function, package, or type is not allowed here
04044. 00000 -  "procedure, function, package, or type is not allowed here"
*Cause:    A procedure, function, or package was specified in an
           inappropriate place in a statement.
*Action:   Make sure the name is correct or remove it.

명령의 29 행에서 시작하는 중 오류 발생 -
SELECT * FROM DEPARTMENT
오류 발생 명령행: 29 열: 15
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 31 행에서 시작하는 중 오류 발생 -
SELECT DEPT_ID,DEPT_TITLE
FROM DEPARTMENT
오류 발생 명령행: 32 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 34 행에서 시작하는 중 오류 발생 -
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY
FROM EMPLOYEE
오류 발생 명령행: 35 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 43 행에서 시작하는 중 오류 발생 -
SELECT EMP_NAME, SALARY * 12
FROM EMPLOYEE
오류 발생 명령행: 44 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 47 행에서 시작하는 중 오류 발생 -
SELECT EMP_NAME, SALARY, BONUS, SALARY * 12, (SALARY + BONUS * SALARY) * 12
FROM EMPLOYEE
오류 발생 명령행: 48 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

SYSDATE 
--------
24/01/15


명령의 55 행에서 시작하는 중 오류 발생 -
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
FROM EMPLOYEE
오류 발생 명령행: 56 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 72 행에서 시작하는 중 오류 발생 -
SELECT EMP_NAME 사원명, SALARY AS 급여, BONUS, 
       SALARY*12 "연봉(원)", (SALARY + BONUS*SALARY)*12 AS "총 소득"
FROM EMPLOYEE
오류 발생 명령행: 72 열: 119
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 87 행에서 시작하는 중 오류 발생 -
SELECT EMP_ID, EMP_NAME, SALARY, '원' AS 단위
FROM EMPLOYEE
오류 발생 명령행: 88 열: 12
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 98 행에서 시작하는 중 오류 발생 -
SELECT EMP_ID || EMP_NAME || SALARY 
FROM EMPLOYEE
오류 발생 명령행: 99 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 104 행에서 시작하는 중 오류 발생 -
SELECT EMP_NAME || '의 월급은 ' || SALARY ||'원 입니다.' AS "급여정보"
FROM EMPLOYEE
오류 발생 명령행: 104 열: 72
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 115 행에서 시작하는 중 오류 발생 -
SELECT * 
FROM DEPARTMENT
오류 발생 명령행: 116 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 118 행에서 시작하는 중 오류 발생 -
SELECT DISTINCT DEPT_CODE
FROM EMLOYEE
오류 발생 명령행: 119 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 122 행에서 시작하는 중 오류 발생 -
SELECT DISTINCT JOB_CODE
FROM EMLOYEE
오류 발생 명령행: 123 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 127 행에서 시작하는 중 오류 발생 -
SELECT DISTINCT DEPT_CODE, JOB_CODE
FROM EMLOYEE
오류 발생 명령행: 128 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 13 행에서 시작하는 중 오류 발생 -
SELECT * 
FROM EMPLOYEE
오류 발생 명령행: 14 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 17 행에서 시작하는 중 오류 발생 -
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
오류 발생 명령행: 18 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 22 행에서 시작하는 중 오류 발생 -
SELECT * FROM JOB
오류 발생 명령행: 22 열: 15
오류 보고 -
SQL 오류: ORA-04044: procedure, function, package, or type is not allowed here
04044. 00000 -  "procedure, function, package, or type is not allowed here"
*Cause:    A procedure, function, or package was specified in an
           inappropriate place in a statement.
*Action:   Make sure the name is correct or remove it.

명령의 26 행에서 시작하는 중 오류 발생 -
SELECT JOB_NAME
FROM JOB
오류 발생 명령행: 27 열: 6
오류 보고 -
SQL 오류: ORA-04044: procedure, function, package, or type is not allowed here
04044. 00000 -  "procedure, function, package, or type is not allowed here"
*Cause:    A procedure, function, or package was specified in an
           inappropriate place in a statement.
*Action:   Make sure the name is correct or remove it.

명령의 29 행에서 시작하는 중 오류 발생 -
SELECT * FROM DEPARTMENT
오류 발생 명령행: 29 열: 15
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 31 행에서 시작하는 중 오류 발생 -
SELECT DEPT_ID,DEPT_TITLE
FROM DEPARTMENT
오류 발생 명령행: 32 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 34 행에서 시작하는 중 오류 발생 -
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY
FROM EMPLOYEE
오류 발생 명령행: 35 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 43 행에서 시작하는 중 오류 발생 -
SELECT EMP_NAME, SALARY * 12
FROM EMPLOYEE
오류 발생 명령행: 44 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 47 행에서 시작하는 중 오류 발생 -
SELECT EMP_NAME, SALARY, BONUS, SALARY * 12, (SALARY + BONUS * SALARY) * 12
FROM EMPLOYEE
오류 발생 명령행: 48 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

SYSDATE 
--------
24/01/15


명령의 55 행에서 시작하는 중 오류 발생 -
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
FROM EMPLOYEE
오류 발생 명령행: 56 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 72 행에서 시작하는 중 오류 발생 -
SELECT EMP_NAME 사원명, SALARY AS 급여, BONUS, 
       SALARY*12 "연봉(원)", (SALARY + BONUS*SALARY)*12 AS "총 소득"
FROM EMPLOYEE
오류 발생 명령행: 72 열: 119
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 87 행에서 시작하는 중 오류 발생 -
SELECT EMP_ID, EMP_NAME, SALARY, '원' AS 단위
FROM EMPLOYEE
오류 발생 명령행: 88 열: 12
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 98 행에서 시작하는 중 오류 발생 -
SELECT EMP_ID || EMP_NAME || SALARY 
FROM EMPLOYEE
오류 발생 명령행: 99 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 104 행에서 시작하는 중 오류 발생 -
SELECT EMP_NAME || '의 월급은 ' || SALARY ||'원 입니다.' AS "급여정보"
FROM EMPLOYEE
오류 발생 명령행: 104 열: 72
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 115 행에서 시작하는 중 오류 발생 -
SELECT * 
FROM DEPARTMENT
오류 발생 명령행: 116 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 118 행에서 시작하는 중 오류 발생 -
SELECT DISTINCT DEPT_CODE
FROM EMLOYEE
오류 발생 명령행: 119 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 122 행에서 시작하는 중 오류 발생 -
SELECT DISTINCT JOB_CODE
FROM EMLOYEE
오류 발생 명령행: 123 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 127 행에서 시작하는 중 오류 발생 -
SELECT DISTINCT DEPT_CODE, JOB_CODE
FROM EMLOYEE
오류 발생 명령행: 128 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

EMP EMP_NAME             EMP_NO         EMAIL                     PHONE       DE JO     SALARY      BONUS MAN HIRE_DAT ENT_DATE E
--- -------------------- -------------- ------------------------- ----------- -- -- ---------- ---------- --- -------- -------- -
200 선동일               621230-1985634 sun_di@br.com             01099546325 D9 J1    8000000         .3     90/02/06          N
201 송종기               631105-1548654 song_jk@br.com            01045686656 D9 J2    6000000            200 01/09/01          N
202 노옹철               861015-1356452 no_hc@br.com              01066656263 D9 J2    1800000            201 01/01/01          N
203 송은희               631010-2653546 song_eh@br.com            01077607879 D6 J4    3900000            204 96/05/03          N
204 유재식               660508-1342154 yoo_js@br.com             01099999129 D6 J3    3400000         .2 200 00/12/29          N
205 정중하               770102-1357951 jung_jh@br.com            01036654875 D6 J3    2800000            204 99/09/09          N
206 박나라               630709-2054321 pack_nr@br.com            01096935222 D5 J7    3700000            207 08/04/02          N
207 하이유               690402-2040612 ha_iy@br.com              01036654488 D5 J5    2200000         .1 200 94/07/07          N
208 김해술               870927-1313564 kim_hs@br.com             01078634444 D5 J5    2500000            207 04/04/30          N
209 심봉선               750206-1325546 sim_bs@br.com             0113654485  D5 J3    3500000        .15 207 11/11/11          N
210 윤은해               650505-2356985 youn_eh@br.com            0179964233  D5 J7    2000000            207 01/02/03          N

EMP EMP_NAME             EMP_NO         EMAIL                     PHONE       DE JO     SALARY      BONUS MAN HIRE_DAT ENT_DATE E
--- -------------------- -------------- ------------------------- ----------- -- -- ---------- ---------- --- -------- -------- -
211 전형돈               830807-1121321 jun_hd@br.com             01044432222 D8 J6    2000000            200 12/12/12          N
212 장쯔위               780923-2234542 jang_zw@br.com            01066682224 D8 J6    2550000        .25 211 15/06/17          N
213 하동운               621111-1785463 ha_dh@br.com              01158456632    J6    2320000         .1     99/12/31          N
214 방명수               850918-1313513 bang_ms@br.com            01074127545 D1 J7    1380000            200 10/04/04          N
215 대북혼               881130-1050911 dae_bh@br.com             01088808584 D5 J5    3760000                17/06/19          N
216 차태연               770808-1364897 cha_ty@br.com             01064643212 D1 J6    2780000         .2 214 13/03/01          N
217 전지연               770808-2665412 jun_jy@br.com             01033624442 D1 J6    3660000         .3 214 07/03/20          N
218 이오리               870427-2232123 loo_or@br.com             01022306545    J7    2890000                16/11/28          N
219 임시환               660712-1212123 im_sw@br.com                          D2 J4    1550000                99/09/09          N
220 이중석               770823-1113111 lee_js@br.com                         D2 J4    2490000                14/09/18          N
221 유하진               800808-1123341 yoo_hj@br.com                         D2 J4    2480000                94/01/20          N

EMP EMP_NAME             EMP_NO         EMAIL                     PHONE       DE JO     SALARY      BONUS MAN HIRE_DAT ENT_DATE E
--- -------------------- -------------- ------------------------- ----------- -- -- ---------- ---------- --- -------- -------- -
222 이태림               760918-2854697 lee_tr@br.com             01033000002 D8 J6    2436240        .35 100 97/09/12 17/09/12 Y

23개 행이 선택되었습니다. 


EMP EMP_NAME                 SALARY
--- -------------------- ----------
200 선동일                  8000000
201 송종기                  6000000
202 노옹철                  1800000
203 송은희                  3900000
204 유재식                  3400000
205 정중하                  2800000
206 박나라                  3700000
207 하이유                  2200000
208 김해술                  2500000
209 심봉선                  3500000
210 윤은해                  2000000

EMP EMP_NAME                 SALARY
--- -------------------- ----------
211 전형돈                  2000000
212 장쯔위                  2550000
213 하동운                  2320000
214 방명수                  1380000
215 대북혼                  3760000
216 차태연                  2780000
217 전지연                  3660000
218 이오리                  2890000
219 임시환                  1550000
220 이중석                  2490000
221 유하진                  2480000

EMP EMP_NAME                 SALARY
--- -------------------- ----------
222 이태림                  2436240

23개 행이 선택되었습니다. 


JO JOB_NAME                           
-- -----------------------------------
J1 대표                               
J2 부사장                             
J3 부장                               
J4 차장                               
J5 과장                               
J6 대리                               
J7 사원                               

7개 행이 선택되었습니다. 


JOB_NAME                           
-----------------------------------
대표
부사장
부장
차장
과장
대리
사원

7개 행이 선택되었습니다. 


DE DEPT_TITLE                          LO
-- ----------------------------------- --
D1 인사관리부                          L1
D2 회계관리부                          L1
D3 마케팅부                            L1
D4 국내영업부                          L1
D5 해외영업1부                         L2
D6 해외영업2부                         L3
D7 해외영업3부                         L4
D8 기술지원부                          L5
D9 총무부                              L1

9개 행이 선택되었습니다. 


DE DEPT_TITLE                         
-- -----------------------------------
D1 인사관리부                         
D2 회계관리부                         
D3 마케팅부                           
D4 국내영업부                         
D5 해외영업1부                        
D6 해외영업2부                        
D7 해외영업3부                        
D8 기술지원부                         
D9 총무부                             

9개 행이 선택되었습니다. 


EMP_NAME             EMAIL                     PHONE       HIRE_DAT     SALARY
-------------------- ------------------------- ----------- -------- ----------
선동일               sun_di@br.com             01099546325 90/02/06    8000000
송종기               song_jk@br.com            01045686656 01/09/01    6000000
노옹철               no_hc@br.com              01066656263 01/01/01    1800000
송은희               song_eh@br.com            01077607879 96/05/03    3900000
유재식               yoo_js@br.com             01099999129 00/12/29    3400000
정중하               jung_jh@br.com            01036654875 99/09/09    2800000
박나라               pack_nr@br.com            01096935222 08/04/02    3700000
하이유               ha_iy@br.com              01036654488 94/07/07    2200000
김해술               kim_hs@br.com             01078634444 04/04/30    2500000
심봉선               sim_bs@br.com             0113654485  11/11/11    3500000
윤은해               youn_eh@br.com            0179964233  01/02/03    2000000

EMP_NAME             EMAIL                     PHONE       HIRE_DAT     SALARY
-------------------- ------------------------- ----------- -------- ----------
전형돈               jun_hd@br.com             01044432222 12/12/12    2000000
장쯔위               jang_zw@br.com            01066682224 15/06/17    2550000
하동운               ha_dh@br.com              01158456632 99/12/31    2320000
방명수               bang_ms@br.com            01074127545 10/04/04    1380000
대북혼               dae_bh@br.com             01088808584 17/06/19    3760000
차태연               cha_ty@br.com             01064643212 13/03/01    2780000
전지연               jun_jy@br.com             01033624442 07/03/20    3660000
이오리               loo_or@br.com             01022306545 16/11/28    2890000
임시환               im_sw@br.com                          99/09/09    1550000
이중석               lee_js@br.com                         14/09/18    2490000
유하진               yoo_hj@br.com                         94/01/20    2480000

EMP_NAME             EMAIL                     PHONE       HIRE_DAT     SALARY
-------------------- ------------------------- ----------- -------- ----------
이태림               lee_tr@br.com             01033000002 97/09/12    2436240

23개 행이 선택되었습니다. 


EMP_NAME              SALARY*12
-------------------- ----------
선동일                 96000000
송종기                 72000000
노옹철                 21600000
송은희                 46800000
유재식                 40800000
정중하                 33600000
박나라                 44400000
하이유                 26400000
김해술                 30000000
심봉선                 42000000
윤은해                 24000000

EMP_NAME              SALARY*12
-------------------- ----------
전형돈                 24000000
장쯔위                 30600000
하동운                 27840000
방명수                 16560000
대북혼                 45120000
차태연                 33360000
전지연                 43920000
이오리                 34680000
임시환                 18600000
이중석                 29880000
유하진                 29760000

EMP_NAME              SALARY*12
-------------------- ----------
이태림                 29234880

23개 행이 선택되었습니다. 


EMP_NAME                 SALARY      BONUS  SALARY*12 (SALARY+BONUS*SALARY)*12
-------------------- ---------- ---------- ---------- ------------------------
선동일                  8000000         .3   96000000                124800000
송종기                  6000000              72000000                         
노옹철                  1800000              21600000                         
송은희                  3900000              46800000                         
유재식                  3400000         .2   40800000                 48960000
정중하                  2800000              33600000                         
박나라                  3700000              44400000                         
하이유                  2200000         .1   26400000                 29040000
김해술                  2500000              30000000                         
심봉선                  3500000        .15   42000000                 48300000
윤은해                  2000000              24000000                         

EMP_NAME                 SALARY      BONUS  SALARY*12 (SALARY+BONUS*SALARY)*12
-------------------- ---------- ---------- ---------- ------------------------
전형돈                  2000000              24000000                         
장쯔위                  2550000        .25   30600000                 38250000
하동운                  2320000         .1   27840000                 30624000
방명수                  1380000              16560000                         
대북혼                  3760000              45120000                         
차태연                  2780000         .2   33360000                 40032000
전지연                  3660000         .3   43920000                 57096000
이오리                  2890000              34680000                         
임시환                  1550000              18600000                         
이중석                  2490000              29880000                         
유하진                  2480000              29760000                         

EMP_NAME                 SALARY      BONUS  SALARY*12 (SALARY+BONUS*SALARY)*12
-------------------- ---------- ---------- ---------- ------------------------
이태림                  2436240        .35   29234880                 39467088

23개 행이 선택되었습니다. 


SYSDATE 
--------
24/01/15


EMP_NAME             HIRE_DAT SYSDATE-HIRE_DATE
-------------------- -------- -----------------
선동일               90/02/06        12396.5317
송종기               01/09/01        8171.53168
노옹철               01/01/01        8414.53168
송은희               96/05/03        10118.5317
유재식               00/12/29        8417.53168
정중하               99/09/09        8894.53168
박나라               08/04/02        5766.53168
하이유               94/07/07        10784.5317
김해술               04/04/30        7199.53168
심봉선               11/11/11        4448.53168
윤은해               01/02/03        8381.53168

EMP_NAME             HIRE_DAT SYSDATE-HIRE_DATE
-------------------- -------- -----------------
전형돈               12/12/12        4051.53168
장쯔위               15/06/17        3134.53168
하동운               99/12/31        8781.53168
방명수               10/04/04        5034.53168
대북혼               17/06/19        2401.53168
차태연               13/03/01        3972.53168
전지연               07/03/20        6145.53168
이오리               16/11/28        2604.53168
임시환               99/09/09        8894.53168
이중석               14/09/18        3406.53168
유하진               94/01/20        10952.5317

EMP_NAME             HIRE_DAT SYSDATE-HIRE_DATE
-------------------- -------- -----------------
이태림               97/09/12        9621.53168

23개 행이 선택되었습니다. 


사원명                          급여      BONUS      연봉(원)       총 소득
-------------------- ---------- ---------- ---------- ----------
선동일                  8000000         .3   96000000  124800000
송종기                  6000000              72000000           
노옹철                  1800000              21600000           
송은희                  3900000              46800000           
유재식                  3400000         .2   40800000   48960000
정중하                  2800000              33600000           
박나라                  3700000              44400000           
하이유                  2200000         .1   26400000   29040000
김해술                  2500000              30000000           
심봉선                  3500000        .15   42000000   48300000
윤은해                  2000000              24000000           

사원명                          급여      BONUS      연봉(원)       총 소득
-------------------- ---------- ---------- ---------- ----------
전형돈                  2000000              24000000           
장쯔위                  2550000        .25   30600000   38250000
하동운                  2320000         .1   27840000   30624000
방명수                  1380000              16560000           
대북혼                  3760000              45120000           
차태연                  2780000         .2   33360000   40032000
전지연                  3660000         .3   43920000   57096000
이오리                  2890000              34680000           
임시환                  1550000              18600000           
이중석                  2490000              29880000           
유하진                  2480000              29760000           

사원명                          급여      BONUS      연봉(원)       총 소득
-------------------- ---------- ---------- ---------- ----------
이태림                  2436240        .35   29234880   39467088

23개 행이 선택되었습니다. 


EMP EMP_NAME                 SALARY 단
--- -------------------- ---------- -
200 선동일                  8000000 원
201 송종기                  6000000 원
202 노옹철                  1800000 원
203 송은희                  3900000 원
204 유재식                  3400000 원
205 정중하                  2800000 원
206 박나라                  3700000 원
207 하이유                  2200000 원
208 김해술                  2500000 원
209 심봉선                  3500000 원
210 윤은해                  2000000 원

EMP EMP_NAME                 SALARY 단
--- -------------------- ---------- -
211 전형돈                  2000000 원
212 장쯔위                  2550000 원
213 하동운                  2320000 원
214 방명수                  1380000 원
215 대북혼                  3760000 원
216 차태연                  2780000 원
217 전지연                  3660000 원
218 이오리                  2890000 원
219 임시환                  1550000 원
220 이중석                  2490000 원
221 유하진                  2480000 원

EMP EMP_NAME                 SALARY 단
--- -------------------- ---------- -
222 이태림                  2436240 원

23개 행이 선택되었습니다. 


EMP_ID||EMP_NAME||SALARY                                       
---------------------------------------------------------------
200선동일8000000
201송종기6000000
202노옹철1800000
203송은희3900000
204유재식3400000
205정중하2800000
206박나라3700000
207하이유2200000
208김해술2500000
209심봉선3500000
210윤은해2000000

EMP_ID||EMP_NAME||SALARY                                       
---------------------------------------------------------------
211전형돈2000000
212장쯔위2550000
213하동운2320000
214방명수1380000
215대북혼3760000
216차태연2780000
217전지연3660000
218이오리2890000
219임시환1550000
220이중석2490000
221유하진2480000

EMP_ID||EMP_NAME||SALARY                                       
---------------------------------------------------------------
222이태림2436240

23개 행이 선택되었습니다. 


급여정보                                                                    
------------------------------------------------------------------------
선동일의 월급은 8000000원 입니다.
송종기의 월급은 6000000원 입니다.
노옹철의 월급은 1800000원 입니다.
송은희의 월급은 3900000원 입니다.
유재식의 월급은 3400000원 입니다.
정중하의 월급은 2800000원 입니다.
박나라의 월급은 3700000원 입니다.
하이유의 월급은 2200000원 입니다.
김해술의 월급은 2500000원 입니다.
심봉선의 월급은 3500000원 입니다.
윤은해의 월급은 2000000원 입니다.

급여정보                                                                    
------------------------------------------------------------------------
전형돈의 월급은 2000000원 입니다.
장쯔위의 월급은 2550000원 입니다.
하동운의 월급은 2320000원 입니다.
방명수의 월급은 1380000원 입니다.
대북혼의 월급은 3760000원 입니다.
차태연의 월급은 2780000원 입니다.
전지연의 월급은 3660000원 입니다.
이오리의 월급은 2890000원 입니다.
임시환의 월급은 1550000원 입니다.
이중석의 월급은 2490000원 입니다.
유하진의 월급은 2480000원 입니다.

급여정보                                                                    
------------------------------------------------------------------------
이태림의 월급은 2436240원 입니다.

23개 행이 선택되었습니다. 


DE DEPT_TITLE                          LO
-- ----------------------------------- --
D1 인사관리부                          L1
D2 회계관리부                          L1
D3 마케팅부                            L1
D4 국내영업부                          L1
D5 해외영업1부                         L2
D6 해외영업2부                         L3
D7 해외영업3부                         L4
D8 기술지원부                          L5
D9 총무부                              L1

9개 행이 선택되었습니다. 


명령의 118 행에서 시작하는 중 오류 발생 -
SELECT DISTINCT DEPT_CODE
FROM EMLOYEE
오류 발생 명령행: 119 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 122 행에서 시작하는 중 오류 발생 -
SELECT DISTINCT JOB_CODE
FROM EMLOYEE
오류 발생 명령행: 123 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

명령의 127 행에서 시작하는 중 오류 발생 -
SELECT DISTINCT DEPT_CODE, JOB_CODE
FROM EMLOYEE
오류 발생 명령행: 128 열: 6
오류 보고 -
SQL 오류: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

EMP EMP_NAME             EMP_NO         EMAIL                     PHONE       DE JO     SALARY      BONUS MAN HIRE_DAT ENT_DATE E
--- -------------------- -------------- ------------------------- ----------- -- -- ---------- ---------- --- -------- -------- -
200 선동일               621230-1985634 sun_di@br.com             01099546325 D9 J1    8000000         .3     90/02/06          N
201 송종기               631105-1548654 song_jk@br.com            01045686656 D9 J2    6000000            200 01/09/01          N
202 노옹철               861015-1356452 no_hc@br.com              01066656263 D9 J2    1800000            201 01/01/01          N
203 송은희               631010-2653546 song_eh@br.com            01077607879 D6 J4    3900000            204 96/05/03          N
204 유재식               660508-1342154 yoo_js@br.com             01099999129 D6 J3    3400000         .2 200 00/12/29          N
205 정중하               770102-1357951 jung_jh@br.com            01036654875 D6 J3    2800000            204 99/09/09          N
206 박나라               630709-2054321 pack_nr@br.com            01096935222 D5 J7    3700000            207 08/04/02          N
207 하이유               690402-2040612 ha_iy@br.com              01036654488 D5 J5    2200000         .1 200 94/07/07          N
208 김해술               870927-1313564 kim_hs@br.com             01078634444 D5 J5    2500000            207 04/04/30          N
209 심봉선               750206-1325546 sim_bs@br.com             0113654485  D5 J3    3500000        .15 207 11/11/11          N
210 윤은해               650505-2356985 youn_eh@br.com            0179964233  D5 J7    2000000            207 01/02/03          N

EMP EMP_NAME             EMP_NO         EMAIL                     PHONE       DE JO     SALARY      BONUS MAN HIRE_DAT ENT_DATE E
--- -------------------- -------------- ------------------------- ----------- -- -- ---------- ---------- --- -------- -------- -
211 전형돈               830807-1121321 jun_hd@br.com             01044432222 D8 J6    2000000            200 12/12/12          N
212 장쯔위               780923-2234542 jang_zw@br.com            01066682224 D8 J6    2550000        .25 211 15/06/17          N
213 하동운               621111-1785463 ha_dh@br.com              01158456632    J6    2320000         .1     99/12/31          N
214 방명수               850918-1313513 bang_ms@br.com            01074127545 D1 J7    1380000            200 10/04/04          N
215 대북혼               881130-1050911 dae_bh@br.com             01088808584 D5 J5    3760000                17/06/19          N
216 차태연               770808-1364897 cha_ty@br.com             01064643212 D1 J6    2780000         .2 214 13/03/01          N
217 전지연               770808-2665412 jun_jy@br.com             01033624442 D1 J6    3660000         .3 214 07/03/20          N
218 이오리               870427-2232123 loo_or@br.com             01022306545    J7    2890000                16/11/28          N
219 임시환               660712-1212123 im_sw@br.com                          D2 J4    1550000                99/09/09          N
220 이중석               770823-1113111 lee_js@br.com                         D2 J4    2490000                14/09/18          N
221 유하진               800808-1123341 yoo_hj@br.com                         D2 J4    2480000                94/01/20          N

EMP EMP_NAME             EMP_NO         EMAIL                     PHONE       DE JO     SALARY      BONUS MAN HIRE_DAT ENT_DATE E
--- -------------------- -------------- ------------------------- ----------- -- -- ---------- ---------- --- -------- -------- -
222 이태림               760918-2854697 lee_tr@br.com             01033000002 D8 J6    2436240        .35 100 97/09/12 17/09/12 Y

23개 행이 선택되었습니다. 


EMP EMP_NAME                 SALARY
--- -------------------- ----------
200 선동일                  8000000
201 송종기                  6000000
202 노옹철                  1800000
203 송은희                  3900000
204 유재식                  3400000
205 정중하                  2800000
206 박나라                  3700000
207 하이유                  2200000
208 김해술                  2500000
209 심봉선                  3500000
210 윤은해                  2000000

EMP EMP_NAME                 SALARY
--- -------------------- ----------
211 전형돈                  2000000
212 장쯔위                  2550000
213 하동운                  2320000
214 방명수                  1380000
215 대북혼                  3760000
216 차태연                  2780000
217 전지연                  3660000
218 이오리                  2890000
219 임시환                  1550000
220 이중석                  2490000
221 유하진                  2480000

EMP EMP_NAME                 SALARY
--- -------------------- ----------
222 이태림                  2436240

23개 행이 선택되었습니다. 


JO JOB_NAME                           
-- -----------------------------------
J1 대표                               
J2 부사장                             
J3 부장                               
J4 차장                               
J5 과장                               
J6 대리                               
J7 사원                               

7개 행이 선택되었습니다. 


JOB_NAME                           
-----------------------------------
대표
부사장
부장
차장
과장
대리
사원

7개 행이 선택되었습니다. 


DE DEPT_TITLE                          LO
-- ----------------------------------- --
D1 인사관리부                          L1
D2 회계관리부                          L1
D3 마케팅부                            L1
D4 국내영업부                          L1
D5 해외영업1부                         L2
D6 해외영업2부                         L3
D7 해외영업3부                         L4
D8 기술지원부                          L5
D9 총무부                              L1

9개 행이 선택되었습니다. 


DE DEPT_TITLE                         
-- -----------------------------------
D1 인사관리부                         
D2 회계관리부                         
D3 마케팅부                           
D4 국내영업부                         
D5 해외영업1부                        
D6 해외영업2부                        
D7 해외영업3부                        
D8 기술지원부                         
D9 총무부                             

9개 행이 선택되었습니다. 


EMP_NAME             EMAIL                     PHONE       HIRE_DAT     SALARY
-------------------- ------------------------- ----------- -------- ----------
선동일               sun_di@br.com             01099546325 90/02/06    8000000
송종기               song_jk@br.com            01045686656 01/09/01    6000000
노옹철               no_hc@br.com              01066656263 01/01/01    1800000
송은희               song_eh@br.com            01077607879 96/05/03    3900000
유재식               yoo_js@br.com             01099999129 00/12/29    3400000
정중하               jung_jh@br.com            01036654875 99/09/09    2800000
박나라               pack_nr@br.com            01096935222 08/04/02    3700000
하이유               ha_iy@br.com              01036654488 94/07/07    2200000
김해술               kim_hs@br.com             01078634444 04/04/30    2500000
심봉선               sim_bs@br.com             0113654485  11/11/11    3500000
윤은해               youn_eh@br.com            0179964233  01/02/03    2000000

EMP_NAME             EMAIL                     PHONE       HIRE_DAT     SALARY
-------------------- ------------------------- ----------- -------- ----------
전형돈               jun_hd@br.com             01044432222 12/12/12    2000000
장쯔위               jang_zw@br.com            01066682224 15/06/17    2550000
하동운               ha_dh@br.com              01158456632 99/12/31    2320000
방명수               bang_ms@br.com            01074127545 10/04/04    1380000
대북혼               dae_bh@br.com             01088808584 17/06/19    3760000
차태연               cha_ty@br.com             01064643212 13/03/01    2780000
전지연               jun_jy@br.com             01033624442 07/03/20    3660000
이오리               loo_or@br.com             01022306545 16/11/28    2890000
임시환               im_sw@br.com                          99/09/09    1550000
이중석               lee_js@br.com                         14/09/18    2490000
유하진               yoo_hj@br.com                         94/01/20    2480000

EMP_NAME             EMAIL                     PHONE       HIRE_DAT     SALARY
-------------------- ------------------------- ----------- -------- ----------
이태림               lee_tr@br.com             01033000002 97/09/12    2436240

23개 행이 선택되었습니다. 


EMP_NAME              SALARY*12
-------------------- ----------
선동일                 96000000
송종기                 72000000
노옹철                 21600000
송은희                 46800000
유재식                 40800000
정중하                 33600000
박나라                 44400000
하이유                 26400000
김해술                 30000000
심봉선                 42000000
윤은해                 24000000

EMP_NAME              SALARY*12
-------------------- ----------
전형돈                 24000000
장쯔위                 30600000
하동운                 27840000
방명수                 16560000
대북혼                 45120000
차태연                 33360000
전지연                 43920000
이오리                 34680000
임시환                 18600000
이중석                 29880000
유하진                 29760000

EMP_NAME              SALARY*12
-------------------- ----------
이태림                 29234880

23개 행이 선택되었습니다. 


EMP_NAME                 SALARY      BONUS  SALARY*12 (SALARY+BONUS*SALARY)*12
-------------------- ---------- ---------- ---------- ------------------------
선동일                  8000000         .3   96000000                124800000
송종기                  6000000              72000000                         
노옹철                  1800000              21600000                         
송은희                  3900000              46800000                         
유재식                  3400000         .2   40800000                 48960000
정중하                  2800000              33600000                         
박나라                  3700000              44400000                         
하이유                  2200000         .1   26400000                 29040000
김해술                  2500000              30000000                         
심봉선                  3500000        .15   42000000                 48300000
윤은해                  2000000              24000000                         

EMP_NAME                 SALARY      BONUS  SALARY*12 (SALARY+BONUS*SALARY)*12
-------------------- ---------- ---------- ---------- ------------------------
전형돈                  2000000              24000000                         
장쯔위                  2550000        .25   30600000                 38250000
하동운                  2320000         .1   27840000                 30624000
방명수                  1380000              16560000                         
대북혼                  3760000              45120000                         
차태연                  2780000         .2   33360000                 40032000
전지연                  3660000         .3   43920000                 57096000
이오리                  2890000              34680000                         
임시환                  1550000              18600000                         
이중석                  2490000              29880000                         
유하진                  2480000              29760000                         

EMP_NAME                 SALARY      BONUS  SALARY*12 (SALARY+BONUS*SALARY)*12
-------------------- ---------- ---------- ---------- ------------------------
이태림                  2436240        .35   29234880                 39467088

23개 행이 선택되었습니다. 


SYSDATE 
--------
24/01/15


EMP_NAME             HIRE_DAT SYSDATE-HIRE_DATE
-------------------- -------- -----------------
선동일               90/02/06         12396.532
송종기               01/09/01        8171.53205
노옹철               01/01/01        8414.53205
송은희               96/05/03         10118.532
유재식               00/12/29        8417.53205
정중하               99/09/09        8894.53205
박나라               08/04/02        5766.53205
하이유               94/07/07         10784.532
김해술               04/04/30        7199.53205
심봉선               11/11/11        4448.53205
윤은해               01/02/03        8381.53205

EMP_NAME             HIRE_DAT SYSDATE-HIRE_DATE
-------------------- -------- -----------------
전형돈               12/12/12        4051.53205
장쯔위               15/06/17        3134.53205
하동운               99/12/31        8781.53205
방명수               10/04/04        5034.53205
대북혼               17/06/19        2401.53205
차태연               13/03/01        3972.53205
전지연               07/03/20        6145.53205
이오리               16/11/28        2604.53205
임시환               99/09/09        8894.53205
이중석               14/09/18        3406.53205
유하진               94/01/20         10952.532

EMP_NAME             HIRE_DAT SYSDATE-HIRE_DATE
-------------------- -------- -----------------
이태림               97/09/12        9621.53205

23개 행이 선택되었습니다. 


사원명                          급여      BONUS      연봉(원)       총 소득
-------------------- ---------- ---------- ---------- ----------
선동일                  8000000         .3   96000000  124800000
송종기                  6000000              72000000           
노옹철                  1800000              21600000           
송은희                  3900000              46800000           
유재식                  3400000         .2   40800000   48960000
정중하                  2800000              33600000           
박나라                  3700000              44400000           
하이유                  2200000         .1   26400000   29040000
김해술                  2500000              30000000           
심봉선                  3500000        .15   42000000   48300000
윤은해                  2000000              24000000           

사원명                          급여      BONUS      연봉(원)       총 소득
-------------------- ---------- ---------- ---------- ----------
전형돈                  2000000              24000000           
장쯔위                  2550000        .25   30600000   38250000
하동운                  2320000         .1   27840000   30624000
방명수                  1380000              16560000           
대북혼                  3760000              45120000           
차태연                  2780000         .2   33360000   40032000
전지연                  3660000         .3   43920000   57096000
이오리                  2890000              34680000           
임시환                  1550000              18600000           
이중석                  2490000              29880000           
유하진                  2480000              29760000           

사원명                          급여      BONUS      연봉(원)       총 소득
-------------------- ---------- ---------- ---------- ----------
이태림                  2436240        .35   29234880   39467088

23개 행이 선택되었습니다. 


EMP EMP_NAME                 SALARY 단
--- -------------------- ---------- -
200 선동일                  8000000 원
201 송종기                  6000000 원
202 노옹철                  1800000 원
203 송은희                  3900000 원
204 유재식                  3400000 원
205 정중하                  2800000 원
206 박나라                  3700000 원
207 하이유                  2200000 원
208 김해술                  2500000 원
209 심봉선                  3500000 원
210 윤은해                  2000000 원

EMP EMP_NAME                 SALARY 단
--- -------------------- ---------- -
211 전형돈                  2000000 원
212 장쯔위                  2550000 원
213 하동운                  2320000 원
214 방명수                  1380000 원
215 대북혼                  3760000 원
216 차태연                  2780000 원
217 전지연                  3660000 원
218 이오리                  2890000 원
219 임시환                  1550000 원
220 이중석                  2490000 원
221 유하진                  2480000 원

EMP EMP_NAME                 SALARY 단
--- -------------------- ---------- -
222 이태림                  2436240 원

23개 행이 선택되었습니다. 


EMP_ID||EMP_NAME||SALARY                                       
---------------------------------------------------------------
200선동일8000000
201송종기6000000
202노옹철1800000
203송은희3900000
204유재식3400000
205정중하2800000
206박나라3700000
207하이유2200000
208김해술2500000
209심봉선3500000
210윤은해2000000

EMP_ID||EMP_NAME||SALARY                                       
---------------------------------------------------------------
211전형돈2000000
212장쯔위2550000
213하동운2320000
214방명수1380000
215대북혼3760000
216차태연2780000
217전지연3660000
218이오리2890000
219임시환1550000
220이중석2490000
221유하진2480000

EMP_ID||EMP_NAME||SALARY                                       
---------------------------------------------------------------
222이태림2436240

23개 행이 선택되었습니다. 


급여정보                                                                    
------------------------------------------------------------------------
선동일의 월급은 8000000원 입니다.
송종기의 월급은 6000000원 입니다.
노옹철의 월급은 1800000원 입니다.
송은희의 월급은 3900000원 입니다.
유재식의 월급은 3400000원 입니다.
정중하의 월급은 2800000원 입니다.
박나라의 월급은 3700000원 입니다.
하이유의 월급은 2200000원 입니다.
김해술의 월급은 2500000원 입니다.
심봉선의 월급은 3500000원 입니다.
윤은해의 월급은 2000000원 입니다.

급여정보                                                                    
------------------------------------------------------------------------
전형돈의 월급은 2000000원 입니다.
장쯔위의 월급은 2550000원 입니다.
하동운의 월급은 2320000원 입니다.
방명수의 월급은 1380000원 입니다.
대북혼의 월급은 3760000원 입니다.
차태연의 월급은 2780000원 입니다.
전지연의 월급은 3660000원 입니다.
이오리의 월급은 2890000원 입니다.
임시환의 월급은 1550000원 입니다.
이중석의 월급은 2490000원 입니다.
유하진의 월급은 2480000원 입니다.

급여정보                                                                    
------------------------------------------------------------------------
이태림의 월급은 2436240원 입니다.

23개 행이 선택되었습니다. 


DE DEPT_TITLE                          LO
-- ----------------------------------- --
D1 인사관리부                          L1
D2 회계관리부                          L1
D3 마케팅부                            L1
D4 국내영업부                          L1
D5 해외영업1부                         L2
D6 해외영업2부                         L3
D7 해외영업3부                         L4
D8 기술지원부                          L5
D9 총무부                              L1

9개 행이 선택되었습니다. 


DE
--

D1
D9
D5
D6
D2
D8

7개 행이 선택되었습니다. 


JO
--
J2
J7
J3
J6
J5
J1
J4

7개 행이 선택되었습니다. 


DE JO
-- --
D6 J3
D8 J6
   J7
D2 J4
D6 J4
D5 J7
D5 J3
D9 J1
D5 J5
   J6
D1 J7

DE JO
-- --
D1 J6
D9 J2

13개 행이 선택되었습니다. 


EMP EMP_NAME             EMP_NO         EMAIL                     PHONE       DE JO     SALARY      BONUS MAN HIRE_DAT ENT_DATE E
--- -------------------- -------------- ------------------------- ----------- -- -- ---------- ---------- --- -------- -------- -
200 선동일               621230-1985634 sun_di@br.com             01099546325 D9 J1    8000000         .3     90/02/06          N
201 송종기               631105-1548654 song_jk@br.com            01045686656 D9 J2    6000000            200 01/09/01          N
202 노옹철               861015-1356452 no_hc@br.com              01066656263 D9 J2    1800000            201 01/01/01          N
203 송은희               631010-2653546 song_eh@br.com            01077607879 D6 J4    3900000            204 96/05/03          N
204 유재식               660508-1342154 yoo_js@br.com             01099999129 D6 J3    3400000         .2 200 00/12/29          N
205 정중하               770102-1357951 jung_jh@br.com            01036654875 D6 J3    2800000            204 99/09/09          N
206 박나라               630709-2054321 pack_nr@br.com            01096935222 D5 J7    3700000            207 08/04/02          N
207 하이유               690402-2040612 ha_iy@br.com              01036654488 D5 J5    2200000         .1 200 94/07/07          N
208 김해술               870927-1313564 kim_hs@br.com             01078634444 D5 J5    2500000            207 04/04/30          N
209 심봉선               750206-1325546 sim_bs@br.com             0113654485  D5 J3    3500000        .15 207 11/11/11          N
210 윤은해               650505-2356985 youn_eh@br.com            0179964233  D5 J7    2000000            207 01/02/03          N

EMP EMP_NAME             EMP_NO         EMAIL                     PHONE       DE JO     SALARY      BONUS MAN HIRE_DAT ENT_DATE E
--- -------------------- -------------- ------------------------- ----------- -- -- ---------- ---------- --- -------- -------- -
211 전형돈               830807-1121321 jun_hd@br.com             01044432222 D8 J6    2000000            200 12/12/12          N
212 장쯔위               780923-2234542 jang_zw@br.com            01066682224 D8 J6    2550000        .25 211 15/06/17          N
213 하동운               621111-1785463 ha_dh@br.com              01158456632    J6    2320000         .1     99/12/31          N
214 방명수               850918-1313513 bang_ms@br.com            01074127545 D1 J7    1380000            200 10/04/04          N
215 대북혼               881130-1050911 dae_bh@br.com             01088808584 D5 J5    3760000                17/06/19          N
216 차태연               770808-1364897 cha_ty@br.com             01064643212 D1 J6    2780000         .2 214 13/03/01          N
217 전지연               770808-2665412 jun_jy@br.com             01033624442 D1 J6    3660000         .3 214 07/03/20          N
218 이오리               870427-2232123 loo_or@br.com             01022306545    J7    2890000                16/11/28          N
219 임시환               660712-1212123 im_sw@br.com                          D2 J4    1550000                99/09/09          N
220 이중석               770823-1113111 lee_js@br.com                         D2 J4    2490000                14/09/18          N
221 유하진               800808-1123341 yoo_hj@br.com                         D2 J4    2480000                94/01/20          N

EMP EMP_NAME             EMP_NO         EMAIL                     PHONE       DE JO     SALARY      BONUS MAN HIRE_DAT ENT_DATE E
--- -------------------- -------------- ------------------------- ----------- -- -- ---------- ---------- --- -------- -------- -
222 이태림               760918-2854697 lee_tr@br.com             01033000002 D8 J6    2436240        .35 100 97/09/12 17/09/12 Y

23개 행이 선택되었습니다. 


EMP EMP_NAME                 SALARY
--- -------------------- ----------
200 선동일                  8000000
201 송종기                  6000000
202 노옹철                  1800000
203 송은희                  3900000
204 유재식                  3400000
205 정중하                  2800000
206 박나라                  3700000
207 하이유                  2200000
208 김해술                  2500000
209 심봉선                  3500000
210 윤은해                  2000000

EMP EMP_NAME                 SALARY
--- -------------------- ----------
211 전형돈                  2000000
212 장쯔위                  2550000
213 하동운                  2320000
214 방명수                  1380000
215 대북혼                  3760000
216 차태연                  2780000
217 전지연                  3660000
218 이오리                  2890000
219 임시환                  1550000
220 이중석                  2490000
221 유하진                  2480000

EMP EMP_NAME                 SALARY
--- -------------------- ----------
222 이태림                  2436240

23개 행이 선택되었습니다. 


JO JOB_NAME                           
-- -----------------------------------
J1 대표                               
J2 부사장                             
J3 부장                               
J4 차장                               
J5 과장                               
J6 대리                               
J7 사원                               

7개 행이 선택되었습니다. 


JOB_NAME                           
-----------------------------------
대표
부사장
부장
차장
과장
대리
사원

7개 행이 선택되었습니다. 


DE DEPT_TITLE                          LO
-- ----------------------------------- --
D1 인사관리부                          L1
D2 회계관리부                          L1
D3 마케팅부                            L1
D4 국내영업부                          L1
D5 해외영업1부                         L2
D6 해외영업2부                         L3
D7 해외영업3부                         L4
D8 기술지원부                          L5
D9 총무부                              L1

9개 행이 선택되었습니다. 


DE DEPT_TITLE                         
-- -----------------------------------
D1 인사관리부                         
D2 회계관리부                         
D3 마케팅부                           
D4 국내영업부                         
D5 해외영업1부                        
D6 해외영업2부                        
D7 해외영업3부                        
D8 기술지원부                         
D9 총무부                             

9개 행이 선택되었습니다. 


EMP_NAME             EMAIL                     PHONE       HIRE_DAT     SALARY
-------------------- ------------------------- ----------- -------- ----------
선동일               sun_di@br.com             01099546325 90/02/06    8000000
송종기               song_jk@br.com            01045686656 01/09/01    6000000
노옹철               no_hc@br.com              01066656263 01/01/01    1800000
송은희               song_eh@br.com            01077607879 96/05/03    3900000
유재식               yoo_js@br.com             01099999129 00/12/29    3400000
정중하               jung_jh@br.com            01036654875 99/09/09    2800000
박나라               pack_nr@br.com            01096935222 08/04/02    3700000
하이유               ha_iy@br.com              01036654488 94/07/07    2200000
김해술               kim_hs@br.com             01078634444 04/04/30    2500000
심봉선               sim_bs@br.com             0113654485  11/11/11    3500000
윤은해               youn_eh@br.com            0179964233  01/02/03    2000000

EMP_NAME             EMAIL                     PHONE       HIRE_DAT     SALARY
-------------------- ------------------------- ----------- -------- ----------
전형돈               jun_hd@br.com             01044432222 12/12/12    2000000
장쯔위               jang_zw@br.com            01066682224 15/06/17    2550000
하동운               ha_dh@br.com              01158456632 99/12/31    2320000
방명수               bang_ms@br.com            01074127545 10/04/04    1380000
대북혼               dae_bh@br.com             01088808584 17/06/19    3760000
차태연               cha_ty@br.com             01064643212 13/03/01    2780000
전지연               jun_jy@br.com             01033624442 07/03/20    3660000
이오리               loo_or@br.com             01022306545 16/11/28    2890000
임시환               im_sw@br.com                          99/09/09    1550000
이중석               lee_js@br.com                         14/09/18    2490000
유하진               yoo_hj@br.com                         94/01/20    2480000

EMP_NAME             EMAIL                     PHONE       HIRE_DAT     SALARY
-------------------- ------------------------- ----------- -------- ----------
이태림               lee_tr@br.com             01033000002 97/09/12    2436240

23개 행이 선택되었습니다. 


EMP_NAME              SALARY*12
-------------------- ----------
선동일                 96000000
송종기                 72000000
노옹철                 21600000
송은희                 46800000
유재식                 40800000
정중하                 33600000
박나라                 44400000
하이유                 26400000
김해술                 30000000
심봉선                 42000000
윤은해                 24000000

EMP_NAME              SALARY*12
-------------------- ----------
전형돈                 24000000
장쯔위                 30600000
하동운                 27840000
방명수                 16560000
대북혼                 45120000
차태연                 33360000
전지연                 43920000
이오리                 34680000
임시환                 18600000
이중석                 29880000
유하진                 29760000

EMP_NAME              SALARY*12
-------------------- ----------
이태림                 29234880

23개 행이 선택되었습니다. 


EMP_NAME                 SALARY      BONUS  SALARY*12 (SALARY+BONUS*SALARY)*12
-------------------- ---------- ---------- ---------- ------------------------
선동일                  8000000         .3   96000000                124800000
송종기                  6000000              72000000                         
노옹철                  1800000              21600000                         
송은희                  3900000              46800000                         
유재식                  3400000         .2   40800000                 48960000
정중하                  2800000              33600000                         
박나라                  3700000              44400000                         
하이유                  2200000         .1   26400000                 29040000
김해술                  2500000              30000000                         
심봉선                  3500000        .15   42000000                 48300000
윤은해                  2000000              24000000                         

EMP_NAME                 SALARY      BONUS  SALARY*12 (SALARY+BONUS*SALARY)*12
-------------------- ---------- ---------- ---------- ------------------------
전형돈                  2000000              24000000                         
장쯔위                  2550000        .25   30600000                 38250000
하동운                  2320000         .1   27840000                 30624000
방명수                  1380000              16560000                         
대북혼                  3760000              45120000                         
차태연                  2780000         .2   33360000                 40032000
전지연                  3660000         .3   43920000                 57096000
이오리                  2890000              34680000                         
임시환                  1550000              18600000                         
이중석                  2490000              29880000                         
유하진                  2480000              29760000                         

EMP_NAME                 SALARY      BONUS  SALARY*12 (SALARY+BONUS*SALARY)*12
-------------------- ---------- ---------- ---------- ------------------------
이태림                  2436240        .35   29234880                 39467088

23개 행이 선택되었습니다. 


SYSDATE 
--------
24/01/15


EMP_NAME             HIRE_DAT SYSDATE-HIRE_DATE
-------------------- -------- -----------------
선동일               90/02/06        12396.5328
송종기               01/09/01        8171.53275
노옹철               01/01/01        8414.53275
송은희               96/05/03        10118.5328
유재식               00/12/29        8417.53275
정중하               99/09/09        8894.53275
박나라               08/04/02        5766.53275
하이유               94/07/07        10784.5328
김해술               04/04/30        7199.53275
심봉선               11/11/11        4448.53275
윤은해               01/02/03        8381.53275

EMP_NAME             HIRE_DAT SYSDATE-HIRE_DATE
-------------------- -------- -----------------
전형돈               12/12/12        4051.53275
장쯔위               15/06/17        3134.53275
하동운               99/12/31        8781.53275
방명수               10/04/04        5034.53275
대북혼               17/06/19        2401.53275
차태연               13/03/01        3972.53275
전지연               07/03/20        6145.53275
이오리               16/11/28        2604.53275
임시환               99/09/09        8894.53275
이중석               14/09/18        3406.53275
유하진               94/01/20        10952.5328

EMP_NAME             HIRE_DAT SYSDATE-HIRE_DATE
-------------------- -------- -----------------
이태림               97/09/12        9621.53275

23개 행이 선택되었습니다. 


사원명                          급여      BONUS      연봉(원)       총 소득
-------------------- ---------- ---------- ---------- ----------
선동일                  8000000         .3   96000000  124800000
송종기                  6000000              72000000           
노옹철                  1800000              21600000           
송은희                  3900000              46800000           
유재식                  3400000         .2   40800000   48960000
정중하                  2800000              33600000           
박나라                  3700000              44400000           
하이유                  2200000         .1   26400000   29040000
김해술                  2500000              30000000           
심봉선                  3500000        .15   42000000   48300000
윤은해                  2000000              24000000           

사원명                          급여      BONUS      연봉(원)       총 소득
-------------------- ---------- ---------- ---------- ----------
전형돈                  2000000              24000000           
장쯔위                  2550000        .25   30600000   38250000
하동운                  2320000         .1   27840000   30624000
방명수                  1380000              16560000           
대북혼                  3760000              45120000           
차태연                  2780000         .2   33360000   40032000
전지연                  3660000         .3   43920000   57096000
이오리                  2890000              34680000           
임시환                  1550000              18600000           
이중석                  2490000              29880000           
유하진                  2480000              29760000           

사원명                          급여      BONUS      연봉(원)       총 소득
-------------------- ---------- ---------- ---------- ----------
이태림                  2436240        .35   29234880   39467088

23개 행이 선택되었습니다. 


EMP EMP_NAME                 SALARY 단
--- -------------------- ---------- -
200 선동일                  8000000 원
201 송종기                  6000000 원
202 노옹철                  1800000 원
203 송은희                  3900000 원
204 유재식                  3400000 원
205 정중하                  2800000 원
206 박나라                  3700000 원
207 하이유                  2200000 원
208 김해술                  2500000 원
209 심봉선                  3500000 원
210 윤은해                  2000000 원

EMP EMP_NAME                 SALARY 단
--- -------------------- ---------- -
211 전형돈                  2000000 원
212 장쯔위                  2550000 원
213 하동운                  2320000 원
214 방명수                  1380000 원
215 대북혼                  3760000 원
216 차태연                  2780000 원
217 전지연                  3660000 원
218 이오리                  2890000 원
219 임시환                  1550000 원
220 이중석                  2490000 원
221 유하진                  2480000 원

EMP EMP_NAME                 SALARY 단
--- -------------------- ---------- -
222 이태림                  2436240 원

23개 행이 선택되었습니다. 


EMP_ID||EMP_NAME||SALARY                                       
---------------------------------------------------------------
200선동일8000000
201송종기6000000
202노옹철1800000
203송은희3900000
204유재식3400000
205정중하2800000
206박나라3700000
207하이유2200000
208김해술2500000
209심봉선3500000
210윤은해2000000

EMP_ID||EMP_NAME||SALARY                                       
---------------------------------------------------------------
211전형돈2000000
212장쯔위2550000
213하동운2320000
214방명수1380000
215대북혼3760000
216차태연2780000
217전지연3660000
218이오리2890000
219임시환1550000
220이중석2490000
221유하진2480000

EMP_ID||EMP_NAME||SALARY                                       
---------------------------------------------------------------
222이태림2436240

23개 행이 선택되었습니다. 


급여정보                                                                    
------------------------------------------------------------------------
선동일의 월급은 8000000원 입니다.
송종기의 월급은 6000000원 입니다.
노옹철의 월급은 1800000원 입니다.
송은희의 월급은 3900000원 입니다.
유재식의 월급은 3400000원 입니다.
정중하의 월급은 2800000원 입니다.
박나라의 월급은 3700000원 입니다.
하이유의 월급은 2200000원 입니다.
김해술의 월급은 2500000원 입니다.
심봉선의 월급은 3500000원 입니다.
윤은해의 월급은 2000000원 입니다.

급여정보                                                                    
------------------------------------------------------------------------
전형돈의 월급은 2000000원 입니다.
장쯔위의 월급은 2550000원 입니다.
하동운의 월급은 2320000원 입니다.
방명수의 월급은 1380000원 입니다.
대북혼의 월급은 3760000원 입니다.
차태연의 월급은 2780000원 입니다.
전지연의 월급은 3660000원 입니다.
이오리의 월급은 2890000원 입니다.
임시환의 월급은 1550000원 입니다.
이중석의 월급은 2490000원 입니다.
유하진의 월급은 2480000원 입니다.

급여정보                                                                    
------------------------------------------------------------------------
이태림의 월급은 2436240원 입니다.

23개 행이 선택되었습니다. 


DE DEPT_TITLE                          LO
-- ----------------------------------- --
D1 인사관리부                          L1
D2 회계관리부                          L1
D3 마케팅부                            L1
D4 국내영업부                          L1
D5 해외영업1부                         L2
D6 해외영업2부                         L3
D7 해외영업3부                         L4
D8 기술지원부                          L5
D9 총무부                              L1

9개 행이 선택되었습니다. 


DE
--

D1
D9
D5
D6
D2
D8

7개 행이 선택되었습니다. 


JO
--
J2
J7
J3
J6
J5
J1
J4

7개 행이 선택되었습니다. 


DE JO
-- --
D6 J3
D8 J6
   J7
D2 J4
D6 J4
D5 J7
D5 J3
D9 J1
D5 J5
   J6
D1 J7

DE JO
-- --
D1 J6
D9 J2

13개 행이 선택되었습니다. 

