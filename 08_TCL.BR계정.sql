/*
TCL (TRANSACTION CONTROL LANGUAGE)
트랜젝션 제어 언어

트랜젝션(TRACSACTION)
데이터베이스의 논리적인 연산단위
데이터의 변경사항(DML)들을 하나으 트랜젝션에 묶어서 관리
DML문 한개를 수행할 때 트랜젝션이 존재할 경우 해당 트렌잭션에 같이 묶어서 처리-트랜젝이 존재하지않으면 트랜잭션을 새로 만들어 묶어처리
COMMIT하기 전까지의 변경사항들을 하나의 트랜잭션으로 묶어처리

COMMIT; 진행 : 현재 이 트랜잭션에 담겨있는 변경사항들을 실제 DB에 반영시키겠다
ROLLBACK; 진행: 현재 이 트랜잭션에 담겨있는 변경사항들을 삭제(취소)한 후 마지막 커밋시점으로 돌아감
SAVEPOINT(임시저장) 포인트명; : 현재 이 시점에 해당 포인트 명으로 임시 저장점을 저장해두는 개념
ROLLBACK진행시 전체 취소가 아니라 일부만 롤백가능

*/

COMMIT;
--EMPLOYEE_COPY 테이블
SELECT * FROM EMPLOYEE_COPY;

--200사원 삭제 
DELETE FROM EMPLOYEE_COPY
WHERE EMP_ID = 200;

--송종기 사원의 부서코드 D3로 변경
UPDATE EMPLOYEE_COPY
SET DEPT_CODE = 'D3'
WHERE EMP_NAME = '송종기';
COMMIT;

------------------------
--216,217,214 사원
DELETE FROM EMPLOYEE_COPY
WHERE EMP_ID IN (216 ,217 ,214);

SAVEPOINT SP;

UPDATE EMPLOYEE_COPY
SET BONUS = 0.7
WHERE EMP_ID = 201;

DELETE FROM EMPLOYEE_COPY
WHERE EMP_NAME ='노옹철';

SELECT * FROM EMPLOYEE_COPY;

ROLLBACK TO SP;
COMMIT;

-----------------------------------------

--202, 203 지우기
DELETE FROM EMPLOYEE_COPY
WHERE EMP_ID IN (202,203);

--219
DELETE FROM EMPLOYEE_COPY
WHERE EMP_ID  = 219;

CREATE TABLE SAMPLE( -->DDL문 실행시 무조건 커밋 같이 실행, 이전 것들 롤백할 수 없음.
-->DDL문 수행 전 수정해야할 것이 있다면 커밋이나, 롤백으로 확정하고 실행
    SID NUMBER
);

ROLLBACK;
SELECT * FROM EMPLOYEE_COPY;

/*
기능별로 트랜젝션으로 묶어 관리

EX) 게시글 작성기능(제목, 내용, 첨부파일)
게시글 테이블 : 게시글 번호, 게목, 내용, 작성자, 작성일 ....
첨부파일 테이블 : 첨부파일번호, 청부파일명, 용량, 저장경로...참조하는 게시글 번호(FK)

1.INSERT INTO 게시글
2.INSERT INTO 첨부파일테이블

게시글은 성공했으나 첨부파일 INSERT에 문제가 있을경우 -> 작성기능 실패 CASE ->ROLLBACK -> 게시글에 INSERT되었던 데이터가 사라짐.
제대로 실행되면 COMMIT; 


*/