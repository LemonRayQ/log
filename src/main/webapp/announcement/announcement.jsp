<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>信息展示</title>
    <link rel="icon" href="../title.ico" type="image/x-icon"/>
    <!-- public样式 -->
    <link rel="stylesheet" href="../public/css/bootstrap.min.css">
    <link rel="stylesheet" href="../public/css/public.css">
    <script src="../public/js/jquery-3.3.1.min.js"></script>
    <script src="../public/js/bootstrap.min.js"></script>
    <script src="../public/fonts/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 自定样式 -->
    <link rel="stylesheet" href="./css/announcement.css">
    <link rel="stylesheet" href="../public/css/public.css">
</head>

<body>
<jsp:include page="../publicPage/title.jsp"/>

    <!-- 内容展示区域 -->
    <div class="container-fluid">
        <div class="rules-content">
            <!-- 左侧区域联系 -->
            <div class="content-left">
                <div class="contact">
                    <div class="serach">
                        <form class="form-inline" action="../conditionsOfQueryNews.mvc">
                            <div class="form-group">
                                <input type="text" class="form-control" name="conditions" placeholder="搜索公告标题" value="${show}">
                                <input type="hidden" value="${noticeNews[0].classify.classifyId}" name="classify_id">
                            </div>
                            <button type="submit" class="btn btn-primary">搜索</button>
                        </form>
                    </div>
                    <div class="panel panel-default">

                        <div class="panel-heading">
                            <span>
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-tongzhi"></use>
                                </svg>&nbsp;
                            </span>
                            &nbsp;&nbsp;
                            <span>通知单位</span>
                        </div>
                        <div class="panel-body">
                            <ul class="contact-ul">
                                <c:forEach items="${depart}" var="depart">
                                <li><a href="../selectOfficeNews.mvc?deptId=${depart.deptId}&classId=${classify.classifyId}">${depart.name}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <jsp:include page="../publicPage/connect.jsp"/>
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
                                <span class="title-header"> ${classify.name}</span>
                            </p>
                            <ol class="breadcrumb">
                                <li><a href="../Home/Home.jsp">网站首页</a></li>
                                <li><a href="#"> ${classify.name}</a></li>
                            </ol>
                        </div>
                        <div class="panel-body">
                            <!-- 正文内容 -->
                            <div class="an-content">
                                <ul class="an-ul">
                                    <c:forEach items="${noticeNews}" var="News">
                                        <li>
                                            <p class="title">
                                                【${News.department.name}】 <a href="../notice.mvc?newsId=${News.newsId}">${News.title}</a>
                                            </p>
                                            <p>
                                                <fmt:formatDate value="${News.time}" pattern="yyyy-MM-dd"/>
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
                                    ${bar}
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