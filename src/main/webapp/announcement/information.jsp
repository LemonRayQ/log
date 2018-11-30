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
    <link rel="stylesheet" href="css/information.css">
</head>

<body>
<jsp:include page="../publicPage/title.jsp"/>


<!-- 内容展示区域 -->
<div class="container-fluid">
    <div class="rules-content">
        <!-- 左侧区域联系 -->
        <div class="content-left">
            <div class="contact">
                <div class="panel panel-default">
                    <div class="panel-heading">
                            <span>
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-tongzhi"></use>
                                </svg>&nbsp;
                            </span>
                        &nbsp;&nbsp;
                        <span>联系方式</span>
                    </div>
                    <div class="panel-body">
                        <ul class="contact-ul">
                            <li>攀枝花学院后勤管理处</li>
                            <li>地址: 617000</li>
                            <li>邮编: 攀枝花学院机场路</li>
                            <li>电话: 后勤管理处</li>
                            <li>地址: 0812-3370612</li>
                            <li>E-mail: pdhqglc@163.com</li>
                            <li>网址:<a href="">hqc.pzhu.cn</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
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
                            <span class="title-header">政策文件</span>
                        </p>
                        <ol class="breadcrumb">
                            <li><a href="../Home.Home.jsp">网站首页</a></li>
                            <li><a href="#">政策文件</a></li>
                        </ol>
                    </div>
                    <div class="panel-body">
                        <!-- 正文内容 -->
                        <div class="an-content">
                            <ul class="an-ul">
                                <c:forEach items="${noticeNews}" var="news" varStatus="count">
                                    <li>
                                        <p class="title">
                                            <a href="../notice.mvc?newsId=${news.newsId}">${news.title}</a>
                                        </p>
                                        <p>
                                            <fmt:formatDate value="${news.time}" pattern="yyyy-MM-dd"/>
                                        </p>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <!-- 分页标签 -->
                    <div class="a-pages">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
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