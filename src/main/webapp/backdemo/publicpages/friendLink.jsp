<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
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
    <title>Document</title>
    <!-- 引入bootstrap -->
    <link rel="stylesheet" href="../public/css/bootstrap.min.css">
    <script src="../public/js/jquery-3.3.1.min.js"></script>
    <script src="../public/js/bootstrap.min.js"></script>

    <!-- 引入图标样式 -->
    <script src="../public/icon/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 引入文本编辑器 -->

    <!-- 引入自定义样式 -->
    <link rel="stylesheet" href="../public/css/public.css">
    <script type="text/javascript">
        function logout() {
            window.location.href = "../../logout.mvc";
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
                <li><a href="../../selectIntroduce.mvc">基建概况</a></li>
                <li><a href="../../selectOfficeDuty.mvc">科室主要职责</a></li>
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
                <a href="../../selectPolicyLevel.mvc">政策文件</a>
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
                        <a href="../../selectWork.mvc">工作动态</a>
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
                        <a href="../../selectHomeNews.mvc">通知公告</a>

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
                        <a href="../../selectRules.mvc">规章制度</a>
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
                        <a href="../../selectGoverment.mvc">党建廉政</a>
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
                        <a href="../..//selectServer.mvc">服务指南</a>
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
                <a href="../../selectAchievements.mvc">成果展示</a>
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
                <a href="../../selectImage.mvc">图片管理</a>
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
                <a href="../../selectFriendLink.mvc">友情链接</a>
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
                    <a href="../../selectApprovalNews.mvc">新闻审核</a>
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
                    友情链接发布界面
                </p>
                <div>
                    <button type="button" class="btn btn-danger" onclick="logout()">退出</button>

                </div>
            </div>
            <div class="new-body">
                <form action="../../insertLink.mvc" id="linkForm" method="POST" role="form">
                    <div class="form-group">
                        <label for="title">标题</label>
                        <input type="text" class="form-control" id="title" placeholder="请输入标题" name="linkName">
                    </div>
                    <div class="form-group">
                        <label for="path">链接地址</label>
                        <input type="text" class="form-control" id="path" placeholder="请输入链接" name="path">
                    </div>
                </form>
                <div class="show-btn">
                    <button class="btn btn-primary" onclick="addLink()">发布</button>
                </div>
            </div>
            <div class="show-news">
                <form class="navbar-form" action="../../selectWithName.mvc">
                    <div class="form-group">
                        <input type="text" class="form-control" name="name" placeholder="请输入链接名">
                    </div>
                    <button type="submit" class="btn btn-default">查询</button>
                </form>
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>标题</th>
                        <th>链接</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${links}" var="link" varStatus="id">
                        <tr>
                            <td>${id.count}</td>
                            <td>${link.linkName}</td>
                            <td>${link.path}</td>
                            <td>
                                <a href="javascript:deleteLink(${link.linkId});" class="btn btn-danger">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
<script src="../public/js/public.js"></script>
</html>
<script type="text/javascript">
    function addLink() {
        var form = new FormData(document.getElementById("linkForm"));
        $.ajax({
            url: "<%=basePath%>insertLink.mvc",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                alert("链接添加成功!");
                window.location.reload();
            },
            error: function (e) {
                alert("链接添加失败！");
            }
        });
    }

    function deleteLink(id) {
        $.ajax({
            url: "<%=basePath%>deleteLink.mvc?linkId="+id,
            type: "post",
            success: function (data) {
                alert("链接删除成功!");
                window.location.reload();
            },
            error: function (e) {
                alert("链接删除失败！");
            }
        });
    }
</script>