<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- bootstrap组件 -->
    <link rel="stylesheet" href="<%=basePath%>public/css/bootstrap.min.css">

    <!-- 引入轮播图 -->
    <link rel="stylesheet" href="<%=basePath%>Home/css/swiper.min.css">


    <!-- bootstrap .js -->
    <script type="text/javascript" src="<%=basePath%>public/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>public/js/bootstrap.min.js"></script>


    <!-- 轮播图的样式.js -->
    <script type="text/javascript" src="<%=basePath%>Home/js/swiper.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>Home/js/swiper.esm.js"></script>
    <script type="text/javascript" src="<%=basePath%>Home/js/swiper.esm.bundle.js"></script>

    <!-- 字体图标样式 -->
    <script type="text/javascript" src="<%=basePath%>Home/fonts/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 自定义的样式 -->
    <link rel="stylesheet" href="../public/css/public.css">
    <link rel="stylesheet" href="<%=basePath%>Home/css/Home.css">
    <link rel="stylesheet" href="./css/HomeTest.css">
</head>

<body>
<!-- 头部图片和文字 -->
<div class="container-fluid" style=" background-color : rgb(221, 243, 254); padding: 0px;">
    <div class="container header">
        <div class="header-logo">
            <div class="logo-left">
                <div class="logo-img">
                    <img src="../public/images/logo1.png" alt="">
                </div>
                <div class="logo-text">
                    <img src="../public/images/panzhihua.png" alt="">
                </div>
            </div>
            <div class="logo2">
                <img src="../public/images/houqin.png" alt="">
                <div class="lookthrough">
                    <span>浏览次数：</span>
                    <small style="color:red">${visit_count}</small>
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
                <li><a href="./Home.jsp">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">部门简介 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="../selectContent.mvc?classId=15">基建概况</a></li>
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
                <li><a href="../selectAchievement.mvc">成果展示</a></li>
                <li><a href="../selectContent.mvc?classId=7">联系我们</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- 轮播图 -->
<div class="lb container-fluid ">
    <div class="lunbotu">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <!-- 轮播图盒子 -->
                <c:forEach items="${imageList}" var="shuffling">
                    <div class="swiper-slide">
                        <img src="/logistics/${shuffling.path}" alt="哦豁,出bug了！">
                    </div>
                </c:forEach>
            </div>
            <!-- 如果需要分页器 -->
            <div class="swiper-pagination"></div>

            <!-- 如果需要导航按钮 -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>

        </div>
    </div>
</div>

<div class="container">
    <div class="news-content">
        <div class="news">
            <div class="page-header">
                <h3>新闻通知</h3>
            </div>
            <ul class="new-item">
                <c:forEach items="${impotanceNews}" var="importance">
                    <li>
                        <div class="title">
                        <span>
                             【${importance.department.name}】
                        </span>
                            <a href="../notice.mvc?newsId=${importance.newsId}">${importance.title}</a>
                        </div>
                        <span class="date">
                            <fmt:formatDate value="${importance.time}" pattern="yyyy-MM-dd"/>
                        </span>
                    </li>
                </c:forEach>

            </ul>
        </div>
        <div class="barcode">
            <div class="img-item">
                <img src="./images/1.png" alt="">
                <div class="text">微信</div>
            </div>
            <div class="img-item">
                <img src="./images/1.png" alt="">
                <div class="text">微博</div>
            </div>
            <div class="img-item">
                <img src="./images/1.png" alt="">
                <div class="text">微博</div>
            </div>
            <div class="img-item">
                <img src="./images/1.png" alt="">
                <div class="text">微博</div>
            </div>
        </div>
    </div>
</div>

<!-- 友情链接 -->
<div class="container">
    <div class="friend-link">
        <p class="title">
                <span>
                    <svg class="icon-lianjie" aria-hidden="true">
                        <use xlink:href="#icon-lianjie"></use>
                    </svg>
                </span>
            <span>友情链接:</span>
        </p>
        <ul class="address">
            <c:forEach items="${jumpLinks}" var="links">
                <li><a href="${links.path}">${links.linkName}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>

<jsp:include page="../publicPage/foot.jsp"/>
</body>
<script type="text/javascript" src="./js/Home.js"></script>

</html>