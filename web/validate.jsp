<%@ page import="com.test.shopping.user.User" %>
<%@ page import="java.io.PrintWriter" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/24
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String username = request.getParameter("id");
    int count = User.check(username.trim());
//    JSONObject json = new JSONObject();
    PrintWriter writer = response.getWriter();
    if(count == 0)
    {
        out.print("{\"return\":\"invalid\"}");
    }
    else
        out.print("{\"return\":\"valid\"}");

%>