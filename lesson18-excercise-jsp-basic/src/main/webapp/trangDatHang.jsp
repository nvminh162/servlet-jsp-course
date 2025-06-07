<%--
  Created by IntelliJ IDEA.
  User: nvmin
  Date: 6/7/2025
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String hoVaTen = request.getParameter("hoVaTen");
    String email = request.getParameter("email");
    String soLuong = request.getParameter("soLuong");
%>

<h1> Xác nhận đặt hàng </h1>
<p> Xin cảm bạn <b><%=hoVaTen %>
</b> đã đặt <b><%=soLuong %>
</b> sản phẩm. <br/>
    Bạn sẽ nhận được thông báo qua email: <b><%=email %>
    </b>
</p>
</body>
</html>
