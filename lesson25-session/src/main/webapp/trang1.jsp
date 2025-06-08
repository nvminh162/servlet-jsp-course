<%--
  Created by IntelliJ IDEA.
  User: nvmin
  Date: 6/8/2025
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="background-color: red">
    <%
        String username = (String) session.getAttribute("username");
    %>

    Xin chào: <%=username %> <br/>
    <hr/>
    <h1>ĐÂY LÀ TRANG 1</h1>
    <a href="trang1.jsp">Trang 1</a>
</body>
</html>
