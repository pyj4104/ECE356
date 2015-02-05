<%-- 
    Document   : deleteEmployee
    Created on : Feb 4, 2015, 2:42:01 PM
    Author     : yeounjunpark
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="ece356.Employee"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Employee</title>
    </head>
    <body>
        <form method="post" action="deleteEmployeeServlet">
            <p>
                <select name="empID">
                    <%! ArrayList<Employee> employeeList;%>
                    <%
                        employeeList = (ArrayList<Employee>) request.getAttribute("employeeList");
                        for (Employee emp : employeeList) {
                    %>
                    <option value="<%= emp.getEmpID()%>"><%= emp.getEmpName()%></option>
                    <%
                        }
                    %>
                </select><br/>
            <p> <input type="submit" value="Submit">
        </form>
    </body>
</html>
