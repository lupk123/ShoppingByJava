<%@ page import="com.test.shopping.category.Category" %>
<%@ page import="com.test.shopping.category.CategoryService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    private List<Category> getTopCategories(List<Category> categories){
        List<Category> topCategories = new ArrayList<Category>();
        for(Category c : categories){
            if(c.getGrade() == 1)
                topCategories.add(c);
        }
        return topCategories;
    }

%>
<%
    List<Category> categories = CategoryService.getInstance().getCategories();
    List<Category> topCategories = getTopCategories(categories);
%>
<html>
<head>
    <title>下拉列表</title>
    <script src="code/js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript">
        function getData() {
            var value = $("#d1").val();
            $.ajax({
                cache: false,
                url: "check.jsp",
                type: "post",
                data: {value: value},
                dataType: "json",
                success: function(data){
                    $("#d2").empty(); //情况select
                    $(data).each(function(index, content){
                        var option = document.createElement("option");
                        option.value = content.value;
                        option.text = content.name;
                        $("#d2").append(option);
                    });
                }
            });
        }
        function getData1() {
            var value = $("#d2").val();
            $.ajax({
                cache: false,
                url: "check.jsp",
                type: "post",
                data: {value: value},
                dataType: "json",
                success: function(data){
                    $("#d3").empty(); //情况select
                    //JQuery遍历json数组
                    $(data).each(function(index, content){ //索引 内容
                        var option = document.createElement("option");
                        option.value = content.value;
                        option.text = content.name;
                        $("#d3").append(option);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {

                }
            });
        }
    </script>
</head>
<body>
    <select id = "d1" onchange="getData()">
        <%
            for(Category c : topCategories){
        %>
            <option value="<%= c.getId()%>"><%= c.getName()%></option>
        <%
            }
        %>
    </select>
    <select id = "d2" onchange="getData1()">
    </select>
    <select id = "d3">
    </select>
<script type="text/javascript">
    window.onload = getData();
    setTimeout("getData1()",1000);
</script>
</body>
</html>
