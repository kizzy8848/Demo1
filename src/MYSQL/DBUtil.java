package MYSQL;

import java.sql.*;

public class DBUtil {
    public String username = "root";
    public String password = "884899";
    private String url="jdbc:mysql://localhost:3306/test?useSSL=true&characterEncoding=utf-8";
    /**
     * 1. 实现数据库连接的方法
     */
    public Connection getConn() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(url, username, password);
            System.out.println("连接数据库成功.");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * 2. 释放数据库连接
     */
    public void closeConn(ResultSet rs, PreparedStatement pstm, Connection conn) throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (pstm != null) {
            pstm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

}
