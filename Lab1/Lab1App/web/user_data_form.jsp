<%-- 
    Document   : user_data_form.jsp
    Created on : Jan 7, 2015, 2:01:03 PM
    Author     : YeounJun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page 2</title>
    </head>
    <body>
        <h1>User data form</h1>
        <form action="UserDataServlet" method="POST">
            What is your name? <input type="text" name="username" value=""/>
            <br />
            What is your favourite colour? <select name="usercolour">
                <option>red</option>
                <option>green</option>
                <option>blue</option>
            </select>
            <br />
            <input type="submit" value="Submit Query" />
        </form>
    </body>
</html>
