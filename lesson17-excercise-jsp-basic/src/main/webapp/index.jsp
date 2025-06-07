<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bai tap JSP 01</title>
</head>
<body>
    <%@ page import="java.lang.Math" %>
    <%
        int a = 3;
        int b = 2;
        int sum = a + b;
    %>

    <p>3 + 2 = <b><%= sum %></b></p>

    <p><% System.out.println(Math.random()); %></p>
    <p><%= Math.random()*3 %></p>
</body>
</html>