<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
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
    <link rel="icon" href="../title.ico" type="image/x-icon"/>
    <!-- public样式 -->
    <link rel="stylesheet" href="../public/css/bootstrap.min.css">
    <link rel="stylesheet" href="../public/css/public.css">
    <script src="../public/js/jquery-3.3.1.min.js"></script>
    <script src="../public/js/bootstrap.min.js"></script>
    <script src="../public/fonts/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 自定样式 -->
    <link rel="stylesheet" href="./css/newsinfo.css">
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
                            <span class="title-header">新闻动态</span>
                        </p>
                        <ol class="breadcrumb">
                            <li><a href="../Home/Home.jsp">网站首页</a></li>
                            <li><a href="#">新闻动态</a></li>
                        </ol>
                    </div>
                    <div class="panel-body">
                        <!-- 正文内容 -->
                        <div class="page-header">
                            <h2>${newsInfo.title}</h2>
                            <h3>
                                <span>来源:</span>
                                <small>${newsInfo.department.name}</small>
                                <span>发布时间：</span>
                                <small>${newsInfo.time}</small>
                                <span>浏览次数：</span>
                                <small style="color:red">${newsInfo.readNum}</small>
                            </h3>
                        </div>
                        <div class="new-content">
                            ${newsInfo.content}
                            <br/>
                            <c:if test="${newsInfo.path != null}">
                                <a href="../downloadFile.mvc?path=${newsInfo.path}">附件:${newsInfo.title}</a>
                            </c:if>
                        </div>
                    </div>
                    <!-- 分页标签 -->
                    <div class="a-pages">
                        <nav aria-label="...">
                            <ul class="pager">
                                <c:if test="${noLastNews == null}">
                                    <li><a href="../selectLaseNews.mvc?newsId=${newsInfo.newsId}">上一篇</a></li>
                                </c:if>
                                <c:if test="${norNextNews == null}">
                                    <li><a href="../selectNextNews.mvc?newsId=${newsInfo.newsId}">下一篇</a></li>
                                </c:if>
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
<script src="../rule/js/rules.js"></script>

</html>