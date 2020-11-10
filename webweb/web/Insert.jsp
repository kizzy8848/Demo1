<%@page import="Lab1.OperatingPerson" %>
<%@page import="Lab1.DBConnector" %>
<%@page import="Lab1.OperatingUser" %>
<%@page import="Lab1.Person" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.security.Principal" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.util.Locale" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Windows User
  Date: 2020-10-25
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<html>
<head>
    <title>数据库插入操作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="Style.css" type="text/css" rel="stylesheet" />
    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body background="${pageContext.request.contextPath }/img/lan1.jpg" style=" background-repeat:no-repeat ; background-size:100% 100%;background-attachment: fixed;">
<%--
    try{
        HttpServletRequest request

        HttpServletResponse response;
    }catch (ServletException e){
        e.printStackTrace();
    }

--%>
    <%
        DBConnector db=new DBConnector();
        OperatingPerson opP=new OperatingPerson();
        request. setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String name= request.getParameter("name");
        String age = request.getParameter("age");
        String telenum = request.getParameter("teleno");
    %>
    <h1>数据库操作结果</h1>
    <p>
        <%
            try{
                if(username.equals("") || name.equals("")){
                    out.print("未输入username或name，请返回重新操作！");
                }
                else if(age.equals("")){
                    opP.addPerson(new Person(username,name),db);
                }
                else if(age.equals("")==false){
                    int age1=Integer.valueOf(age);
                    if(telenum.equals("")){
                        opP.addPerson(new Person(username,name,age1),db);
                    }
                    else{
                        opP.addPerson(new Person(username,name,age1,telenum),db);
                    }
                }
                out.print("插入用户"+username+"成功！");
        %>
        <%
            }catch (SQLException e){
                out.print("发生异常，插入失败！");
                e.printStackTrace();
            }
            db.close();
        %>
    <br>
    <a href="index.jsp">返回数据库操作</a><br><a href="Show.jsp">查看数据库数据</a>
    </p>
</body>
</html>