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
    <title>科室职责</title>
    <!-- public样式 -->
    <link rel="stylesheet" href="../public/css/bootstrap.min.css">
    <link rel="stylesheet" href="../public/css/public.css">
    <script src="../public/js/jquery-3.3.1.min.js"></script>
    <script src="../public/js/bootstrap.min.js"></script>
    <script src="../public/fonts/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 自定样式 -->
    <link rel="stylesheet" href="./css/duty.css">
</head>

<body>
<jsp:include page="../publicPage/title.jsp"/>

<!-- 内容展示区域 -->
<div class="container-fluid">
    <div class="rules-content">
        <!-- 左侧区域联系 -->
        <div class="content-left">
            <div class="contact">
                <!-- 右侧的一个面板区域 -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                            <span>
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-tongzhi"></use>
                                </svg>&nbsp;
                            </span>
                        &nbsp;&nbsp;
                        <span>科室名称</span>
                    </div>
                    <div class="panel-body">
                        <ul class="contact-ul">
                            <c:forEach items="${depatment}" var="depatment">
                                <li><a href="../singleOfiice.mvc?deptId=${depatment.deptId}">${depatment.name}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
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
                            <span class="title-header">科室主要职责</span>
                        </p>
                        <ol class="breadcrumb">
                            <li><a href="../Home/Home.jsp">网站首页</a></li>
                            <li><a href="../OfficeDuty.mvc">科室职责</a></li>
                        </ol>
                    </div>
                    <div class="panel-body">
                        <!-- 正文内容 -->
                        <div class="item-work">
                            <div class="page-header">
                                <div class="title">
                                    <h3>${duties[0].department.name}</h3>
                                </div>
                            </div>
                            <div class="work-content">
                                ${duties[0].duty}
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
<script src="../public/js/public.js"></script>
<script src="./js/duty.js"></script>

</html>