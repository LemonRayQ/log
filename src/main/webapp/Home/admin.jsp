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
    <link rel="icon" href="../title.ico" type="image/x-icon"/>
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
                    <div class="account">
                        <label for="username">帐号</label>
                        <input type="text" name="userId" id="username" class="form-c" placeholder="请输入账号">
                    </div>

                    <div class="pas">
                        <label for="password">密碼</label>
                        <input type="password" name="password" id="password" class="form-c" id="exampleInputAmount"
                               placeholder="请输入密码">
                    </div>

                <input type="radio" name="identity" value="0" checked>管理员
                <input type="radio" name="identity" value="1">超级管理员
                <div class="form-group">
                    <input type="submit" class="btn btn-primary btn-login" value="登录">
                </div>
            </form>
        </div>
    </div>
    <div class="show"></div>
</div>
</body>
</html>