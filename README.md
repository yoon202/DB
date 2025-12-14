# 학생 출결 관리 데이터베이스 (Student Attendance Management DB)

## 1. 프로젝트 개요
본 프로젝트는 대학 강의 환경에서 학생 출결을 체계적으로 관리하기 위한  
**학생 출결 관리 데이터베이스 설계 및 구현**을 목표로 한다.

학생, 교수, 강의, 수강, 출결 정보를 관계형 데이터베이스로 통합 관리하여  
출결 등록, 조회, 통계 분석이 가능하도록 설계하였다.

---

## 2. 개발 환경
- **DBMS** : Oracle Database
- **개발 도구** : Oracle SQL Developer
- **언어** : SQL (DDL / DML)
- **플랫폼** : Windows

---

## 3. 데이터베이스 구성

### 3.1 테이블 목록 및 설명

| 테이블명 | 설명 |
|----------|------|
| STUDENT | 학생 기본 정보 관리 |
| PROFESSOR | 교수 정보 관리 |
| COURSE | 강의(과목) 정보 관리 |
| ENROLL | 학생 수강 신청 정보 관리 |
| ATTENDANCE | 수업 일자별 출결 정보 관리 |

---

### 3.2 테이블 관계 개요

- STUDENT 1 : N ENROLL  
- COURSE 1 : N ENROLL  
- COURSE 1 : 1 PROFESSOR  
- ENROLL 1 : N ATTENDANCE  

모든 테이블은 제3정규형(3NF)을 만족하도록 설계되었으며,  
외래키를 통해 참조 무결성을 유지한다.

---

## 4. 주요 기능

### 4.1 학생 관리
- 학생 정보 등록 / 조회 / 수정 / 삭제
- 학과 및 학년별 학생 조회

### 4.2 교수 및 강의 관리
- 교수 정보 관리
- 교수별 담당 강의 조회
- 강의 학점 및 담당 교수 관리

### 4.3 수강 관리
- 학생 수강 신청 관리
- 중복 수강 신청 방지

### 4.4 출결 관리
- 수업 일자별 출결 등록 (출석 / 지각 / 결석)
- 학생별, 강의별 출결 조회
- 출석률 계산

### 4.5 통계 조회
- 학생별 출석률 조회
- 강의별 평균 출석률
- 결석/지각 발생 학생 조회

---

## 5. SQL 스크립트 구성

| 파일명 | 내용 |
|------|------|
| `attendance_ddl.sql` | 테이블, 제약조건, 시퀀스, 인덱스 생성 |
| `attendance_data.sql` | 초기 테스트 데이터 INSERT |
| `attendance_queries.sql` | SELECT / UPDATE / DELETE SQL 30문제 |

---

## 6. 실행 방법

1. Oracle SQL Developer에서 데이터베이스 접속
2. 아래 순서대로 SQL 스크립트 실행

```text
1) attendance_ddl.sql
2) attendance_data.sql
3) attendance_queries.sql
