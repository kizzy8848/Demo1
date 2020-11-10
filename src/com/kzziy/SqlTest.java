package com.kzziy;

import java.sql.*;

public class SqlTest {
    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return
                    DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=root&password=884899");
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    public static void findAllUser(){
        Connection conn=SqlTest.getConnection();
        try{
            PreparedStatement pst =conn.prepareStatement("select * from user");
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                String username=rs.getString("username");
                String password=rs.getString("password");
                System.out.println(username+"    "+password);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args){
        SqlTest.findAllUser();
    }
}
