<%--
  Created by IntelliJ IDEA.
  User: nvmin
  Date: 6/7/2025
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
    %>

    <%
        if (username.equalsIgnoreCase("tung") && password.equals("123a")) {
    %>
    <h1>Bạn đã đăng nhập thành công </h1>
    <%
    } else {
    %>
    <h1>Không tìm thấy tài khoản </h1>
    <%
        }
    %>
</body>
</html>
