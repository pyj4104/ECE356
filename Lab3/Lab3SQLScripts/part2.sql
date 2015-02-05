
/* Lab 3- Part 2- Add  constraints to DB 

 You must add to each table:
 a) Primary key constrains
 b) A referencial integrity constrains

*/
SET storage_engine=INNODB;

/* 2.a - Add primary key constrains 
Example, for the Department table you can do this with the commands:

ALTER TABLE Department ADD PRIMARY KEY(deptID);
or
DROP TABLE IF EXISTS Department;           
CREATE TABLE Department(deptID INT PRIMARY KEY,deptName VARCHAR(100),location VARCHAR(100));  

/* 2.b - Add referencial integrity constrains
Example, Employee table has a column that depends on column   deptID of the Dep[artment table

You will add the following to your CREATE statement (or you can use an ALTER command as well):

foreign key (deptID) references Department(deptID)

DROP TABLE IF EXISTS Employee;  
CREATE TABLE Employee(empID INT PRIMARY KEY,empName VARCHAR(100),job VARCHAR(100),deptID INT,salary INT,foreign key (deptID) references Department(deptID) );

/* Tables created in lab 1 */

USE ece356db_y27park; 

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(deptID INT PRIMARY KEY,deptName VARCHAR(100),location VARCHAR(100));                    
          
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (empID INT PRIMARY KEY AUTO_INCREMENT, empName VARCHAR (100), job VARCHAR(100), deptID INT, salary INT, CONSTRAINT FOREIGN KEY(deptID) REFERENCES Department(deptID));

-- For the Assigned table, you need ti specify a  
-- primary key that includes two columns        


DROP TABLE IF EXISTS Project;
CREATE TABLE Project(projID INT PRIMARY KEY,title VARCHAR(100),budget INT,funds INT);
          
DROP TABLE IF EXISTS Assigned;             
CREATE TABLE Assigned(empID INT PRIMARY KEY,projID INT,role VARCHAR(100), FOREIGN KEY (projID) REFERENCES Project(projID), FOREIGN KEY (empID) REFERENCES Employee(empID));                 
        


/* Tables created in lab 2 */





DROP TABLE IF EXISTS SupplyType;  
         
CREATE TABLE SupplyType(supplyTypeID INT PRIMARY KEY,
description VARCHAR(100)); 

DROP TABLE IF EXISTS Supply; 
         
CREATE TABLE Supply(supplyID INT PRIMARY KEY,
supplyDescription VARCHAR(100),
unitDescription VARCHAR(100),
costPerunit DECIMAL(8,2), 
typeID INT,
FOREIGN KEY (typeID) REFERENCES SupplyType(supplyTypeID)
); 



/* Add here statements to create your ProjectSupply table ( from your solution to part 1), adding primary key and foreign key constrains. */


DROP TABLE IF EXISTS ProjectSupply;
CREATE TABLE ProjectSupply (projectID INT, supplyID INT, quantity INT, FOREIGN KEY (projectID) REFERENCES Project(projID), FOREIGN KEY (supplyID) REFERENCES Supply(supplyID)); 

/* Reinsert data into all tables 

You can use the INSERT statements provided in createTables.sql, and in  your solution for part1 (in your modified part1.sql)

Bonus: Practice using the MySQL autoincrement feature when inserting data into a table. 


*/





INSERT INTO Department(deptID, deptName, location) VALUES(3, 'marketing', 'Waterloo');             
INSERT INTO Department(deptID, deptName, location) VALUES(7, 'research', 'Guelph');            
INSERT INTO Department(deptID, deptName, location) VALUES(12, 'software', 'Toronto'); 
INSERT INTO Department(deptID, deptName, location) VALUES(13, 'computing', 'Toronto');
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Smith', 'programmer', 12, 35000); 
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Kelly', 'engineer', 7, 37000); 
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Herr', 'janitor', 7, 26000); 
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Williams', 'analyst', 12, 36000); 
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Hergot', 'secretary', 7, 28000); 
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Hess', 'technician', 7, 32000); 
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Mays', 'engineer', 7, 45000); 
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Morris', 'secretary', 3, 23000);  
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Maria', 'engineer', 3, 32000); 
INSERT INTO Project(projID, title, budget, funds) VALUES(345, 'compiler', 500000, 250000); 
INSERT INTO Project(projID, title, budget, funds) VALUES(123, 'display', 650000, 370000); 
INSERT INTO Assigned(empID, projID, role) VALUES(1, 345, 'programmer');            
INSERT INTO Assigned(empID, projID, role) VALUES(6, 123, 'programmer');        
INSERT INTO Assigned(empID, projID, role) VALUES(5, 123, 'secretary');           
INSERT INTO Assigned(empID, projID, role) VALUES(2, 123, 'manager'); 
INSERT INTO Assigned(empID, projID, role) VALUES(4, 345, 'manager');     
INSERT INTO Assigned(empID, projID, role) VALUES(7, 123, 'engineer'); 

CREATE TABLE SupplyData(SupplyID INT,
supplyDescription VARCHAR(100),
unitDescription VARCHAR(100),
costPerunit DECIMAL(8,2), 
typeID INT,
typeDescription VARCHAR(100) ); 


INSERT INTO SupplyData VALUES (100,'Big WallCalendar',
'Item', 30.00, 1, 'Office Supplies');

INSERT INTO SupplyData VALUES (101,'Colour Stickers',
'1 Sheet of 10', 5.50, 1, 'Office Supplies');

INSERT INTO SupplyData VALUES (102,'Printer Paper',
'8.5 inches  x 11 inches 500 sheets', 20.50, 1, 'Office Supplies');

INSERT INTO SupplyData VALUES (103,'Laptop computer',
'Item', 1000.00, 1, 'Office Supplies');


INSERT INTO SupplyData VALUES (104,'Vacum',
'Item', 1000.00, 2, 'Cleaning Supplies');

INSERT INTO SupplyData VALUES (105,'Displosable Gloves',
'One pair', 10.00, 2, 'Cleaning Supplies');

INSERT INTO SupplyData VALUES (106,'Trash Cans',
'Item', 20.00, 2, 'Cleaning Supplies');

INSERT INTO SupplyData VALUES (107,'Bleach',
'5.38 L', 2.50, 2, 'Cleaning Supplies');

INSERT INTO SupplyType (supplyTypeID, description) (SELECT DISTINCT typeID, typeDescription FROM SupplyData);
INSERT INTO Supply (SupplyID, supplyDescription, unitDescription, costPerunit, typeID)
    (SELECT SupplyID, supplyDescription, unitDescription, costPerunit, typeID FROM SupplyData);


INSERT INTO ProjectSupply VALUES (123, 10, 103);
INSERT INTO ProjectSupply VALUES (345, 2, 104);
INSERT INTO ProjectSupply VALUES (345, 15, 101);




