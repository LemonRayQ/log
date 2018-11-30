<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- public样式 -->
    <link rel="stylesheet" href="../public/css/bootstrap.min.css">
    <link rel="stylesheet" href="../public/css/public.css">
    <script src="../public/js/jquery-3.3.1.min.js"></script>
    <script src="../public/js/bootstrap.min.js"></script>
    <script src="../public/fonts/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 自定样式 -->
    <link rel="stylesheet" href="../public/css/public.css">
    <link rel="stylesheet" href="./css/connectMe.css">
</head>

<body>
    <!-- 头部图片和文字 -->
    <div class="container-fluid" style=" background-color : rgb(221, 243, 254)">
        <div class="container header">
            <div class="row">
                <div class="col-md-8">
                    <div class="header-logo">
                        <a href="#">
                            <img src="../public/images/logo.png" alt="logo">
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="header-title">
                        <span>咨询热线：0816-6089184</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 导航栏 -->
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="../Home/Home.jsp">首页</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">部门简介 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../introduce/introduce.jsp">基建概况</a></li>
                            <li><a href="../OfficeDuty.mvc">科室主要职责</a></li>
                        </ul>
                    </li>
                    <li><a href="../selectNoticeNews.mvc?classId=6">政策文件</a></li>
                    <li><a href="../selectWorkNews.mvc?classId=2">工作动态</a></li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">通知公告 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../selectNoticeNews.mvc?classId=1">通知</a></li>
                            <li><a href="../selectNoticeNews.mvc?classId=14">信息公示</a></li>
                            <li><a href="../selectNoticeNews.mvc?classId=12">中标候选人公示</a></li>
                            <li><a href="../selectNoticeNews.mvc?classId=13"> 竞争性谈判公告</a></li>
                        </ul>
                    </li>
                    <li><a href="../selectPolicy.mvc">规章制度</a></li>
                    <li><a href="../selectNoticeNews.mvc?classId=8">党建廉政</a></li>
                    <li><a href="../selectContent.mvc?classId=5">服务指南</a></li>
                    <li><a href="../achievement/achievement.jsp">成果展示</a></li>
                    <li><a href="../selectContent.mvc?classId=7">联系我们</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 内容展示区域 -->
    <div class="container-fluid">
        <div class="rules-content">
            <!-- 右侧消息展示区域 -->
            <div class="content-right">
                <div class="content-news">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <p class="title">
                                <span>
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-tongzhi"></use>
                                    </svg>&nbsp;
                                </span>
                                &nbsp;&nbsp;
                                <span class="title-header">联系方式</span>
                            </p>
                            <ol class="breadcrumb">
                                <li><a href="../Home/Home.jsp">网站首页</a></li>
                                <li><a href="#">联系我们</a></li>
                             
                            </ol>
                        </div>
                        <div class="panel-body">
                            <!-- 正文内容 -->
                            <div class="item-work">                             
                                <div class="work-content">
                                    ${content.content}
                                </div>
                            </div>
                            <!-- 一个内容 -->
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 页脚 -->
    <div class="container-fluid">
        <div class="footer">
            <span>Copyright 2010-2011 Hqc.pzhu.edu.cn Inc.All Rights Reserved.攀枝花学院后勤管理处 版权所有 </span>
            <span>地址：四川省攀枝花市东区机场路10号 电话：0812-85583114 邮编：617000 技术支持：苏俊</span>
        </div>
    </div>
    <!-- 回到顶部 -->
    <div class="back-header">
        <svg class="icon-icon-test " aria-hidden="true">
            <use xlink:href="#icon-icon-test"></use>
        </svg>
    </div>

</body>
<script src="../public/js/public.js"></script>
</html>