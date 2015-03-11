USE ece356db_y27park;

DROP PROCEDURE IF EXISTS increase_salary_proc;

DELIMITER $
CREATE PROCEDURE increase_salary_proc
(
    IN  inEmpID INT,
    IN  inPercentage DOUBLE(5, 2),
    OUT errorCode INT
)
procedure_body: BEGIN
    DECLARE raised INT;
    DECLARE pIncrease DOUBLE(7,4);

    IF inPercentage < 0 OR inPercentage > 100 THEN
        SET errorCode = -1;
        LEAVE procedure_body;
    END IF;
    
    SELECT salary INTO raised FROM Employee WHERE empID = inEmpID;

    IF ROW_COUNT() < 1 THEN
        SET errorCode = -2;
        LEAVE procedure_body;
    END IF;

    SET pIncrease = inPercentage / 100;

    SET raised = raised * pIncrease + raised;

    UPDATE  Employee
    SET     salary = raised
    WHERE   empID = inEmpID;

    SET errorCode = 0;
END;$
DELIMITER ;



CALL increase_salary_proc(1, 120.00, @error);
select @error;
DELETE FROM Employee WHERE empID = 200;
CALL increase_salary_proc(200, 80.00, @error);
select @error;
SELECT salary FROM Employee WHERE empID = 200;
CALL increase_salary_proc(68, 20.00, @error);
select @error;
SELECT salary FROM Employee WHERE empID = 68;