<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<br/>
<p>3 + 2 = <%= 3 + 2%>
</p>
<p>
    <% int sum = 3 + 2; %>
    The sum of 3 and 2 is <%= sum %>.
</p>
</body>
</html>