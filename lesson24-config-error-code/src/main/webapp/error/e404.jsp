<%--
  Created by IntelliJ IDEA.
  User: nvmin
  Date: 6/8/2025
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>
    <h1>Rất tiếc, trang bạn truy cập không tồn tại!</h1>
    <%=path %>
    <img alt="Error 404" src="<%=path%>/img/404.png">
</body>
</html>
