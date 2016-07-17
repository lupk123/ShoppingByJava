package com.test.shopping.user;

import com.test.shopping.util.DB;

import java.sql.*;
import java.util.Date;

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
}
