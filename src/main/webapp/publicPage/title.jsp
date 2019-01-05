<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 头部图片和文字 -->
<div class="container-fluid" style=" background-color : rgb(221, 243, 254); padding: 0px;">
    <div class="container header">
        <div class="header-logo">
            <div class="logo-left">
                <div class="logo-img">
                    <img src="<%=basePath%>public/images/logo1.png" alt="">
                </div>
                <div class="logo-text">
                    <img src="<%=basePath%>public/images/panzhihua.png" alt="">
                </div>
            </div>
            <div class="logo2">
                <img src="<%=basePath%>public/images/houqin.png" alt="">
            </div>
        </div>
    </div>
</div>
<!-- 导航栏 -->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="./Home">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">部门简介 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="./selectContent?classId=15">基建概况</a></li>
                        <li><a href="./OfficeDuty">科室主要职责</a></li>
                    </ul>
                </li>
                <li><a href="./selectNoticeNews?classId=9">规章制度</a></li>
                <li><a href="./selectWorkNews?classId=2">工作动态</a></li>
                <li class="dropdown">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">通知公告 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="./selectNoticeNews?classId=1">通知</a></li>
                        <li><a href="./selectNoticeNews?classId=14">信息公示</a></li>
                        <li><a href="./selectNoticeNews?classId=12">中标候选人公示</a></li>
                        <li><a href="./selectNoticeNews?classId=13"> 竞争性谈判公告</a></li>
                    </ul>
                </li>
                <li><a href="./selectPolicy">政策文件</a></li>
                <li><a href="./selectNoticeNews?classId=8">党建廉政</a></li>
                <li><a href="./selectContent?classId=5">服务指南</a></li>
                <li><a href="./selectAchievement">成果展示</a></li>
                <li><a href="./connect">联系我们</a></li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
