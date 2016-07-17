<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/17
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if(username != null && password != null && username.equals("admin") && password.equals("admin")){
        session.setAttribute("admin", "admin");
        response.sendRedirect("admin.jsp");
    }else{
        out.println("<script>alert('请输入正确的用户名密码'); </script>");
    }
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>网上购物商城</title>
    <link href="../code/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .navigation{
            color: white;
            font-size: 20px;
            text-align: center;
            padding-top: 10px;
        }

        .a{
            border: 1px solid black;
        }
        .link-white a{
            color: white;
        }
        table{
            margin-top: 80px;
        }
        td{
            text-align: center;
        }
        #middle{
            margin-top: 80px;
        }
        .title{
            height: 80px;
        }
        .img{
            margin-top: 50px;
            height: 300px;
            width: 500px;
            text-align: center;
        }

    </style>
</head>
<body>

<div id = "top">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="row navigation ">
                <div class="col-md-1 col-md-offset-1 link-white"><a href = "../login.jsp">登陆</a></div>
                <div class="col-md-1 link-white"><a href = "../register.jsp">注册</a></div>
                <div class="col-md-1 col-md-offset-6 link-white"><a href = "../cart.jsp">购物车</a></div>
                <div class="col-md-1 link-white"><a href = "../selfservice.jsp">自服务</a></div>
            </div>
        </div>
    </nav>
</div>
<div id = "middle" >
    <div class="container-fluid">
        <div class="col-md-6 col-md-offset-1">
            <img src = "../img/scenery.jpg" class="img" />
        </div>
        <div class="col-md-3">
            <form action="login.jsp" method="post">
                <input type="hidden" name = "action" value="post"/>
                <table class="table">
                    <thead>
                    <tr>
                        <td colspan="2" class="title">
                            <span class = "h2">后台登陆</span>
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
                        <td colspan="2"><input type="submit" value="登录" class="btn" /></td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>

<script src="../code/js/jquery-3.0.0.min.js"></script>
<script src="../code/js/bootstrap.min.js"></script>
</body>
</html>

