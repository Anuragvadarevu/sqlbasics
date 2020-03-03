CREATE DATABASE emp_information;
USE emp_information;

CREATE TABLE course(
courseID int,
coursetitle Varchar(100) NOT NULL,
PRIMARY KEY (courseID)
);
INSERT INTO course(courseID,coursetitle)
VALUES (1, 'DBMS');
INSERT INTO course(courseID,coursetitle)
VALUES (2, 'mkt');
INSERT INTO course(courseID,coursetitle)
VALUES (3, 'intro BA');
INSERT INTO course(courseID,coursetitle)
VALUES (4, 'CRM');
INSERT INTO course(courseID,coursetitle)
VALUES (5, 'NTM');
CREATE TABLE employee(
employeeID int,
employeeFN varchar(100) NOT NULL,
employeeLN varchar(100) NOT NULL,
PRIMARY KEY (employeeID)
);
INSERT INTO employee(employeeID, employeeFN,employeeLN)
VALUES(1, 'sai', 'narasimha');
INSERT INTO employee(employeeID, employeeFN,employeeLN)
VALUES(2, 'sri', 'kala');
INSERT INTO employee(employeeID, employeeFN,employeeLN)
VALUES(3, 'suraj', 'vijay');
INSERT INTO employee(employeeID, employeeFN,employeeLN)
VALUES(4, 'madhav', 'rayudu');
INSERT INTO employee(employeeID, employeeFN,employeeLN)
VALUES(5, 'boli', 'setty');

CREATE TABLE employeecourse(
employeecourseID int,
employeeID int,
courseID int,
Datecompleated DATE NOT NULL,
PRIMARY KEY (employeecourseID),
FOREIGN KEY (courseID) REFERENCES course(courseID),
FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
);
INSERT INTO employeecourse(employeecourseID,employeeID,courseID,datecompleated)
VALUES(1, 1, 1,'2019-02-15');
INSERT INTO employeecourse(employeecourseID,employeeID,courseID,datecompleated)
VALUES(2, 2, 2,'2019-02-15');
INSERT INTO employeecourse(employeecourseID,employeeID,courseID,datecompleated)
VALUES(3, 3, 3,'2019-02-15');
INSERT INTO employeecourse(employeecourseID,employeeID,courseID,datecompleated)
VALUES(4, 4, 4,'2019-02-15');
INSERT INTO employeecourse(employeecourseID,employeeid,courseID,datecompleated)
VALUES(5, 5, 5,'2019-02-15');

CREATE TABLE SUPERVISER(
SUPERVISERID INT,
employeeID INT,
PRIMARY KEY (SUPERVISERID),
FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
);
INSERT INTO SUPERVISER(SUPERVISERID,employeeID)
VALUES (1, 1);
INSERT INTO SUPERVISER(SUPERVISERID,employeeID)
VALUES (2, 2);
INSERT INTO SUPERVISER(SUPERVISERID,employeeID)
VALUES (3, 3);
INSERT INTO SUPERVISER(SUPERVISERID,employeeID)
VALUES (4, 4);
INSERT INTO SUPERVISER(SUPERVISERID,employeeID)
VALUES (5, 5);

