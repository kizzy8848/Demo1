<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: Windows User
  Date: 2020-10-25
  Time: 02:02
To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>谢正宇的lab2</title>
  <!-- 指定字符集 -->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <!-- 1. 导入CSS的全局样式 -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
  <script src="js/jquery-2.1.0.min.js"></script>
  <!-- 3. 导入bootstrap的js文件 -->
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript">
    function checkAge() {
      var flag = true;
      var ele = document.getElementById("age");
      var regNumber = /^[0-9]+$/ ;
      if(ele.value==null||ele.value=="") return false;
      if(!regNumber.test(ele.value)) {
        alert("Age's type should be integer!");
        flag = false;
      }
      if(flag) document.getElementById("agespan").innerHTML=
              "<font style='color:green;font-size:15px' <b>输入格式正确</b> </font>"
      else document.getElementById("agespan").innerHTML=
              "<font style='color:red;font-size:15px' <b>输入格式错误</b> </font>"
      return flag;
    }
    function checkName() {
      var flag = true;
      var ele = document.getElementById("name");
      var regNumber = /^.{0,20}$/ ;
      if(ele.value==""||ele.value==null){
        return false;
      }
      if(!regNumber.test(ele.value)) {
        alert("Name's length should be no more than 20!");
        flag = false;
      }
      if(flag) document.getElementById("namespan").innerHTML=
              "<font style='color:green;font-size:15px' <b>输入格式正确</b> </font>"
      else document.getElementById("namespan").innerHTML=
              "<font style='color:red;font-size:15px' <b>输入格式错误</b> </font>"
      return flag;
    }
    function checkTelenum() {
      var flag = true;
      var ele = document.getElementById("teleno");
      var regNumber = /^1[3456789]\d{9}$/ ;
      if(ele.value==""||ele.value==null) return flag;
      if(!regNumber.test(ele.value)) {
        alert("Telenum's format is wrong!");
        flag = false;
      }
      if(flag) document.getElementById("telenumspan").innerHTML=
              "<font style='color:green;font-size:15px' <b>输入格式正确</b> </font>"
      else document.getElementById("telenumspan").innerHTML=
              "<font style='color:red;font-size:15px' <b>输入格式错误</b> </font>"
      return flag;
    }
    function checkUsername1() {
      var flag = true;
      var ele = document.getElementById("username1");
      var regNumber = /^.{0,10}$/ ;
      if(ele.value==""||ele.value==null) {
        alert("Please input person's username !");
        return false;
      }
      else if(!regNumber.test(ele.value)) {
        alert("Username's length should be no more than 10!");
        flag = false;
      }
      if(flag) document.getElementById("username1span").innerHTML=
              "<font style='color:green;font-size:15px' <b>输入格式正确</b> </font>"
      else document.getElementById("username1span").innerHTML=
              "<font style='color:red;font-size:15px' <b>输入格式错误</b> </font>"
      return flag;
    }
    function checkUsername2() {
      var flag = true;
      var ele = document.getElementById("username2");
      var regNumber = /^.{0,10}$/ ;
      if(ele.value==""||ele.value==null) {
        alert("Please input user's username !");
        document.getElementById("username2span").innerHTML=
                "<font style='color:red;font-size:15px' <b>username不能为空</b> </font>"
        return false;
      }
      else if(!regNumber.test(ele.value)) {
        alert("Username's length should be no more than 10!");
        flag = false;
      }
      if(flag) document.getElementById("username2span").innerHTML=
              "<font style='color:green;font-size:15px' <b>输入格式正确</b> </font>"
      else document.getElementById("username2span").innerHTML=
              "<font style='color:red;font-size:15px' <b>输入格式错误</b> </font>"
      return flag;
    }
    function checkSubmit1() {
        if(document.getElementById("username1").value==null||document.getElementById("username1").value==""){
            alert("Please input person'username !");
            document.getElementById("username1span").innerHTML=
                "<font style='color:red;font-size:15px' <b>username不能为空</b> </font>"
            return false;
        }
        if (document.getElementById("name").value==null||document.getElementById("name").value==""){
            alert("Please input person'name !");
            document.getElementById("namespan").innerHTML=
                "<font style='color:red;font-size:15px' <b>name不能为空</b> </font>"
            return false;
        }
    }
    function checkSubmit2() {
        var flag = true;
        var ele = document.getElementById("username2");
        var regNumber = /^.{0,10}$/ ;
        if(ele.value==""||ele.value==null) {
            alert("Please input user's username !");
            document.getElementById("username2span").innerHTML=
                "<font style='color:red;font-size:15px' <b>username不能为空</b> </font>"
            return false;
        }
        else if(!regNumber.test(ele.value)) {
            alert("Username's length should be no more than 10!");
            flag = false;
        }
        if(flag) document.getElementById("username2span").innerHTML=
            "<font style='color:green;font-size:15px' <b>输入格式正确</b> </font>"
        else document.getElementById("username2span").innerHTML=
            "<font style='color:red;font-size:15px' <b>输入格式错误</b> </font>"

        return flag;
    }
  </script>
