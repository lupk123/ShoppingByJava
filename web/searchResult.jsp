<%@ page import="java.util.List" %>
<%@ page import="com.test.shopping.product.Product" %>
<%@ page import="com.test.shopping.product.ProductMgr" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/14
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("categoryid"));
//    System.out.print(id);
    List<Product> products = ProductMgr.getInstance().getProducts(id);
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
        a{
            color: black;
        }

        .middle{
            margin-top: 100px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <span><h3><a href = "../index.jsp">网上购物商城</a></h3></span>
        </div>
        <ul class="nav navbar-nav navbar-right" style="margin-top:0;">
            <li>
                <a href = "#">
                    <span class="glyphicon glyphicon-user"> User</span>
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
    <table class="table">
        <tr>
            <td>名称</td>
            <td>描述</td>
            <td>价格</td>
            <td>会员价格</td>
            <td>添加购物车</td>
        </tr>
        <%
            for(Product p : products){
        %>
        <tr>
            <td><%= p.getName()%></td>
            <td><%= p.getDescr()%></td>
            <td><%= p.getNromalprice()%></td>
            <td><%= p.getMemberprice()%></td>
            <td>添加购物车</td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<script src="../code/js/jquery-3.0.0.min.js"></script>
<script src="../code/js/bootstrap.min.js"></script>

</body>
</html>