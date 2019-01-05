<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>工作动态</title>
    <link rel="icon" href="<%=basePath%>title.ico" type="image/x-icon"/>
    <!-- public样式 -->
    <link rel="stylesheet" href="<%=basePath%>public/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>public/css/public.css">
    <script src="<%=basePath%>public/js/jquery-3.3.1.min.js"></script>
    <script src="<%=basePath%>public/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>public/fonts/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 自定样式 -->
    <link rel="stylesheet" href="<%=basePath%>work/css/work.css">
    <link rel="stylesheet" href="<%=basePath%>public/css/public.css">
</head>

<body>
<jsp:include page="../publicPage/title.jsp"/>


<div class="html-container">
    <div class="html-body">
        <!-- 内容展示区域 -->
        <div class="container-fluid">
            <div class="rules-content">
                <div class="row">
                    <div class="col-md-3">
                        <!-- 左侧区域联系 -->
                        <div class="content-left">
                            <div class="contact">
                                <div class="serach">
                                    <form class="form-inline" action="./conditionsOfQueryNews">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="conditions" placeholder="搜索公告标题"
                                                   value="${show}">
                                            <input type="hidden" value="2" name="classify_id">
                                        </div>
                                        <button type="submit" class="btn btn-primary">搜索</button>
                                    </form>
                                </div>
                                <!-- 右侧的一个面板区域 -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                            <span>
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-tongzhi"></use>
                                </svg>&nbsp;
                            </span>
                                        &nbsp;&nbsp;
                                        <span>工作动态</span>
                                    </div>
                                    <div class="panel-body">
                                        <ul class="contact-ul">
                                            <c:forEach items="${depart}" var="depart">
                                                <li><a href="./selectWorkOffice?deptId=${depart.deptId}&classId=2">${depart.name}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <jsp:include page="../publicPage/connect.jsp"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
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
                                            <span class="title-header">工作动态</span>
                                        </p>
                                        <ol class="breadcrumb">
                                            <li><a href="./Home">网站首页</a></li>
                                            <li><a href="./selectWorkNews?classId=2">工作动态</a></li>
                                        </ol>
                                    </div>
                                    <div class="panel-body">
                                        <!-- 正文内容 -->
                                        <c:if test="${fn:length(noticeNews) > 0}">
                                            <c:forEach items="${noticeNews}" var="news">
                                                <div class="item-work">
                                                    <div class="page-header">
                                                        <div class="title">
                                                            <h4><span class="label label-primary">${news.department.name}</span></h4>
                                                            &nbsp; &nbsp;
                                                            <h3><a href="./notice?newsId=${news.newsId}">${news.title}</a></h3>
                                                        </div>
                                                        <div class="time">
                                                            <h2>
                                                                <small>
                                                                    <fmt:formatDate value="${news.time}" pattern="yyyy-MM-dd"/>
                                                                </small>
                                                            </h2>
                                                        </div>
                                                    </div>
                                                        <%--<div class="work-content">
                                                                ${news.content}
                                                            <br/>
                                                            <c:if test="${news.path != null}">
                                                                <a href="../downloadFile?path=${news.path}">附件:${news.title}</a>
                                                            </c:if>
                                                        </div>--%>
                                                </div>
                                            </c:forEach>
                                        </c:if>

                                    </div>
                                    <div class="news-pages text-center">
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


            </div>
        </div>
    </div>
    <div class="html-footer">
        <jsp:include page="../publicPage/foot.jsp"/>
    </div>
</div>
</body>
<script src="<%=basePath%>public/js/public.js"></script>
<script src="<%=basePath%>work/js/rules.js"></script>

</html>