</head >
<body background="${pageContext.request.contextPath }/img/lan.jpg" style=" background-repeat:no-repeat ; background-size:100% 100%;background-attachment: fixed;">
<%
  System.out.println(new Date());
%>
<div class="container">
  <center> <h3>数据库表person插入信息</h3> </center>
  <form action="Insert.jsp" onsubmit="return checkSubmit1()" method="post">
    <%--          <input type="hidden" name="type" value="person">--%>
    <div class="form-group">
      <center>
      <label for="username1">username：</label><span id="username1span"></span>
      <input type="text" class="form-control" id="username1" name="username" onblur="checkUsername1()" style="width: 400px;" maxlength="20" placeholder="Please input username">
      </center>
    </div>

    <div class="form-group">
      <center>
      <label for="name">name：</label><span id="namespan"></span>
      <input type="text" class="form-control" id="name" name="name" onblur="checkName()" style="width: 400px;" maxlength="20" placeholder="Please input name">
      </center>
    </div>

    <div class="form-group">
      <center>
      <label for="age">age：</label><span id="agespan"></span>
      <input type="text" class="form-control" id="age" name="age" onblur="checkAge()" placeholder="Please input age" style="width: 400px;" maxlength="20">
      </center>
    </div>

    <div class="form-group">
      <center>
      <label for="teleno">telenum：</label><span id="telenumspan"></span>
      <input type="text" class="form-control" id="teleno" name="teleno" onblur="checkTelenum()" placeholder="Please input age" style="width: 400px;" maxlength="20">
      </center>
    </div>

    <div class="form-group" style="text-align: center">
      <input class="btn btn-primary" type="submit" onclick="return confirm('请确认所有信息均已输入？')" value="提交" />
      <input class="btn btn-default" type="reset" onclick="return confirm('确认重置？')" value="重置" >
      <input class="btn btn-default" type="button" onclick="return confirm('确认返回？')" value="返回" />
    </div>
  </form>
</div>

<div class="container">
  <center> <h3>数据库表users删除信息</h3> </center>
  <%--        ${pageContext.request.contextPath}/delUserServlet--%>
  <form action="Delete.jsp" onsubmit="return checkSubmit2()" method="post">
    <%--            <input type="hidden" name="type" value="person">--%>
    <div class="form-group">
      <center>
      <label for="username2">username：</label><span id="username2span"></span>
      <input type="text" class="form-control" id="username2" name="username2" onblur="checkUsername2()" placeholder="Please input username" style="width: 400px;" maxlength="20">
      </center>
    </div>
      <div class="form-group" style="text-align: center">
        <input class="btn btn-primary" type="submit" onclick="return confirm('确认删除该用户？')" value="提交" />
        <input class="btn btn-default" type="reset" onclick="return confirm('确认重置？')" value="重置" >
        <input class="btn btn-default" type="button" onclick="return confirm('确认返回？')" value="返回" />
        <%--<input class="btn btn-default" type="reset" onclick="alert('欢迎！')" value="测试" />--%>
      </div>
  </form>
