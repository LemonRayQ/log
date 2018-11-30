<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
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
    <!-- public样式 -->
    <link rel="stylesheet" href="../public/css/bootstrap.min.css">
    <link rel="stylesheet" href="../public/css/public.css">
    <script type="text/javascript" src="../public/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../public/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../public/fonts/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 自定样式 -->
    <link rel="stylesheet" href="./css/rules.css">
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
                                <span class="title-header">规章制度</span>
                            </p>
                            <ol class="breadcrumb">
                                <li><a href="../Home/Home.jsp">网站首页</a></li>
                                <li><a href="#">规章制度</a></li>
                            </ol>
                        </div>
                        <div class="panel-body">
                            <!-- 正文内容 -->
                            <div class="rule-container">
                                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingOne">
                                            <h4 class="panel-title">
                                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                                    aria-expanded="true" aria-controls="collapseOne">
                                                    国家规章制度
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                                            aria-labelledby="headingOne">
                                            <div class="panel-body">
                                                <ul class="rules-ul">
                                                    <c:forEach items="${policies}" var="policy">
                                                        <c:if test="${policy.levelId == 1}">
                                                            <li>
                                                                <a href="../downloadFile.mvc?path=${policy.path}">
                                                                    ${policy.title}
                                                                </a>
                                                                <span>
                                                                    <fmt:formatDate value="${policy.time}" pattern="yyyy-MM-dd"/>
                                                                </span>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>
                                                <!-- 分页按钮 -->
                                                <div class="content-page">
                                                    <nav aria-label="Page navigation">
                                                        <ul class="pagination">
                                                            ${countryBar}
                                                        </ul>
                                                    </nav>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingTwo">
                                            <h4 class="panel-title">
                                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                                    href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                    省级规章制度
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                                            aria-labelledby="headingTwo">
                                            <div class="panel-body">
                                                <ul class="rules-ul">
                                                    <c:forEach items="${policies}" var="policy">
                                                        <c:if test="${policy.levelId == 2}">
                                                            <li>
                                                                <a href="../downloadFile.mvc?path=${policy.path}">
                                                                        ${policy.title}
                                                                </a>
                                                                <span> <fmt:formatDate value="${policy.time}" pattern="yyyy-MM-dd"/></span>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>
                                                <!-- 分页按钮 -->
                                                <div class="content-page">
                                                    <nav aria-label="Page navigation">
                                                        <ul class="pagination">
                                                            ${provinceBar}
                                                        </ul>
                                                    </nav>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingThree">
                                            <h4 class="panel-title">
                                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                                    href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                    校级规章制度
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                                            aria-labelledby="headingThree">
                                            <div class="panel-body">
                                                <ul class="rules-ul">
                                                    <c:forEach items="${policies}" var="policy">
                                                        <c:if test="${policy.levelId == 3}">
                                                            <li>
                                                                <a href="../downloadFile.mvc?path=${policy.path}">
                                                                        ${policy.title}
                                                                </a>
                                                                <span> <fmt:formatDate value="${policy.time}" pattern="yyyy-MM-dd"/></span>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>
                                                <!-- 分页按钮 -->
                                                <div class="content-page">
                                                    <nav aria-label="Page navigation">
                                                        <ul class="pagination">
                                                            ${collegeBar}
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
            </div>
        </div>
    </div>

<jsp:include page="../publicPage/foot.jsp"/>

</body>
<script type="text/javascript" src="../public/js/public.js"></script>
<script type="text/javascript" src="./js/rules.js"></script>

</html>