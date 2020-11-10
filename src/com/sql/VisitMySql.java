package com.sql;

import java.sql.*;
import java.util.*;

public class VisitMySql {

    GetTime gt=new GetTime();
    // 连接对象
    private Connection conn;
    // 传递sql语句
    private Statement stt;
    // 结果集
    private ResultSet set;
    //连接
    public void Connect(){
        // 获取连接
        try {
            // 获取连接
            conn = DBHerpel.getConnection();
        }catch(Exception e){
            e.printStackTrace();
        }

    }
    //关闭
    public void Close(){
        try{
            conn.close();
            System.out.println("与数据库连接关闭，操作结束！");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    // 查询
    public void Select() {
        try {

            if (conn == null)
                return;
            // 定义sql语句
            String Sql = "select * from user";
            // 执行sql语句
            stt = conn.createStatement();
            // 返回结果集
            set = stt.executeQuery(Sql);
            // 获取数据
            while (set.next()) {

                System.out.println("用户名:" + set.getString(1) + "\t密码:"
                        + set.getString(2)+
                        "\t最后修改时间:"+set.getString(3));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // 使用Statement接口的executeUpdate()方法向数据库添加数据
    public void Add(){

        try {
            //获取连接
            //conn = DBHerpel.getConnection();
            if(conn==null)
                return;
            //获取用户输入的账号和密码
            Scanner input = new Scanner(System.in);
            System.out.print("请输入用户名:");
            String user = input.next();
            System.out.print("请输入密码:");
            String pwd = input.next();
            String time=gt.getTime();
            //定义sql语句
            String sql = "insert into user values('"+user+"' , '"+pwd+"','"+time+"');";
            //获取Statement对象
            stt = conn.createStatement();
            //执行sql语句
            stt.executeUpdate(sql);

            System.out.println("操作成功！");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // 使用PreparedStatement接口的executeUpdate()方法向数据库添加一条数据
    public void Add2() {

        try {
            // 获取连接
            //conn = DBHerpel.getConnection();
            if (conn == null)
                return;

            // 获取用户输入
            System.out.print("请输入用户名:");
            Scanner input = new Scanner(System.in);
            String user = input.next();
            System.out.print("请输入密码:");
            String pwd = input.next();
            String time=gt.getTime();

            // 定义sql语句
            String AddSQL = "INSERT INTO user VALUES (?,?,?);";

            // 创建一个Statement对象
            PreparedStatement ps = conn.prepareStatement(AddSQL);

            //向sql语句的第一个问号添加数据
            ps.setString(1, user);
            //向sql语句的第二个问号添加数据
            ps.setString(2,pwd);
            //向sql语句的第三个问号添加数据
            ps.setString(3,time);
            // 执行sql语句
            ps.executeUpdate();

            System.out.println("操作成功！");


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //使用Statement接口的executeUpdate()方法实现从数据库删除数据
    public void Delete(){
        try {

            //获取连接
            //conn = DBHerpel.getConnection();
            if(conn==null)
                return;

            //提示用户输入要删除的用户
            System.out.print("请输入要删除的用户:");
            Scanner input = new Scanner(System.in);
            String user = input.next();

            //定义sql语句
            String deleteSql = "DELETE FROM user WHERE user='"+user+"';";
            //获取Statement对象
            stt = conn.createStatement();
            //执行sql语句
            stt.executeUpdate(deleteSql);

            System.out.println("操作成功！");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //使用PreparedStatement接口中的executeUpdate()方法实现修改数据
    public void Update(){

        try {
            //获取连接
            //conn = DBHerpel.getConnection();
            if(conn==null)
                return;

            //用户输入要修改的账户
            System.out.print("请输入要修改密码的用户名:");
            Scanner input = new Scanner(System.in);
            String user = input.next();
            //提示用户输入新的密码
            System.out.print("请输入新的密码:");
            String NewPwd = input.next();
            String time=gt.getTime();
            //定义Sql语句
            String UpdateSql = "UPDATE user SET pwds = '"+NewPwd+"' WHERE user = '"+user+"';";
            //创建Statement对象
            PreparedStatement ps = conn.prepareStatement(UpdateSql);
            //执行sql语句
            ps.executeUpdate();

            //定义Sql语句
            String UpdateSql1 = "UPDATE user SET LastUpdateTime = '"+time+"' WHERE user = '"+user+"';";
            //创建Statement对象
            PreparedStatement ps1 = conn.prepareStatement(UpdateSql1);
            //执行sql语句
            ps1.executeUpdate();
            System.out.println("操作成功！");

        } catch (SQLException e) {

            e.printStackTrace();
        }
    }
}
