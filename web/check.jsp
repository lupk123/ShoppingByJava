<%@ page import="com.test.shopping.category.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.test.shopping.category.CategoryService" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    private List<Category> getChild(List<Category> categories, int id){
        List<Category> childs = new ArrayList<Category>();
        for(Category c: categories){
            if(c.getPid() == id)
                childs.add(c);
        }
        return childs;
    }
%>
<%
    List<Category> categories = CategoryService.getInstance().getCategories();
    String value = request.getParameter("value");
    int id = Integer.parseInt(value.trim());
    List<Category> childs = getChild(categories, id);

    /**
     *  下面的代码是建立json数组
     *  此数组相当于List<Map<String, Object>>的映射
     */
    JSONArray json = new JSONArray();
    JSONObject j;
    for(Category c: childs){
        j = new JSONObject();
        j.put("value", c.getId());
        j.put("name", c.getName());
        json.put(j);
    }

    PrintWriter write = response.getWriter();
    write.print(json.toString());
%>