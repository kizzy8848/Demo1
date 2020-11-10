<%@page import="Lab1.DBConnector" %>
<%@page import="Lab1.OperatingUser" %>
<%@page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Windows User
  Date: 2020-10-25
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>数据库删除操作</title>
    <link href="Style.css" type="text/css" rel="stylesheet" />
</head>
<body background="${pageContext.request.contextPath }/img/lan1.jpg" style=" background-repeat:no-repeat ; background-size:100% 100%;background-attachment: fixed;">
<%
    DBConnector db=new DBConnector();
    OperatingUser opU=new OperatingUser();
    request. setCharacterEncoding("utf-8");
    String username = request.getParameter("username2");

%>
<h1>数据库操作结果</h1>
<p>
    <%
        String sql1 = "select * from users where username = '"+username+"' ;";
        ResultSet rs1 = db.showUsers(sql1);
        if(rs1.next()){
            opU.deleteUser(username,db);
           //out.println("删除用户"+username+"成功！");
    %>
     <%
        }
        else {
            out.println("users不存在"+username+",删除失败！！！");
        }
        db.close();
    %>
    <br>
    <a href="index.jsp">返回数据库操作</a><br>
    <a href="Show.jsp">查看数据库数据</a>
</p>

</body>
</html>
