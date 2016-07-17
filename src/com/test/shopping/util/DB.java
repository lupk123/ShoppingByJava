package com.test.shopping.util;

import java.sql.*;

/**
 * Created by Administrator on 2016/7/14.
 */
public class DB {
    public static Connection getConn(){
        Connection conn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/shopping?user=root&password=zxj1121";
            conn = DriverManager.getConnection(url);
        }catch (SQLException e){
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return conn;
    }

    public static PreparedStatement preparedStatement(Connection conn, String sql){
        PreparedStatement pstmt = null;
        try{
            if(conn != null)
              pstmt = conn.prepareStatement(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return pstmt;
    }

    public static PreparedStatement preparedStatement(Connection conn,  String sql, int autoGenereatedKeys) {
        PreparedStatement pstmt = null;
        try {
            if(conn != null) {
                pstmt = conn.prepareStatement(sql, autoGenereatedKeys);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pstmt;
    }

    public static Statement getStatement(Connection conn){
        Statement stmt = null;
        try{
            if(conn != null){
                stmt = conn.createStatement();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return stmt;
    }

    public static ResultSet getResultSet(Statement stmt, String sql){
        ResultSet rs = null;
        try{
            if (stmt != null)
                rs = stmt.executeQuery(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return rs;
    }

    public static void executeUpdate(Statement stmt, String sql){
        try{
            if(stmt != null)
                stmt.executeUpdate(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void close(Connection conn){
        try{
            if(conn != null){
                conn.close();
                conn = null;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void close(Statement stmt){
        try{
            if(stmt != null){
                stmt.close();
                stmt = null;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void close(PreparedStatement pstmt){
        try{
            if(pstmt != null){
                pstmt.close();
                pstmt = null;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void close(ResultSet rs){
        try{
            if(rs != null){
                rs.close();
                rs = null;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
