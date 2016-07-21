package com.test.shopping.product;

import com.test.shopping.category.Category;
import com.test.shopping.util.DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/7/20.
 */
public class ProductMySQLDAO implements ProductDAO {

    public Product getFromRs(ResultSet rs){
        Product p = new Product();
        try {
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setDescr(rs.getString("descr"));
            p.setNromalprice(rs.getDouble("normalprice"));
            p.setMemberprice(rs.getDouble("memberprice"));
            p.setPdate(rs.getTimestamp("pdate"));
            p.setCategoryid(rs.getInt("categoryid"));
        }catch(SQLException e){
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public List<Product> getProducts(int categoryid) {
        Connection conn = DB.getConn();
        Statement stmt = DB.getStatement(conn);
        String sql = "select * from product where categoryid = "+categoryid+" order by pdate desc";
        ResultSet rs = DB.getResultSet(stmt, sql);
        List<Product> products = new ArrayList<Product>();
        try{
            while(rs.next()){
                Product p = this.getFromRs(rs);
                products.add(p);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            DB.close(rs);
            DB.close(stmt);
            DB.close(conn);
        }

        return products;
    }

    @Override
    public List<Product> getProducts() {
        Connection conn = DB.getConn();
        Statement stmt = DB.getStatement(conn);
        String sql = "select * from product order by pdate desc";
        ResultSet rs = DB.getResultSet(stmt, sql);
        List<Product> products = new ArrayList<Product>();
        try{
            while(rs.next()){
                Product p = this.getFromRs(rs);
                products.add(p);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            DB.close(rs);
            DB.close(stmt);
            DB.close(conn);
        }

        return products;
    }

    @Override
    public int getProducts(List<Product> products, int pageNum, int pageSize, boolean lazy) {
        Connection conn = DB.getConn();
        Statement stmt = DB.getStatement(conn);
        String sql = null;
        if(lazy){
            sql = "select * from product order by pdate desc";
        }else{
            sql = "select p.id productid, p.name pname, p.descr pdescr, p.normalprice normalprice, " +
                    "p.memberprice memberprice, p.pdate pdate, p.categoryid categoryid, " +
                    "c.id cid, c.pid cpid, c.name cname, c.descr cdescr, c.cno cno, c.grade grade" +
                    " from product p join category c on(p.categoryid = c.id) order by p.pdate desc";
        }
        sql +=  " limit " + (pageNum - 1) * pageSize + "," + pageSize;
//        System.out.print(sql);
        ResultSet rs = DB.getResultSet(stmt, sql);

        Statement cstmt = DB.getStatement(conn);
        String csql = "select count(*) from product";
        ResultSet crs = DB.getResultSet(cstmt, csql);
        int count = -1;

        try{
            if(crs.next())
                count = crs.getInt(1);
            while(rs.next()){
                Product p =null;
                if(lazy){
                    p = this.getFromRs(rs);
                    products.add(p);
                }else
                {
                    p = new Product();
                    p.setId(rs.getInt("productid"));
                    p.setName(rs.getString("pname"));
                    p.setDescr(rs.getString("pdescr"));
                    p.setNromalprice(rs.getDouble("normalprice"));
                    p.setMemberprice(rs.getDouble("memberprice"));
                    p.setPdate(rs.getTimestamp("pdate"));
                    p.setCategoryid(rs.getInt("categoryid"));

                    Category c = new Category();
                    c.setId(rs.getInt("cid"));
                    c.setPid(rs.getInt("cpid"));
                    c.setName(rs.getString("cname"));
                    c.setDescr(rs.getString("cdescr"));
                    c.setCno(rs.getInt("cno"));
                    c.setGrade(rs.getInt("grade"));
                    p.setCategory(c);

                    products.add(p);
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DB.close(crs);
            DB.close(rs);
            DB.close(cstmt);
            DB.close(stmt);
            DB.close(conn);
        }

        return count;
    }

    @Override
    public void update(Product p) {
        Connection conn = DB.getConn();
        String sql = "update product set name = ?, descr = ?, normalprice = ?, memberprice = ?, categoryid = ? where id = ?";
        PreparedStatement pstmt = DB.preparedStatement(conn, sql);

        try{
            pstmt.setString(1, p.getName());
            pstmt.setString(2, p.getDescr());
            pstmt.setDouble(3, p.getNromalprice());
            pstmt.setDouble(4, p.getMemberprice());
            pstmt.setInt(5, p.getCategoryid());
            pstmt.setInt(6, p.getId());
            pstmt.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            DB.close(pstmt);
            DB.close(conn);
        }
    }

    @Override
    public void delete(int id) {
        Connection conn = DB.getConn();
        Statement stmt = DB.getStatement(conn);
        String sql = "delete from product where id = " + id;
        try{
            stmt.executeUpdate(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DB.close(stmt);
            DB.close(conn);
        }
    }

    @Override
    public Product loadById(int id) {
        Connection conn = DB.getConn();
        Statement stmt = DB.getStatement(conn);
        String sql = "select * from product where id = " + id;
        ResultSet rs = DB.getResultSet(stmt, sql);
        Product p = null;
        try{
            if(rs.next())
                p = this.getFromRs(rs);
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            DB.close(rs);
            DB.close(stmt);
            DB.close(conn);
        }
        return p;
    }

    @Override
    public void insert(Product p) {
        Connection conn = DB.getConn();
        String sql = "insert into product values(null, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = DB.preparedStatement(conn, sql);
        try{
            pstmt.setString(1, p.getName());
            pstmt.setString(2, p.getDescr());
            pstmt.setDouble(3, p.getNromalprice());
            pstmt.setDouble(4, p.getMemberprice());
            pstmt.setTimestamp(5, new Timestamp(p.getPdate().getTime()));
            pstmt.setInt(6, p.getCategoryid());
            pstmt.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            DB.close(pstmt);
            DB.close(conn);
        }
    }

    @Override
    public void delete(String conditionStr) {
        Connection conn = DB.getConn();
        Statement stmt = DB.getStatement(conn);
        String sql = "delete from product " + conditionStr;
//        System.out.println(sql);
        DB.executeUpdate(stmt, sql);
        DB.close(stmt);
        DB.close(conn);
    }

    @Override
    public int find(List<Product> products, int pageNum, int pageSize, String query) {
        return 0;
    }
}
