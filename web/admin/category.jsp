<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/18
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.test.shopping.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.test.shopping.category.Category" %>
<%@ page import="com.test.shopping.category.CategoryService" %>
<%
    //    String admin = (String)session.getAttribute("admin");
//    if(admin == null || !admin.equals("admin"))
//        response.sendRedirect("login.jsp");
%>
<%
    List<Category> categories = CategoryService.getInstance().getCategories();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link href="../code/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .navbar-header h3{
            margin-top: 10px;
            padding: 0;
        }
        a{color: black;}
        .middle{margin-top: 100px;}
        .panel-body {padding: 0;}
        .panel-body table tr td {padding-left: 15px}
        .panel-body .table {margin-bottom: 0;}
        div.panel{margin-bottom: 30px;}
        h1.title{margin-bottom: 20px;}
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <span><a href = "../index.jsp"><h3>网上购物商城</h3></a></span>
        </div>
        <ul class="nav navbar-nav navbar-right" style="margin-top:0;">
            <li>
                <a href = "#">
                    <span class="glyphicon glyphicon-user"> admin</span>
                </a>
            </li>
            <li>
                <a href="../logout.jsp">
                    <span class="glyphicon glyphicon-off"> 退出</span>
                </a>
            </li>
        </ul>
    </div>
</nav>

<div class="container middle">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">用户管理</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="admin.jsp"> 用户列表</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">类别管理</a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="category.jsp">类别列表</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="categoryAJax.jsp">类别列表AJAX</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">产品管理</a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="product.jsp">产品列表</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="productSearch.jsp">产品搜索</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">订单管理</a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="order.jsp">订单列表</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">统计分析</a>
                        </h4>
                    </div>
                    <div id="collapseFive" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="saleStatics.jsp">销量统计</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9 col-md-9">
            <div class="well">
                <div class="col-md-3">
                    <h1 class="title">类别列表</h1>
                </div>
                <div class="col-md-6 col-md-offset-3">
                </div>
                <table class="table table-striped">
                    <tr>
                        <td colspan="6" style="text-align: center">
                            <a href = 'categoryInsert.jsp?root=1'>插入根类别</a>
                        </td>
                    </tr>
                    <tr>
                        <td>类别名称</td>
                        <td>描述</td>
                        <td>count</td>
                        <td>级别</td>
                        <td>操作</td>
                    </tr>
                    <%
                        for(Category c: categories){
                    %>
                    <tr>
                        <td><%= c.getName()%></td>
                        <td><%= c.getDescr()%></td>
                        <td><%= c.getCno()%></td>
                        <td><%= c.getGrade()%></td>
                        <td>
                            <%
                                if(c.getGrade() <= 2){
                            %>
                            <a href="categoryInsert.jsp?root=<%= c.getGrade() + 1%>&pid=<%= c.getId()%>">插入子类别</a>
                            <span>  </span>
                            <%
                                }
                            %>
                            <a href="categoryModify.jsp?id=<%= c.getId()%>">修改类别</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="../code/js/jquery-3.0.0.min.js"></script>
<script src="../code/js/bootstrap.min.js"></script>

</body>
</html>