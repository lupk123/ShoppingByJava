<%@ page import="com.test.shopping.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.shopping.category.Category" %>
<%@ page import="com.test.shopping.category.CategoryService" %>
<%@ page import="java.util.ArrayList" %>
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
<%!
    private List<Category> getTopCategories(List<Category> categories){
        List<Category> topCategories = new ArrayList<Category>();
        for(Category c : categories){
            if(c.getGrade() == 1)
                topCategories.add(c);
        }
        return topCategories;
    }

    private List<Category> getChild(List<Category> categories, Category p){
        List<Category> childs = new ArrayList<Category>();
        for(Category c: categories){
            if(c.getPid() == p.getId())
                childs.add(c);
        }
        return childs;
    }
%>
<%
    List<Category> categories = CategoryService.getInstance().getCategories();
    List<Category> topCategories = getTopCategories(categories);
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
                <div class="panel-group" id="accordion">
                    <%
                        for(Category c : topCategories){
                    %>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%= c.getId()%>"><%= c.getName()%></a>
                            </h4>
                        </div>
                        <div id="collapse<%= c.getId()%>" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table">
                                    <%
                                        List<Category> childs1 = this.getChild(categories, c);
                                        for(Category c1: childs1){
                                            List<Category> childs = this.getChild(categories, c1);
                                            for(Category child : childs){
                                    %>
                                    <tr>
                                        <td>
                                            <a href="searchResult.jsp?categoryid=<%= child.getId()%>"> <%= child.getName()%></a>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                 </div>
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
