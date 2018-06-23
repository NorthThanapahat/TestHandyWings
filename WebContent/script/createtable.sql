
CREATE TABLE EmployeeBean(
	id int NOT NULL auto_increment,
    employeeID varchar(255),
    firstname varchar(255),
    lastname varchar(255),
    birthday Date,
    employeeTypeID int,
    PRIMARY KEY(id)
);

CREATE TABLE EmployeeTypeBean(
	employeeTypeID int NOT NULL auto_increment ,
    typeName varchar(255) NOT NULL,
    typeDetail varchar(255) NOT NULL,
    PRIMARY KEY(employeeTypeID)
);

CREATE TABLE FullTimeEmployeeBean(
	 employeeID varchar(255),
	 salary double
);

CREATE TABLE PartTimeEmployeeBean(
	 employeeID varchar(255),
	 compensation double
);

CREATE TABLE CalculateCompensationTransactionBean(
	 employeeID varchar(255),
     calculateResult double,
     datetime TIMESTAMP
);
INSERT INTO EmployeeTypeBean(typeName,typeDetail)VALUE ('FullTime','FullTime Employee');
INSERT INTO EmployeeTypeBean(typeName,typeDetail)VALUE ('PastTime','PastTime Employee');