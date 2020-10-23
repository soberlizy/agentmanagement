<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: li
  Date: 2020/10/22
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" isELIgnored="false"  %>
<html>
<head>
    <title>事项列表</title>
    <!--引入jquery-->
    <%--
    web路径
    不以/开头的相对路径，找资源，以当前资源的路径为基准
    以/开始的相对路径 是以服务器的根路径为基准
    --%>
    <%
        request.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>

    <!--引入bootstrap样式-->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script type="text/javascript"></script>
    <script src="${APP_PATH}/static/js/list.js"></script>

</head>
<body>

<div class="jumbotron ">
    <br></br>
    <br></br>
    <br></br>
    <br></br>
    <div class="text-center ">
        <div class=".col-md-12">
            <h1>欢迎来到待办事项管理工具！</h1>
        </div>
    </div>
    <br></br>
    <br></br>
    <br></br>
    <p class="text-center ">即使再小的帆也能远航...</p>
    <br></br>
    <p class="text-center"><a class="btn btn-primary btn-lg"  href="things" role="button">进入系统</a></p>
    <p class="text-center" style="font-size: small">待办事项管理工具.Copyright &copy;2020</p>
</div>

</body>
</html>
