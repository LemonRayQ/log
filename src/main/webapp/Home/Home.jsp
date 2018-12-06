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
    <title>后勤管理处</title>
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
<jsp:include page="../publicPage/title.jsp"/>

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