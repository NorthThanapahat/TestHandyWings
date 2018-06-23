	
	CREATE TABLE employeeTypeBean(
	employeeTypeID INT auto_increment,
	typeName VARCHAR(255) NOT NULL,
	typeDetail VARCHAR(255) NOT NULL,
	PRIMARY KEY(employeeTypeID)
);
    
    CREATE TABLE employeeBean(
	employeeID VARCHAR(255) NOT NULL,
	firstName VARCHAR(255) NOT NULL,
	lastName VARCHAR(255) NOT NULL,
	birthday Date NOT NULL,
	employeeTypeID INT NOT NULL,
	PRIMARY KEY(employeeID),
    FOREIGN KEY (employeeTypeID) references employeeTypeBean(employeeTypeID)
);

--
CREATE TABLE calculatecompensationTransactionBean(
	employeeID VARCHAR(255) NOT NULL,
	calculateResult double NOT NULL,
	datetime TIMESTAMP NOT NULL,
    FOREIGN KEY (employeeID) references employeeBean(employeeID)
);
CREATE TABLE fullTimeEmployeeBean(
	employeeID VARCHAR(255) NOT NULL,
	salary double NOT NULL
);

CREATE TABLE partTimeEmployeeBean(
	employeeID VARCHAR(255) NOT NULL,
	compensation double NOT NULL
);



