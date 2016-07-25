<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/14
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.test.shopping.user.User" %>
<%@ page import="java.util.Date" %>
<%
    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");
    if(action != null && action.trim().equals("post")){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("addr");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setPhone(phone);
        user.setAddr(addr);
        user.setRdate(new Date());
        user.insert();
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>在线尝试 Bootstrap 实例</title>
    <link href="code/css/bootstrap.min.css" rel="stylesheet">
    <link href = "code/css/register.css" rel="stylesheet"/>
    <script src="code/js/jquery-3.0.0.min.js"></script>
    <script src="code/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.onload = function(){
            $("#username").focus();
        }
        function validate() {
            var id = $("#username").val();
            var url = "validate.jsp";
            $.ajax({
                type: "get",
                data:{id:id},
                url: url,
                dataType: "json",
                success: function (data) {
                    var str = data.return;
                    if(str == "invalid")
                    {
                        $("#extract").text("congratulations! you can use this username!");
                    }
                    else if(str == "valid")
                    {
                        $("#extract").text("username exists");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    document.write(errorThrown);
                }
            })
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div id = "top">
        <nav class="navbar navbar-inverse">
            <div class="row navigation ">
                <div class="col-md-1 col-md-offset-1 link-white"><a href = "login.jsp">登陆</a></div>
                <div class="col-md-1 link-white"><a href = "register.jsp">注册</a></div>
                <div class="col-md-1 col-md-offset-6 link-white"><a href = "cart.jsp">购物车</a></div>
                <div class="col-md-1 link-white"><a href = "selfservice.jsp">自服务</a></div>
            </div>
        </nav>
    </div>
    <div id = "middle" class = "col-md-6 col-md-offset-3">
        <form action="register.jsp" method="post">
            <input type="hidden" name = "action" value="post"/>
            <table class="table">
                <thead>
                    <tr>
                        <td colspan="2" class="title" style="height: 80px">
                            <span class = "h2 link-black">
                                <a href = "index.jsp">网上购物商城--注册</a>
                            </span>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>昵称：</td>
                        <td>
                            <input type="text" name="username" id = "username" onblur="validate()"/>
                            <br>
                            <span id = "extract"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input type="password" name="password"/></td>
                    </tr>
                    <tr>
                        <td>联系方式：</td>
                        <td><input type="text" name="phone"/></td>
                    </tr>
                    <tr>
                        <td>地址：</td>
                        <td><input type="text" name="addr"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="注册" class="btn" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
</body>
</html>
