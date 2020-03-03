CREATE DATABASE hospital;
USE hospital;

CREATE TABLE Patient(
patientID int,
PatientFName Varchar(100) NOT NULL,
PatientLName Varchar(100) NOT NULL,
PRIMARY KEY (patientID)
);
INSERT INTO patient(patientID ,PatientFName, PatientLName)
VALUES (1, 'Dan','moris');
INSERT INTO patient(patientID ,PatientFName, PatientLName)
VALUES (2, 'mot','ting');
INSERT INTO patient(patientID ,PatientFName, PatientLName)
VALUES (3, 'mat','timp');

CREATE TABLE patientrecord(
patientrecordID int,
PRIMARY KEY (patientrecordID)
);
INSERT INTO patientrecord(patientrecordID)
VALUES(1);
INSERT INTO patientrecord(patientrecordID)
VALUES(2);


CREATE TABLE patient_dia(
patientrecordID  int,
patientsdia varchar(100)  NOT NULL,
PRIMARY KEY (patientsdia),
FOREIGN KEY (patientrecordID)REFERENCES patientrecord(patientrecordID)
);
INSERT INTO patient_dia(patientrecordID ,patientsdia )
VALUES(1, 'dia1');
INSERT INTO patient_dia(patientrecordID ,patientsdia )
VALUES(1, 'dia2');


CREATE TABLE patient_treatement(
patienttreatementID int,
patientrecordID  int,
bill  int,
PRIMARY KEY (patienttreatementID ),
FOREIGN KEY (patientrecordID)REFERENCES patientrecord(patientrecordID)
);
INSERT INTO patient_treatement(patienttreatementID ,patientrecordID,bill  )
VALUES(1,2, '250');

CREATE TABLE staff(
staffID int,
staffFName varchar(100) NOT NULL,
staffLName varchar(100) NOT NULL,
PRIMARY KEY (staffID)
);
INSERT INTO staff(staffID, staffFName,staffLName)
VALUES(1, 'sai', 'narasimha');
CREATE TABLE staff_quali(
staffID int,
staff_qualis varchar(100) NOT NULL,
FOREIGN KEY (staffID)REFERENCES staff(staffID),
PRIMARY KEY (staff_qualis)
);
INSERT INTO staff_quali(staffID,staff_qualis)
VALUES(1,'masters');
CREATE TABLE staffaddress(
staffID int,
staff_address varchar(100) NOT NULL,
FOREIGN KEY (staffID)REFERENCES staff(staffID),
PRIMARY KEY (staff_address)
);
INSERT INTO staffaddress(staffID,staff_address)
VALUES(1,'india');
CREATE TABLE doc(
docid int,
Specialty varchar(100) NOT NULL,
Experience varchar(100) NOT NULL,
PRIMARY KEY (docid)
);
INSERT INTO doc(docid,specialty,experience)
VALUES(1,'hand','ten years');
CREATE TABLE nurse(nurseid int,degreetype varchar(100) NOT NULL,
PRIMARY KEY (nurseid)
);
INSERT INTO nurse(nurseid,degreetype)
values(1,'pharm');








