<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>新闻审核</title>
    <link rel="icon" href="<%=basePath%>title.ico" type="image/x-icon"/>
    <!-- 引入bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>backdemo/public/css/bootstrap.min.css">
    <script src="<%=basePath%>backdemo/public/js/jquery-3.3.1.min.js"></script>
    <script src="<%=basePath%>backdemo/public/js/bootstrap.min.js"></script>

    <!-- 引入图标样式 -->
    <script src="<%=basePath%>backdemo/public/icon/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 引入文本编辑器 -->

    <!-- 引入自定义样式 -->
    <link rel="stylesheet" href="<%=basePath%>backdemo/public/css/public.css">
    <link rel="stylesheet" href="<%=basePath%>backdemo/publicpages/css/review.css">

    <script type="text/javascript">
        function logout() {
            window.location.href = "./logout";
        }
    </script>
</head>

<body>
    <div class="container-fluid">
        <!-- 侧边栏菜单 -->
        <div class="sidebar-left">
            <!-- 部门简介 -->
            <div class="sidebar-item">
                <p>
            <span class="s-icon">
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-xinxi"></use>
                </svg>
            </span>
                    &nbsp; &nbsp;
                    <span class="s-title">
                <a href="">部门简介</a>
            </span>
                </p>
                <ul class="sidebar-ul">
                    <li><a href="./selectIntroduce">基建概况</a></li>
                    <li><a href="./selectOfficeDuty">科室主要职责</a></li>
                </ul>
            </div>
            <!-- 政策文件 -->
            <div class="sidebar-item">
                <p>
            <span class="s-icon">
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-xinxi"></use>
                </svg>
            </span>
                    &nbsp; &nbsp;
                    <span class="s-title">
                <a href="./selectPolicyLevel">政策文件</a>
            </span>
                </p>
            </div>

            <!-- 工作动态 -->
            <div class="sidebar-item">
                <p>
            <span class="s-icon">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-xinxi"></use>
                        </svg>
                    </span>
                    &nbsp; &nbsp;
                    <span class="s-title">
                        <a href="./selectWork">工作动态</a>
                    </span>
                </p>
            </div>

            <!-- 通知公告 -->
            <div class="sidebar-item">
                <p>
                    <span class="s-icon">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-xinxi"></use>
                        </svg>
                    </span>
                    &nbsp; &nbsp;
                    <span class="s-title">
                        <a href="./selectHomeNews">通知公告</a>

                    </span>
                </p>
            </div>
            <!-- 规章制度 -->
            <div class="sidebar-item">
                <p>
                    <span class="s-icon">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-xinxi"></use>
                        </svg>
                    </span>
                    &nbsp; &nbsp;
                    <span class="s-title">
                        <a href="./selectRules">规章制度</a>
                    </span>
                </p>
            </div>
            <!-- 党建廉政 -->
            <div class="sidebar-item">
                <p>
                    <span class="s-icon">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-xinxi"></use>
                        </svg>
                    </span>
                    &nbsp; &nbsp;
                    <span class="s-title">
                        <a href="./selectGoverment">党建廉政</a>
                    </span>
                </p>
            </div>
            <!-- 服务指南 -->
            <div class="sidebar-item">
                <p>
                    <span class="s-icon">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-xinxi"></use>
                        </svg>
                    </span>
                    &nbsp; &nbsp;
                    <span class="s-title">
                        <a href="./selectServer">服务指南</a>
                    </span>
                </p>
            </div>
            <!-- 成果展示 -->
            <div class="sidebar-item">
                <p>
            <span class="s-icon">
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-xinxi"></use>
                </svg>
            </span>
                    &nbsp; &nbsp;
                    <span class="s-title">
                <a href="./selectAchievements">成果展示</a>
            </span>
                </p>
            </div>
            <!-- 轮播图管理 -->
            <div class="sidebar-item">
                <p>
            <span class="s-icon">
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-xinxi"></use>
                </svg>
            </span>
                    &nbsp; &nbsp;
                    <span class="s-title">
                <a href="./selectImage">图片管理</a>
            </span>
                </p>
            </div>
            <div class="sidebar-item">
                <p>
            <span class="s-icon">
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-xinxi"></use>
                </svg>
            </span>
                    &nbsp; &nbsp;
                    <span class="s-title">
                <a href="./selectFriendLink">友情链接</a>
            </span>
                </p>
            </div>
            <c:if test="${superFlag != null}">
                <div class="sidebar-item">
                    <p>
                <span class="s-icon">
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-xinxi"></use>
                    </svg>
                </span>
                        &nbsp; &nbsp;
                        <span class="s-title">
                    <a href="./selectApprovalNews">新闻审核</a>
                </span>
                    </p>
                </div>
            </c:if>
        </div>
        <!-- 右边正文部分 -->
        <div class="content-right">
            <div class="header">
                <div class="new-header">
                    <p>
                        新闻审核界面
                    </p>
                    <div>
                        <button type="button" onclick="logout()" class="btn btn-danger">退出</button>

                    </div>
                </div>
                <div class="new-body">
                    <!-- 每一个新闻审核列表 -->
                    <c:forEach items="${approvalNews}" var="approval" varStatus="coun">
                    <div class="review-item">
                        <div class="review-title">
                            <div class="title">
                                <span class="text">【${approval.department.name}】${approval.title}</span>
                                <span class="date">
                                    <fmt:formatDate value="${approval.time}" pattern="yyyy-MM-dd"/>
                                </span>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"  name="importance" id="importance">
                                    是否为重要新闻？
                                </label>
                            </div>
                            <div class="btns">
                                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#${coun.index}"
                                    aria-expanded="false" aria-controls="collapseExample">详情</button>
                                <button class="btn btn-success" onclick="updateApproval('${coun.index}')">审核通过</button>
                                <button class="btn btn-danger" onclick="refuseApproval()">拒绝通过</button>
                            </div>
                        </div>
                        <div class="review-info">
                            <div class="collapse" id="${coun.index}">
                                <div class="well">
                                    ${approval.content}
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>

<script src="<%=basePath%>backdemo/public/js/public.js"></script>

<script>
    function updateApproval(index) {
        var importance = $("#importance").is(':checked');
        var im = 0;
        if(importance){
            im = 1;
        }
        $.ajax({
            url:"<%=basePath%>updateApproval",
            type:"post",
            data:{"index":index,"importance":im},
            success:function(data){
                alert("审批通过！");
                window.location.reload();
            },
            error:function(e){
                alert("审批失败！");
            }
        });
    }

    function refuseApproval() {
        alert("拒绝通过!");
    }
</script>
</html>