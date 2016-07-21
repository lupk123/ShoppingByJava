package com.test.shopping.product;

import java.util.List;

/**
 * Created by Administrator on 2016/7/20.
 */
public interface ProductDAO {
    public List<Product> getProducts();
    public List<Product> getProducts(int categoryid);
    public int getProducts(List<Product> products, int pageNum, int pageSize, boolean lazy);
    public void update(Product p);
    public void delete(int id);
    public Product loadById(int id);
    public void insert(Product p);
    public void delete(String conditionStr);
    public int find(List<Product> products, int pageNum, int pageSize, String query);
}
