package com.test.shopping.user;

import com.test.shopping.util.DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/7/15.
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String phone;
    private String addr;
    private Date rdate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Date getRdate() {
        return rdate;
    }

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }

    /**
     * 注册用户
     */
    public void insert(){
        Connection conn = DB.getConn();
        String sql = "insert into user values(null, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = DB.preparedStatement(conn, sql);
        try {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, phone);
            pstmt.setString(4, addr);
            pstmt.setTimestamp(5, new Timestamp(rdate.getTime()));
            pstmt.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally {
            DB.close(pstmt);
            DB.close(conn);
        }
    }

    /**
     * 用户登录
     * @param username 用户名
     * @param password 密码
     * @return User类
     */
    public static User check(String username, String password){
        Connection conn = DB.getConn();
        Statement stmt = DB.getStatement(conn);
        String sql = "select * from user where username = '" + username +"'";
        ResultSet rs = DB.getResultSet(stmt, sql);
        User user = null;
        try{
            if(!rs.next())
                throw new UserNotFoundException("用户不存在" + username);
            else{
                if(!password.equals(rs.getString("password")))
                    throw new PasswordNotFoundException("密码不正确" + password);
                else{
                    user = new User();
                    user.setUsername(username);
                    user.setPassword(password);
                    user.setPhone(rs.getString("phone"));
                    user.setAddr(rs.getString("addr"));
                    user.setRdate(rs.getTimestamp("rdate"));
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            DB.close(rs);
            DB.close(stmt);
            DB.close(conn);
        }
        return user;
    }

    /**
     * 获取用户列表
     * @return 用户列表
     */
    public static List<User> getUsers(){
        Connection conn = DB.getConn();
        Statement stmt = DB.getStatement(conn);
        String sql = "select * from user";
        ResultSet rs = DB.getResultSet(stmt, sql);
        List<User> users = new ArrayList<User>();
        try {
            while(rs.next()){
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddr(rs.getString("addr"));
                user.setRdate(rs.getTimestamp("rdate"));
                users.add(user);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            DB.close(rs);
            DB.close(stmt);
            DB.close(conn);
        }
        return users;
    }

    /**
     * 获取用户总数量 并且 将用户装入users
     * @param users 用户列表
     * @param pageSize 每页显示的数量
     * @param pageNum 页码
     * @return 用户数量
     */
    public static int getUsersCount(List<User> users, int pageSize, int pageNum){
        int count = 0;
        Connection conn = DB.getConn();
        Statement stmt = DB.getStatement(conn);
        int start = (pageNum - 1) * pageSize;
        String sql = "select * from user limit " + start + "," + pageSize;
        ResultSet rs = DB.getResultSet(stmt, sql);
        Statement cstmt = DB.getStatement(conn);
        String csql = "select count(*) from user";
        ResultSet crs = DB.getResultSet(cstmt, csql);

        try{
            crs.next();
            count = crs.getInt(1);

            while(rs.next()){
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddr(rs.getString("addr"));
                user.setRdate(rs.getTimestamp("rdate"));
                users.add(user);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            DB.close(rs);
            DB.close(crs);
            DB.close(stmt);
            DB.close(cstmt);
            DB.close(conn);
        }

        return count;
    }

    /**
     * 删除用户
     * @param id 用户id
     */
    public static void del(int id){
        Connection conn = DB.getConn();
        Statement stmt = DB.getStatement(conn);
        String sql = "delete from user where id = " + id;
        try{
            stmt.executeUpdate(sql);
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            DB.close(stmt);
            DB.close(conn);
        }
    }
}
