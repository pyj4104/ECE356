<%-- 
    Document   : queryEmployee
    Created on : Jan 21, 2015, 2:48:14 PM
    Author     : YeounJun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Query Explorers</title>
    </head>
    <body>
        <h1>Query Employees</h1>
        <form action="QueryServlet?qnum=3" method="POST">
            Enter selection criteria:<br /><br />
            Employee ID: <input type="text" name="empID" min="0" /><br />
            Employee name: <input type="text" name="empName" /><br />
            Job: <input type="text" name="job" /><br />
            Dept ID: <input type="text" name="deptID" min="0" /><br />
            Salary: <input type="text" name="salary" min="0" /><br />
            <input type="submit" value="Submit Query" />
        </form>
    </body>
</html>
