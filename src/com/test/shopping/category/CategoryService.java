package com.test.shopping.category;

import com.test.shopping.util.DB;

import java.sql.*;
import java.util.Collection;

/**
 * Created by Administrator on 2016/7/18.
 */
public class CategoryService {
    private static CategoryService service;
    private CategoryService(){}

    /**
     * 静态工厂方法
     * @return 返回service对象
     */
    public static CategoryService getInstance(){
        if(service == null){
            return new CategoryService();
        }
        return service;
    }

    /**
     * 插入类别
     * @param c 类别
     */
    public void insert(Category c){
        Connection conn = DB.getConn();
        try{
            conn.setAutoCommit(false);
        }catch(SQLException e){
            e.printStackTrace();
        }

        String sql = "insert into category values(null, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = DB.preparedStatement(conn, sql);

        try{
            pstmt.setInt(1, c.getId());
            pstmt.setString(2, c.getName());
            pstmt.setString(3, c.getDescr());
            pstmt.setInt(4, c.getCno());
            pstmt.setInt(5, c.getGrade());
            pstmt.executeUpdate();
            conn.commit();
        }catch(SQLException e){
            try{
                conn.rollback();
            }catch(SQLException e1){
                e1.printStackTrace();
            }
            e.printStackTrace();
        }finally {
            try{
                conn.setAutoCommit(true);
            }catch(SQLException e){
                e.printStackTrace();
            }
            DB.close(pstmt);
            DB.close(conn);
        }
    }

    /**
     * 获取应该插入的cno
     * @param conn 链接
     * @param c 类别
     * @return cno
     */
    private int getNextCno(Connection conn, Category c) {
        int cno = -1;

        String sqlMax = "select max(cno) from category where pid = " + c.getPid();
        Statement stmtMax = DB.getStatement(conn);
        ResultSet rsMax = DB.getResultSet(stmtMax, sqlMax);

        try {
            rsMax.next();
            int cnoMax = rsMax.getInt(1);
            System.out.println(cnoMax);
            //计算节点的基数,如用两位表示就是100，三位表示就是1000等
            int baseNumber = (int)Math.pow(10, Category.LEVEL_LENGTH);
            //构建cstr要加上的数字
            int numberToAdd = (int)Math.pow(baseNumber, Category.MAX_GRADE - c.getGrade());

            if(cnoMax == 0) { //要加入的节点是该父亲下面的第一个子节点
                if(c.getPid() == 0) { //最顶层节点
                    cno = numberToAdd;
                } else { //其他层节点
                    int parentCno = getParentCno(conn, c); //拿到父亲代表串
                    cno = parentCno + numberToAdd;
                }
            } else { //加入的节点不是该父亲下面的第一个
                cno = cnoMax + numberToAdd;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(rsMax);
            DB.close(stmtMax);
        }

        return cno;
    }

    public int getParentCno(Connection conn, Category child){
        int pno = 1;
        Statement stmt = DB.getStatement(conn);
        return pno;
    }
}
