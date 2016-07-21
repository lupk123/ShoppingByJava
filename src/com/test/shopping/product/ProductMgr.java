package com.test.shopping.product;

import java.util.List;

/**
 * Created by Administrator on 2016/7/20.
 */
public class ProductMgr {
    private static ProductMgr ourInstance = new ProductMgr();

    public static ProductMgr getInstance() {
        return ourInstance;
    }

    private ProductMgr() {
    }

    private static ProductDAO dao = new ProductMySQLDAO();

    public List<Product> getProducts(){
        return dao.getProducts();
    }
    public int getProducts(List<Product> products, int pageNum, int pageSize, boolean lazy){
        return dao.getProducts(products, pageNum, pageSize, lazy);
    }
    public void update(Product p){
        dao.update(p);
    }
    public void delete(int id){
        dao.delete(id);
    }
    public Product loadById(int id){
        return dao.loadById(id);
    }
    public void insert(Product p){
        dao.insert(p);
    }
    public void delete(String[] ids){
        String conditionStr = "where id in(";
        for(String id : ids){
            conditionStr += id;
            conditionStr += ",";
        }
        conditionStr = conditionStr.replaceAll(",$", ")");
        dao.delete(conditionStr);
    }
    public List<Product> getProducts(int categoryid){
        return dao.getProducts(categoryid);
    }
    public int find(List<Product> products, int pageNum, int pageSize, String query){
        return 0;
    }
}
