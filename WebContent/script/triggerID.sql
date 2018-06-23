delimiter $$
CREATE TRIGGER `testtrigger` 
BEFORE INSERT ON `EmployeeBean` FOR EACH ROW
BEGIN

	IF (SELECT COUNT(*) FROM EmployeeBean) = 0 THEN 
		SET NEW.employeeID = CONCAT('EMP-00',1);
    ELSE 
		IF ((length(NEW.id)) = 1) THEN
		
		SET NEW.employeeID = CONCAT('EMP-00',LAST_INSERT_ID() + 1);

		ELSEIF ((length(NEW.id)) = 2) THEN

		SET NEW.employeeID = CONCAT('EMP-0',LAST_INSERT_ID()+ 1);

		ELSE

		SET NEW.employeeID = CONCAT('EMP-',LAST_INSERT_ID() + 1);

		END IF;
    END IF;
END$$

delimiter ;
