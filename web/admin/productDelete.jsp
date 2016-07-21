<%@ page import="com.test.shopping.product.ProductMgr" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/21
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //    String admin = (String)session.getAttribute("admin");
//    if(admin == null || !admin.equals("admin"))
//        response.sendRedirect("login.jsp");
%>
<%
    String strId = request.getParameter("id");
    if(strId.trim() != null){
        int id = Integer.parseInt(strId);
        ProductMgr.getInstance().delete(id);
        response.sendRedirect("product.jsp");
    }
%>
<html>
<head>
    <title></title>
</head>
<body>

</body>
</html>
