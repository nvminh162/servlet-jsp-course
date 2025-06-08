<%--
  Created by IntelliJ IDEA.
  User: nvmin
  Date: 6/8/2025
  Time: 2:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
%>

<% if (username != null) { %>
    <jsp:forward page="success.jsp"></jsp:forward>
<%} %>


<form action="/lesson25_session_war_exploded/login" method="GET">
    <table>
        <tr>
            <td colspan="2">LOGIN</td>
        </tr>
        <tr>
            <td>Username</td>
            <td><input type="text" name="username"/></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Login"/></td>
        </tr>
    </table>
</form>
</body>
</html>