</div>
<script>
  //鼠标点击出现爱心特效
  (function(window,document,undefined){
    var hearts = [];
    window.requestAnimationFrame = (function(){
      return window.requestAnimationFrame ||
              window.webkitRequestAnimationFrame ||
              window.mozRequestAnimationFrame ||
              window.oRequestAnimationFrame ||
              window.msRequestAnimationFrame ||
              function (callback){
                setTimeout(callback,1000/60);
              }
    })();
    init();
    function init(){
      css(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: absolute;}.heart:after{top: -5px;}.heart:before{left: -5px;}");
      attachEvent();
      gameloop();
    }
    function gameloop(){
      for(var i=0;i<hearts.length;i++){
        if(hearts[i].alpha <=0){
          document.body.removeChild(hearts[i].el);
          hearts.splice(i,1);
          continue;
        }
        hearts[i].y--;
        hearts[i].scale += 0.004;
        hearts[i].alpha -= 0.013;
        hearts[i].el.style.cssText = "left:"+hearts[i].x+"px;top:"+hearts[i].y+"px;opacity:"+hearts[i].alpha+";transform:scale("+hearts[i].scale+","+hearts[i].scale+") rotate(45deg);background:"+hearts[i].color;
      }
      requestAnimationFrame(gameloop);
    }
    function attachEvent(){
      var old = typeof window.onclick==="function" && window.onclick;
      window.onclick = function(event){
        old && old();
        createHeart(event);
      }
    }
    function createHeart(event){
      var d = document.createElement("div");
      d.className = "heart";
      hearts.push({
        el : d,
        x : event.clientX - 5,
        y : event.clientY - 5,
        scale : 1,
        alpha : 1,
        color : randomColor()
      });
      document.body.appendChild(d);
    }
    function css(css){
      var style = document.createElement("style");
      style.type="text/css";
      try{
        style.appendChild(document.createTextNode(css));
      }catch(ex){
        style.styleSheet.cssText = css;
      }
      document.getElementsByTagName('head')[0].appendChild(style);
    }
    function randomColor(){
      return "rgb("+(~~(Math.random()*255))+","+(~~(Math.random()*255))+","+(~~(Math.random()*255))+")";
    }
  })(window,document);
</script>
<%--    <center><h4><a href="<%=request.getContextPath()%>/listServlet">查看数据库数据</a></h4> </center>--%>
</body>
<%--<body  background="${pageContext.request.contextPath }/img/lan3.jpg" style=" background-repeat:no-repeat ; background-size:100% 100%;background-attachment: fixed;">
<form action="Insert.jsp">
  <table>
    <tr><th colspan="8">数据表person插入信息</th></tr>
    <tr>
      <td>username</td>
      <td width="200px"><input type="text" name="username"/></td>
    </tr>
    <tr>
      <td>name</td>
      <td><input type="text" name="name"/></td>
    </tr>
    <tr>
      <td>age</td>
      <td><input type="text" name="age"/></td>
    </tr>
    <tr>
      <td>telenum</td>
      <td><input type="text" name="telenum"/></td>
    </tr>
    <tr><td colspan="8"><input type="submit" value="插入"></td></tr>
  </table>
  <br>
</form>
<form action="Delete.jsp">
  <table>
    <tr><th colspan="8">数据表user删除信息</th></tr>
    <tr>
      <td>username</td>
      <td width="200px"><input type="text" name="username"/></td>
    </tr>
    <tr>
      <td colspan="8"><input type="submit" value="删除" /></td>
    </tr>
  </table>
</form>
</body>--%>
</html>
