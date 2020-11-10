<%--
  Created by IntelliJ IDEA.
  User: Windows User
  Date: 2020-11-1
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="Lab1.DBConnector"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>打印数据库</title>
    <link href="Style.css" type="text/css" rel="stylesheet" />
</head>
<body background="${pageContext.request.contextPath }/img/lan2.jpg" style=" background-repeat:no-repeat ; background-size:100% 100%;background-attachment: fixed;">
    <%
        DBConnector db=new DBConnector();
        request. setCharacterEncoding("utf-8");
    %>
    <h1>数据表user信息</h1>
    <table>
        <tr>
            <th>username</th>
            <th>password</th>
        </tr>
        <%
            String sql1 = "SELECT * FROM users";
            ResultSet rs1 = db.showUsers(sql1);
            while(rs1.next()) {
                String username = rs1.getString("username");
                String password = rs1.getString("pass");
        %>
        <tr>
            <td><%= username%></td>
            <td><%= password%></td>
        </tr>
        <%
            }
            rs1.close();
        %>
    </table>

    <h1>数据表person信息</h1>
    <table>
        <tr>
            <th>username</th>
            <th>name</th>
            <th>age</th>
            <th>telenum</th>
        </tr>
        <%
            String sql2 = "SELECT * FROM person";
            ResultSet rs2 = db.showUsers(sql2);
            String age1=new String();
            while(rs2.next()) {
                String username = rs2.getString("username");
                String name = rs2.getString("name");
                int age = rs2.getInt("age");
                String telenum = rs2.getString("teleno");
                if(age==0){
                    age1="";
                }
                else{
                    age1=String.valueOf(age);
                }
        %>
        <tr>
            <td><%= username%></td>
            <td><%= name%></td>
            <td><%= age1%></td>
            <td><%= telenum%></td>
        </tr>
        <%
            }
            rs2.close();
            db.close();
        %>
    </table>
    <p><a href="index.jsp">返回数据库操作</a></p>
</body>
</html>
