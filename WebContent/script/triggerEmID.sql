delimiter $$
CREATE TRIGGER `emIDFullTimeTrigger` 
BEFORE INSERT ON `FullTimeEmployeeBean` FOR EACH ROW
BEGIN
	

SET NEW.employeeID = (SELECT employeeID FROM EmployeeBean ORDER BY id DESC LIMIT 1);

END$$

delimiter ;