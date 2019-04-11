DROP DATABASE COMPANY;
CREATE DATABASE COMPANY;
USE COMPANY;
CREATE TABLE EMPLOYEE
( Fname VARCHAR(15) NOT NULL,
Minit CHAR,
Lname VARCHAR(15) NOT NULL,
Ssn CHAR(9) NOT NULL,
Bdate DATE,
Address VARCHAR(30),
Sex CHAR,
Salary DECIMAL(10,2),
Super_ssn CHAR(9),
Dno INT NOT NULL,
PRIMARY KEY (Ssn));
CREATE TABLE DEPARTMENT
( Dname VARCHAR(15) NOT NULL,
Dnumber INT NOT NULL,
Mgr_ssn CHAR(9) NOT NULL,
Mgr_start_date DATE,
PRIMARY KEY (Dnumber),
UNIQUE (Dname),
FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn));
CREATE TABLE DEPT_LOCATIONS
( Dnumber INT NOT NULL,
Dlocation VARCHAR(15) NOT NULL,
PRIMARY KEY (Dnumber, Dlocation),
FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber));
CREATE TABLE PROJECT
(Pname VARCHAR(15) NOT NULL,
Pnumber INT NOT NULL,
Plocation VARCHAR(15),
Dnum INT NOT NULL,
PRIMARY KEY (Pnumber),
UNIQUE (Pname),
FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber));
CREATE TABLE WORKS_ON
( Essn CHAR(9) NOT NULL,
Pno INT NOT NULL,
Hours DECIMAL(3,1) NOT NULL,
PRIMARY KEY (Essn, Pno),
FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber));
CREATE TABLE DEPENDENT
(Essn CHAR(9) NOT NULL,
Dependent_name VARCHAR(15) NOT NULL,
Sex CHAR,
Bdate DATE,
Relationship VARCHAR(8),
PRIMARY KEY (Essn, Dependent_name),
FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn));

INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES ( 'John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', '30000', '333445555', '5'), 
( 'Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', '40000', '888665555', '5'),
( 'James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', '55000', 'NULL', '1');
INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES ('Research', '5', '333445555', '1988-05-22'), ('Headquarters', '1', '888665555', '1981-06-19');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES ('1', 'Houston');

INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum)
VALUES ('ProductX', '1', 'Bellaire', '5');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('123456789', '1', '32.5');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter');

show tables;
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM DEPT_LOCATIONS;
SELECT * FROM WORKS_ON;
SELECT * FROM PROJECT;
SELECT * FROM DEPENDENT;
