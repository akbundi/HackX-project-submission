create database hospital;
use hospital;
create table unitID
(
unitId int,
unitName varchar(20),
deptID varchar(18),
PRIMARY KEY(unitId)
);

create table medicalcentre
(
mcID int,
mcName varchar(20),
address varchar(20),
website varchar(20),
PRIMARY KEY(mcID)
);
create table department
(
depID int,
deptName varchar(20),
HOD varchar(20),
extNO int,
PRIMARY KEY(depID),
mcId int references medicalcentre(mcId),
FOREIGN KEY(mcId) REFERENCES medicalcentre(mcId)
);
create table emergencyUnit
(
emId int,
availableRoom int,
ambulance int,
bed int,
PRIMARY KEY(emId),
mcId int references medicalcentre(mcId),
FOREIGN KEY(mcId) REFERENCES medicalcentre(mcId)
);
create table staff
(
staffid int,
staffName varchar(20),
address varchar(23),
jobcode int,
Qualification varchar (20),
specializedID varchar(20),
PRIMARY KEY(staffid),
mcId int references medicalcentre(mcId),
FOREIGN KEY(mcId) REFERENCES medicalcentre(mcId)
);
create table ward 
(
wtype varchar(13),
staffid int references staff(staffid),
bedno int,
phoneno varchar(23),
PRIMARY KEY(bedno),
FOREIGN KEY(staffId) REFERENCES staff(staffId)  
);
create table patient
(
patientId int,
fname varchar(23),
mname varchar(23),
lname varchar(23),
address varchar(23),
salutation varchar(6),
PRIMARY KEY(patientId)
);
create table medicalhistory 
(
mhId int,
illness varchar(23),
yAcquired int,
symptoms varchar(20),
patientId int references patient(patientId),
FOREIGN KEY(patientId) REFERENCES patient(patientId)
);
create table request
(
rId int,
contactno varchar(23),
staffId int references staff(staffId),
patientId int references patient(patientId),
mcId int references medicalcentre(mcId),
PRIMARY KEY(rId),
FOREIGN KEY(patientId ) REFERENCES patient(patientId),
FOREIGN KEY(staffId) REFERENCES staff(staffId),
FOREIGN KEY(mcId) REFERENCES medicalcentre(mcId)
);
create table checkup
(
nextcheckup int,
patientId int references patient(patientId),
FOREIGN KEY(patientId ) REFERENCES patient(patientId)
);

