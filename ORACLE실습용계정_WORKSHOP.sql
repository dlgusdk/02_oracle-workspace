--1
SELECT BOOK_NO, BOOK_NM
FROM TB_BOOK
WHERE LENGTH(BOOK_NM) IN (25);
--LENGTH IN 길이

--2
SELECT WRITER_NM, OFFICE_TELNO, HOME_TELNO, MOBILE_NO, ROWNUM
FROM (SELECT WRITER_NM, OFFICE_TELNO, HOME_TELNO, MOBILE_NO
             FROM TB_WRITER
             WHERE MOBILE_NO LIKE '019%' AND WRITER_NM LIKE '김%'
             ORDER BY WRITER_NM ASC)
WHERE ROWNUM <= 1;   --ROWNUM조회된 순서에서 지정한만큼 나눠 조회

--3
SELECT  COUNT(DISTINCT WRITER_NM)"작가(명)"
FROM TB_WRITER
JOIN TB_BOOK_AUTHOR USING (WRITER_NO)
WHERE COMPOSE_TYPE = '옮김';

--4
SELECT BA.COMPOSE_TYPE"저작형태", COUNT(BK.STOCK_QTY)"권 수"
FROM TB_BOOK BK
JOIN TB_BOOK_AUTHOR BA ON (BK.BOOK_NO = BA.BOOK_NO)
GROUP BY BA.COMPOSE_TYPE
HAVING COUNT(BA.COMPOSE_TYPE) >= 300 ;

--5
SELECT BOOK_NM, ISSUE_DATE, PUBLISHER_NM, ROWNUM
FROM (
            SELECT BOOK_NM, ISSUE_DATE, PUBLISHER_NM
            FROM TB_BOOK
            ORDER BY ISSUE_DATE DESC
            )
  WHERE ROWNUM <= 1;


--6
SELECT E.WRITER_NM "작가이름",  E. "권 수"
FROM 
            (
            SELECT W.WRITER_NM, COUNT(BA.WRITER_NO) "권 수"
            FROM TB_BOOK_AUTHOR  BA
            JOIN TB_WRITER W ON (W.WRITER_NO = BA.WRITER_NO)
            GROUP BY W.WRITER_NM, BA.WRITER_NO
            ORDER BY COUNT(BA.WRITER_NO) DESC
            ) E
 WHERE ROWNUM <= 3;


--7                                        
UPDATE TB_WRITER W
SET W.REGIST_DATE = ( SELECT MIN(ISSUE_DATE) 
                                               FROM TB_BOOK_AUTHOR BA
                                               JOIN TB_BOOK B ON (B.BOOK_NO = BA.BOOK_NO)
                                               GROUP BY W.WRITER_NM
                                                 );
COMMIT;


--8

