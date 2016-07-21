package com.test.shopping.product;

import com.test.shopping.category.Category;

import java.util.Date;

/**
 * Created by Administrator on 2016/7/20.
 */
public class Product {
    private int id;
    private String name;
    private String descr;
    private double nromalprice;
    private double memberprice;
    private Date pdate;
    private int categoryid;
    private Category category;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public double getNromalprice() {
        return nromalprice;
    }

    public void setNromalprice(double nromalprice) {
        this.nromalprice = nromalprice;
    }

    public double getMemberprice() {
        return memberprice;
    }

    public void setMemberprice(double memberprice) {
        this.memberprice = memberprice;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }
}