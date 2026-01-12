CREATE TABLE DATA (
    deptno VARCHAR2(6) PRIMARY KEY,
    dname  VARCHAR2(10) NOT NULL UNIQUE,
    area   VARCHAR2(10)
);

CREATE TABLE DATA2 (
    empno    NUMBER PRIMARY KEY,
    name     VARCHAR2(10) NOT NULL UNIQUE,
    deptno   NUMBER REFERENCES dept(deptno), 
    position VARCHAR2(10) CHECK (position IN ('사원', '대리', '과장', '부장')),
    pay      NUMBER NOT NULL,
    pempno   NUMBER
);
SELECT * FROM DATA;
SELECT * FROM DATA2;

INSERT INTO DATA (deptno, dname) VALUES ('101', '영업부');
INSERT INTO DATA (deptno, dname) VALUES ('102', '총무부');
INSERT INTO DATA (deptno, dname) VALUES ('103', '기획부');
INSERT INTO DATA (deptno, dname) VALUES ('104', '홍보부');

INSERT INTO DATA2 (empno, name, deptno, position, pay, pempno)
VALUES (1001, '박민수', 10, '부장', 5000, NULL);
INSERT INTO DATA2 (empno, name, deptno, position, pay, pempno)
VALUES (1002, '최유진', 20, '대리', 4000, 1001);
INSERT INTO DATA2 (empno, name, deptno, position, pay, pempno)
VALUES (1003, '박지성', 10, '과장', 5000, 1002);
INSERT INTO DATA2 (empno, name, deptno, position, pay, pempno)
VALUES (1004, '안정환', 20, '대리', 4000, 1003);
INSERT INTO DATA2 (empno, name, deptno, position, pay, pempno)
VALUES (1005, '손흥민', 30, '대리', 3000, 1002);
INSERT INTO DATA2 (empno, name, deptno, position, pay, pempno)
VALUES (1006, '김연아', 20, '대리', 4000, 1001);
INSERT INTO DATA2 (empno, name, deptno, position, pay, pempno)
VALUES (1007, '박세리', 10, '사원', 2000, 1004);
INSERT INTO DATA2 (empno, name, deptno, position, pay, pempno)
VALUES (1008, '이천수', 30, '사원', 2500, 1003);
INSERT INTO DATA2 (empno, name, deptno, position, pay, pempno)
VALUES (1009, '송종국', 30, '사원', 3500, 1005);

INSERT INTO DATA2 (empno, name, deptno, position, pay, pempno)
VALUES (1010, '이순신', 30, '사원', 4500, 1006);

UPDATE DATA SET AREA = 'SEOUL'
 WHERE DEPTNO = 101; 

UPDATE DATA SET DNAME ='영업부'
 WHERE DEPTNO = 101;

UPDATE DATA SET AREA = 'BUSAN'
 WHERE DEPTNO = 102; 

UPDATE DATA SET DNAME ='총무부'
 WHERE DEPTNO = 102;

UPDATE DATA SET AREA = 'BUSAN'
 WHERE DEPTNO = 103; 

UPDATE DATA SET DNAME ='기획부'
 WHERE DEPTNO = 103;

 UPDATE DATA SET AREA = 'BUSAN'
 WHERE DEPTNO = 104; 

UPDATE DATA SET DNAME ='홍보부'
 WHERE DEPTNO = 104;

DELETE FROM DATA2
  WHERE NAME = '이순신';
SELECT * FROM DATA2;

SELECT * FROM DATA2
ORDER BY PAY DESC;

SELECT DEPTNO, POSITION, AVG(PAY) FROM DATA2
GROUP BY DEPTNO, POSITION
HAVING AVG(PAY) >= 1500;

SELECT DEPTNO, POSITION, AVG(PAY) FROM DATA2
GROUP BY DEPTNO, POSITION
HAVING AVG(PAY) >= 3000;

SELECT * FROM DATA2
WHERE PAY > (SELECT PAY FROM DATA2 WHERE NAME = '송종국');

SELECT * FROM DATA2
WHERE POSITION = '대리' 
AND PAY <= 4000;

SELECT * FROM DATA2
WHERE POSITION = '사원' 
AND PAY <= 3900;

SELECT * FROM DATA2
WHERE DEPTNO = 10 
  AND POSITION = '과장';