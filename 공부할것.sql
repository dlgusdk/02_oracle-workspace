CREATE TABLE TB_DEPARTMENT(
      DEPARTMENT_NO  VARCHAR2(10) PRIMARY KEY,
      DEPARTMENT_NAME VARCHAR2(20) NOT NULL,
      CATEGORY VARCHAR2(20),
      OPEN_YN CHAR(1),
      CAPACITY NUMBER
);



CREATE  TABLE TB_STUDENT(
    STUDENT_NO VARCHAR2(10) PRIMARY KEY,
    DEPARTMENT_NO VARCHAR2(10)  REFERENCES TB_DEPARTMENT,
   COACH_PROFESSOR_NO VARCHAR2(10),
   ABSENCE_YN CHAR(1)  CHECK(ABSENCE_YN, 'Y', 'N'),
   FOREIGN KEY (COACH_PROFESSOR_NO) REFERENCES TB_PROFESSOR
);



//*
--생성 (컬러레벨, 테이블레벨(외래키(외래키 제약조건 설정시 삭제관련 옵션), 기본키), 특정 컬럼에 제약, 값 제시, 복사본)
CREATE  TABLE
CONSTRAINTS
CHECK
FOREIGN KEY(컬러명) REFERENCES
-ON DELETE RESTRICTED (기본값) :삭제제한 옵션,자식데이터를 사용하고있으면 부모데이터 삭제안됨
-ON DELETE SET NULL(무조건 삭제해 바꿔서 널로) : 부모데이터 삭제시 해당 데이터를 쓰고 있는 지식데이터 값을 NULL로 변경
-ON DELETE SET  CASCADE : 부모데이터 삭제시 해당 데이터를 쓰고 있는 지식데이터 값을 같이 삭제시키겠다

추가06(DDL)
-방법1. 테이블의 모든 컬럼값을 다 제시해서 한 행 INSERT하는 법 
--방법 2. 테이블의 특정 컬럼만 저장해서 그 컬럼에 추가하고자하는 값만 제시하는 방법
INSERT INTO

수정(07_DML)
UPDATE 테이블명 
SET

조회(07_DML)
두개 이상의 테이블에 각각 INSERT할 때 이때 사용되는 서브쿼리가 동일할 경우
 INSERT ALL
        INTO 테이블명 1 VALUES (컬럼명, 컬럼명, ...)
        INTO 테이블명 2 VALUES (컬럼명, 컬럼명, ...)
                    서브쿼리;
                    
                    ]
                    
                    
컬럼삭제

되돌리기 
ROLLBACK;

현재상태까지 저장
COMMIT;

테이블삭제
DROP TABLE

컬럼에 주석 달기(컬럼에 대한 설명같은거)

[표현법]
COMMENT ON COLUMN 테이블명.컬럼명 IS '주석내용';
>>잘못 실행했을 경우 수정한 후 다시 실행 


이름바꾸기(제약명, 커럶명, 테이블명)*/
RENAME 

제약조건 삭제 06_DDL(얼터)