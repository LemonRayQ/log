<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <!-- 引入bootstrap -->
    <link rel="stylesheet" href="../backdemo/public/css/bootstrap.min.css">
    <script type="text/javascript" src="../backdemo/public/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../backdemo/public/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../backdemo/public/icon/font_9rqbtihwbsm/iconfont.js"></script>
    <!-- 自定义样式 -->
    <link rel="stylesheet" href="../Home/login/css/login.css">
</head>

<body>
<div class="container-fluid">
    <div class="login-content">
        <!-- logo或者字体样式 -->
        <div class="logo">
            <h1>后勤管理员登录界面</h1>
        </div>
        <!-- 登录界面的样式 -->
        <div class="login-form">
            <form action="../login.mvc" method="POST" role="form">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        </div>
                        <input type="text" name="userId" class="form-control" placeholder="请输入账号">
                    </div>

                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                        </div>
                        <input type="password" name="password" class="form-control" id="exampleInputAmount"
                               placeholder="请输入密码">
                    </div>
                </div>
                <input type="radio" name="identity" value="0" checked>管理员
                <input type="radio" name="identity" value="1">超级管理员
                <div class="form-group">
                    <input type="submit" class="form-control btn btn-primary" value="登录">
                </div>
            </form>
        </div>
    </div>
    <div class="show"></div>
</div>
</body>
</html>