SHOW ENGINES;
SET storage_engine=MEMORY;

CREATE INDEX salary_index ON Employee(salary) USING BTREE;
CREATE INDEX deptID_index ON Employee(deptID) USING HASH;

SHOW INDEX FROM Employee;
SHOW INDEX FROM Department;

SELECT * FROM Employee WHERE salary BETWEEN 30000 AND 40000;
SELECT D.deptID, D.deptName, D.location, E.empID, E.empName, E.job, E.salary
    FROM Department D JOIN Employee E ON D.deptID = E.deptID;

EXPLAIN SELECT * FROM Employee WHERE salary BETWEEN 30000 AND 40000;
EXPLAIN SELECT D.deptID, D.deptName, D.location, E.empID, E.empName, E.job, E.salary
            FROM Department D JOIN Employee E ON D.deptID = E.deptID;