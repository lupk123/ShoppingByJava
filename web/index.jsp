<%@ page import="com.test.shopping.user.User" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/14
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = null;
    if(session.getAttribute("user") != null){
        user = (User)session.getAttribute("user");
    }
%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>网上购物商城</title>
    <link href="code/css/bootstrap.min.css" rel="stylesheet">
    <link href="code/css/index.css" rel="stylesheet"/>
</head>
<body>

<div class="container-fluid">
    <div id = "top">
        <nav class="navbar navbar-inverse">
            <div class="row navigation ">
                <div class="col-md-1 col-md-offset-1 link-white">
                    <%
                        if(user == null){
                    %>
                       <a href = "login.jsp">登陆</a>
                    <%
                        }else{
                    %>
                        <span><%= user.getUsername()%></span>
                    <%
                        }
                    %>
                </div>
                <div class="col-md-1 link-white">
                    <%
                        if(user == null){
                    %>
                        <a href = "register.jsp">注册</a>
                    <%
                    }else{
                    %>
                        <a href="logout.jsp">退出</a>
                    <%
                        }
                    %>
                </div>
                <div class="col-md-1 col-md-offset-6 link-white"><a href = "cart.jsp">购物车</a></div>
                <div class="col-md-1 link-white"><a href = "selfservice.jsp">自服务</a></div>
            </div>
        </nav>
        <div class="row" style="padding-left: 10px;">
            <div class="col-md-3 col-md-offset-1 link-black"><h1><a href="index.jsp">网上购物商场</a></h1></div>
            <div class="col-md-8" style="margin-top: 25px">
                <form action="search.jsp" method="post">
                    <div class="col-md-8">
                        <input type = "text" class="search" name = "search"/>
                    </div>
                    <div class="col-md-4"><button class="btn btn-success">搜索</button></div>
                </form>
            </div>
        </div>
    </div>

    <div id = "middle">
        <div class="row">
            <div class="col-md-2 col-md-offset-1">
                <ul class="list-unstyled ul-modify">
                    <li class="li-modify">女装</li>
                    <li class="li-modify">鞋靴</li>
                    <li class="li-modify">运动</li>
                    <li class="li-modify">生活</li>
                    <li class="li-modify">数码</li>
                    <li class="li-modify">美妆</li>
                    <li class="li-modify">家居</li>
                    <li class="li-modify">办公</li>
                </ul>
            </div>
            <div class="col-md-5 img">
                <img src="img/test.jpg"/>
            </div>
            <div class="col-md-4 link-black">
                <table class="table table-modify">
                    <thead>
                    <tr>
                        <td colspan="2"><span style="font-size: 18px">Hi! <% if(user != null) out.print(user.getUsername());%>你好</span></td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><a href="login.jsp">登陆</a></td>
                        <td><a href="register.jsp">注册</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="code/js/jquery-3.0.0.min.js"></script>
<script src="code/js/bootstrap.min.js"></script>
</body>
</html>
