<%@ page import="com.test.shopping.product.ProductMgr" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/21
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String[] ids = request.getParameterValues("id");
    if(ids != null && ids.length != 0){
        ProductMgr.getInstance().delete(ids);
    }
    response.sendRedirect("product.jsp");
%>
<html>
<head>
    <title></title>
</head>
<body>

</body>
</html>
