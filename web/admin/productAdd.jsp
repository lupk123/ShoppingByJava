<%@ page import="com.test.shopping.category.Category" %>
<%@ page import="com.test.shopping.category.CategoryService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.shopping.product.Product" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.test.shopping.product.ProductMgr" %>
<%@ page import="javax.xml.ws.Response" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/21
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");
    if(action != null && action.equals("post")){
        String name = request.getParameter("name");
        String descr = request.getParameter("descr");
        double normalprice = Double.parseDouble(request.getParameter("normalprice"));
        double memberprice = Double.parseDouble(request.getParameter("memberprice"));

        int categoryid = -1;
        String strCategoryid = request.getParameter("categoryid");
        if(strCategoryid != null && !strCategoryid.trim().equals("")) {
            categoryid = Integer.parseInt(strCategoryid);
        }
        Product p = new Product();
        p.setName(name);
        p.setDescr(descr);
        p.setNromalprice(normalprice);
        p.setMemberprice(memberprice);
        p.setPdate(new Date());
        p.setCategoryid(categoryid);
        ProductMgr.getInstance().insert(p);
        response.sendRedirect("product.jsp");
    }

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加产品</title>
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
                    <div id="collapseTwo" class="panel-collapse collapse">
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
                    <div id="collapseThree" class="panel-collapse collapse in">
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
        <div class="col-sm-6 col-md-9">
            <form method="post" action="productAdd.jsp">
                <input type="hidden" name = "action" value = "post"/>
                <table class="table">
                    <thead>
                    <tr>
                        <td colspan="2"><span class = "h3">添加产品</span></td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>名称: </td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td>描述：</td>
                        <td><input type="text" name="descr"></td>
                    </tr>
                    <tr>
                        <td>普通价格：</td>
                        <td><input type="text" name="normalprice"></td>
                    </tr>
                    <tr>
                        <td>会员价格：</td>
                        <td><input type="text" name="memberprice"></td>
                    </tr>
                    <tr>
                        <td>所属类别：</td>
                        <td>
                            <select name="categoryid">
                            <%
                                List<Category> categories = CategoryService.getInstance().getCategories();
                                for(Category c : categories) {
                                    String selected = "";
                                    String preStr = "";
                                    for(int i = 1; i < c.getGrade(); i++) preStr += "--";
                            %>
                            <option value="<%=c.getId()%>"><%=preStr + c.getName()%></option>
                            <%
                                }
                            %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value = "添加" class="btn btn-info"></td>
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