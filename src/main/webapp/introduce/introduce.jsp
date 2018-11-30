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
    <link rel="stylesheet" href="./css/introduce.css">
</head>

<body>
    <!-- 头部图片和文字 -->
    <jsp:include page="../publicPage/title.jsp"/>

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
                                <span class="title-header">${content[0].classify.name}</span>
                            </p>
                            <ol class="breadcrumb">
                                <li><a href="../Home/Home.jsp">网站首页</a></li>
                                <li><a href="#">
                                    ${content[0].classify.name}
                                </a></li>
                             
                            </ol>
                        </div>
                        <div class="panel-body">
                            <!-- 正文内容 -->
                            <div class="item-work">                             
                                <div class="work-content">
                                    ${content[0].content}
                                </div>
                            </div>
                            <!-- 一个内容 -->
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../publicPage/foot.jsp"/>

</body>
<script src="../public/js/public.js"></script>
</html>