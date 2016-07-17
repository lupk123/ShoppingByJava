<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/14
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.test.shopping.user.*" %>
<%
    String action = request.getParameter("action");
    if(action != null && action.trim().equals("post")){
        User user = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try{
            user = User.check(username, password);
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp");
        }catch (UserNotFoundException e){
            out.println("<script>alert('" + e.getMessage() + "'); </script>");
        }catch (PasswordNotFoundException e){
            out.println("<script>alert('" + e.getMessage() + "'); </script>");
        }
    }

%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>在线尝试 Bootstrap 实例</title>
    <link href="code/css/bootstrap.min.css" rel="stylesheet">
    <link href="code/css/login.css" rel="stylesheet"/>
</head>
<body>
<div class="container-fluid">
    <div id = "top">
        <nav class="navbar navbar-inverse">
            <div class="row navigation ">
                <div class="col-md-1 col-md-offset-1 link-white">
                    <a href = "login.jsp">登陆</a>
                </div>
                <div class="col-md-1 link-white">
                    <a href = "register.jsp">注册</a>
                </div>
                <div class="col-md-1 col-md-offset-6 link-white"><a href = "cart.jsp">购物车</a></div>
                <div class="col-md-1 link-white"><a href = "selfservice.jsp">自服务</a></div>
            </div>
        </nav>
    </div>
    <div id = "middle" >
        <div class="col-md-6 col-md-offset-1">
            <img src = "img/scenery.jpg" class="img" />
        </div>
        <div class="col-md-3">
            <form action="login.jsp" method="post">
                <input type="hidden" name = "action" value="post"/>
                <table class="table">
                    <thead>
                    <tr>
                        <td colspan="2" class="title">
                            <span class = "h2">
                                <a href="index.jsp">网上购物商城--登陆</a>
                            </span>
                        </td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>昵称：</td>
                        <td><input type="text" name="username"/></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input type="password" name="password"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="注册" class="btn" /></td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>

<script src="code/js/jquery-3.0.0.min.js"></script>
<script src="code/js/bootstrap.min.js"></script>
</body>
</html>
