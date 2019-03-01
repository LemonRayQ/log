<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>密码修改</title>
    <link rel="icon" href="<%=path%>/title.ico" type="image/x-icon"/>
    <!-- 引入bootstrap -->
    <link rel="stylesheet" href="<%=path%>/backdemo/public/css/bootstrap.min.css">
    <script src="<%=path%>/backdemo/public/js/jquery-3.3.1.min.js"></script>
    <script src="<%=path%>/backdemo/public/js/bootstrap.min.js"></script>

    <!-- 引入图标样式 -->
    <script src="<%=path%>/backdemo/public/icon/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 引入文本编辑器 -->

    <!-- 引入自定义样式 -->
    <link rel="stylesheet" href="<%=path%>/backdemo/public/css/public.css">
    <link rel="stylesheet" href="<%=path%>/backdemo/publicpages/css/updatePassword.css" >
    <script type="text/javascript">
        function logout() {
            window.location.href = "./logout";
        }

        function check(that) {
            var cil = $(that).find('input');
            var old = "";
            var pass = "";
            var confir = "";
            for(var i = 0; i < cil.length;i++){
                if(cil[i].name === "oldPassword"){
                    old = cil[i].value;
                    continue;
                }
                if(cil[i].name === "newPassword"){
                    pass = cil[i].value;
                    continue;
                }
                if(cil[i].name === "confirmPassword"){
                    confir = cil[i].value;
                }

                if(old !== "" && pass !== "" && confir !== ""){
                    if(pass === confir){
                        return true;
                    }else {
                        alert("两次输入的密码不一致!");
                        return false;
                    }
                }

            }
            return false;
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
            <div class="sidebar-item">
                <p>
                <span class="s-icon">
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-xinxi"></use>
                    </svg>
                </span>
                    &nbsp; &nbsp;
                    <span class="s-title">
                        <a href="./updatePassword">密码修改</a>
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
                    管理员密码修改
                </p>
                <div>
                    <button type="button" class="btn btn-danger" onclick="logout()">退出</button>

                </div>
            </div>
            <div class="new-bodys">
                <div class="update-password">
                    <div class="update-admin">

                        <form action="./updateAdminPassword" onsubmit="return check(this)" method="POST" role="form">
                            <input type="hidden" value="0" name="identity">
                            <h3>修改管理员密码</h3>
                            <div class="form-group">
                                <label for="title">原始密码</label>
                                <input type="password" class="form-control" placeholder="请输入原始密码"  name="oldPassword"  >
                            </div>
                            <div class="form-group">
                                <label for="path">新密码</label>
                                <input type="password" class="form-control" placeholder="请输入新密码" name="newPassword">
                            </div>
                            <div class="form-group">
                                <label for="path">新密码</label>
                                <input type="password" class="form-control" placeholder="请再次输入新密码" name="confirmPassword">
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-primary" value="更改">
                            </div>
                        </form>
                    </div>
                    <div class="update-sadmin">
                        <form action="./updateAdminPassword" method="POST" role="form" onsubmit="return check(this)">
                            <input type="hidden" value="1" name="identity">
                            <h3>修改超级管理员密码</h3>
                            <div class="form-group">
                                <label for="title">原始密码</label>
                                <input type="password" class="form-control" id="title" placeholder="请输入原始密码" name="oldPassword">
                            </div>
                            <div class="form-group">
                                <label for="path">新密码</label>
                                <input type="password" class="form-control" id="path" placeholder="请输入新密码" name="newPassword">
                            </div>
                            <div class="form-group">
                                <label for="path">新密码</label>
                                <input type="password" class="form-control" placeholder="请再次输入新密码" name="confirmPassword">
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-primary" value="更改">
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:if test="${updatePassword == 'success'}">
    <script>
        alert("更改成功，请重新登录!");
        logout();
    </script>
</c:if>
</body>
<script src="<%=path%>/backdemo/public/js/public.js"></script>
</html>