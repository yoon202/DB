-------------------------------------------------
-- 1) STUDENT 테이블
-------------------------------------------------
CREATE TABLE STUDENT (
    STUDENT_ID   NUMBER        CONSTRAINT PK_STUDENT PRIMARY KEY,
    NAME         VARCHAR2(30)  NOT NULL,
    DEPT         VARCHAR2(30),
    GRADE        NUMBER(1),
    PHONE        VARCHAR2(20),
    CONSTRAINT CK_STUDENT_GRADE CHECK (GRADE BETWEEN 1 AND 4)
);

-------------------------------------------------
-- 2) PROFESSOR 테이블
-------------------------------------------------
CREATE TABLE PROFESSOR (
    PROFESSOR_ID  NUMBER        CONSTRAINT PK_PROFESSOR PRIMARY KEY,
    NAME          VARCHAR2(30)  NOT NULL,
    DEPT          VARCHAR2(30)
);

-------------------------------------------------
-- 3) COURSE 테이블
-------------------------------------------------
CREATE TABLE COURSE (
    COURSE_ID     NUMBER        CONSTRAINT PK_COURSE PRIMARY KEY,
    TITLE         VARCHAR2(50)  NOT NULL,
    CREDIT        NUMBER(1),
    PROFESSOR_ID  NUMBER,
    CONSTRAINT FK_COURSE_PROF
        FOREIGN KEY (PROFESSOR_ID)
        REFERENCES PROFESSOR(PROFESSOR_ID),
    CONSTRAINT CK_COURSE_CREDIT CHECK (CREDIT BETWEEN 1 AND 5)
);

-------------------------------------------------
-- 4) ENROLL 테이블
-------------------------------------------------
CREATE TABLE ENROLL (
    ENROLL_ID   NUMBER         CONSTRAINT PK_ENROLL PRIMARY KEY,
    STUDENT_ID  NUMBER         NOT NULL,
    COURSE_ID   NUMBER         NOT NULL,
    CONSTRAINT FK_ENROLL_STU
        FOREIGN KEY (STUDENT_ID)
        REFERENCES STUDENT(STUDENT_ID),
    CONSTRAINT FK_ENROLL_COU
        FOREIGN KEY (COURSE_ID)
        REFERENCES COURSE(COURSE_ID),
    CONSTRAINT UQ_ENROLL_STU_COU
        UNIQUE (STUDENT_ID, COURSE_ID)
);

-------------------------------------------------
-- 5) ATTENDANCE 테이블
-------------------------------------------------
CREATE TABLE ATTENDANCE (
    ATTENDANCE_ID  NUMBER       CONSTRAINT PK_ATTEND PRIMARY KEY,
    ENROLL_ID      NUMBER       NOT NULL,
    ATTEND_DATE    DATE         NOT NULL,
    STATUS         CHAR(1)      NOT NULL,
    CONSTRAINT FK_ATTEND_ENROLL
        FOREIGN KEY (ENROLL_ID)
        REFERENCES ENROLL(ENROLL_ID),
    CONSTRAINT CK_ATTEND_STATUS
        CHECK (STATUS IN ('O','T','A')),
    CONSTRAINT UQ_ATTEND_ENROLL_DATE
        UNIQUE (ENROLL_ID, ATTEND_DATE)
);

-------------------------------------------------
-- 6) SEQUENCE 생성
-------------------------------------------------
CREATE SEQUENCE SEQ_STUDENT START WITH 1001 INCREMENT BY 1;
CREATE SEQUENCE SEQ_PROFESSOR START WITH 2001 INCREMENT BY 1;
CREATE SEQUENCE SEQ_COURSE START WITH 3001 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ENROLL START WITH 4001 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ATTENDANCE START WITH 5001 INCREMENT BY 1;

-------------------------------------------------
-- 7) INDEX 생성 (물리적 설계에서 설명한 내용과 일치)
-------------------------------------------------
CREATE INDEX IDX_ENROLL_STU
    ON ENROLL(STUDENT_ID);

CREATE INDEX IDX_ENROLL_COU
    ON ENROLL(COURSE_ID);

CREATE INDEX IDX_ATTEND_ENROLL
    ON ATTENDANCE(ENROLL_ID);

CREATE INDEX IDX_ATTEND_ENROLL_DATE
    ON ATTENDANCE(ENROLL_ID, ATTEND_DATE);

CREATE INDEX IDX_COURSE_PROF
    ON COURSE(PROFESSOR_ID);
