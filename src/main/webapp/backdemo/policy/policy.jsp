<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- 引入bootstrap -->
    <link rel="stylesheet" href="../public/css/bootstrap.min.css">

    <!-- 引入图标样式 -->
    <script type="text/javascript" src="../public/icon/font_9rqbtihwbsm/iconfont.js" charset="UTF-8"></script>

    <%--引入mui组件--%>
    <link rel="stylesheet" href="../public/mui/css/mui.min.css">

    <!-- 引入自定义样式 -->

    <link rel="stylesheet" href="../public/css/public.css">
    <link rel="stylesheet" href="./css/policy.css">


    <%--<script type="text/javascript" src="../public/js/jquery-3.3.1.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../public/js/bootstrap.min.js" charset="UTF-8"></script>--%>

    <%-- 引入富文本编辑器 --%>
    <link href="../news/editor/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../news/editor/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="../news/editor/assets/css/font-awesome-ie7.min.css"/>
    <link rel="stylesheet" href="../news/editor/assets/css/jquery-ui-1.10.3.custom.min.css"/>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"/>
    <link rel="stylesheet" href="../news/editor/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="../news/editor/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="../news/editor/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="../news/editor/assets/css/ace-ie.min.css"/>
    <script type="text/javascript" src="../news/editor/assets/js/ace-extra.min.js"></script>
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
                    政策制度发布界面
                </p>
                <div>
                    <button type="button" onclick="logout()" class="btn btn-danger">退出</button>

                </div>
            </div>
            <div class="new-body">
                <form action="" id="form1" method="POST" role="form">
                    <input type="hidden" name="policyId" value="${singlePolicy.policyId}">
                    <div class="form-group">
                        <label for="levelId">级别</label>
                        <select title="le" id="levelId" name="levelId" class="form-control">
                            <c:forEach items="${level}" var="level">
                                <c:if test="${singlePolicy.level.levelId == level.levelId}">
                                    <option value="${level.levelId}" selected>${level.name}</option>
                                </c:if>
                                <c:if test="${singlePolicy.level.levelId != level.levelId}">
                                    <option value="${level.levelId}">${level.name}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="title">公告标题</label>
                        <input type="text" value="${singlePolicy.title}" name="title" class="form-control" id="title"
                               placeholder="请输入标题">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">上传附件</label>
                        <input type="file" name="paths"  id="exampleInputFile">
                    </div>
                    <!-- 文本编辑器 -->
                    <input type="hidden" id="content" name="content">
                    <div class="text-area">
                        <div class="wysiwyg-editor" id="editor1">${singlePolicy.content}</div>
                        <div class="hr hr-double dotted"></div>
                    </div>
                </form>
                <c:if test="${singlePolicy != null}">
                  <div class="put-btn">
                      <button class="btn btn-primary" onclick="updatePolicy()" style="width:90px; margin-right:10px;">修改</button>
                      <button class="btn btn-primary" onclick="cancleUpdate()">取消修改</button>
                  </div>
                </c:if>
                <c:if test="${singlePolicy == null}">
                    <button class="btn btn-primary" onclick="submit()">发布</button>
                </c:if>

            </div>
            <!-- 列表界面 -->
            <div class="show-news">
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>级别</th>
                        <th>标题</th>
                        <th>时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${policy}" var="policy" varStatus="cou">
                        <tr>
                            <td>${cou.count}</td>
                            <td>${policy.level.name}</td>
                            <td>${policy.title}</td>
                            <td>${policy.time}</td>
                            <td>
                                <a class='update btn btn-primary' href="<%=basePath%>updatePolicy.mvc?policy_id=${cou.index}" type="button">修改</a>
                                <a class='delete btn btn-danger' href="<%=basePath%>deletePolicy.mvc?policy_id=${policy.policyId}&index=${cou.index}" type="button">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- 分页按钮 -->
            <div class="news-pages">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        ${bar}
                    </ul>
                </nav>
            </div>

        </div>
        <!-- 页脚 -->
        <div class="footer">
            <span>Copyright 2010-2011 Hqc.pzhu.edu.cn Inc.All Rights Reserved.攀枝花学院后勤管理处 版权所有 </span>
            <span>地址：四川省攀枝花市东区机场路10号 电话：0812-85583114 邮编：617000 技术支持：苏俊</span>
        </div>
    </div>
</div>
<script type="text/javascript">
    function addContent() {
        $("#content").val($("#editor1").html());
        return false;
    }

    function cancleUpdate() {
        $.ajax({
            url: "<%=basePath%>cancleUpdate.mvc",
            type: "post",
            success: function (data) {
                mui.toast('取消成功！', {duration: 'short', type: "div"});
                setTimeout(function () {
                    window.location.reload();
                },2000)
            },
            error: function (e) {
                mui.toast('取消失败！', {duration: 'short', type: "div"});
            }
        });
    }

    function updatePolicy() {
        var reg=/(^\s+)|(\s+$)|\s+/g;
        var str = $("#exampleInputFile").val();
        if(reg.test(str)){
            alert("文件名不能包含空格");
        }else if ($("#title").val() === "") {
            alert("标题不能为空!");
        } else {
            $("#content").val($("#editor1").html());
            var form = new FormData(document.getElementById("form1"));
            $.ajax({
                url: "<%=basePath%>updatePolicyInfo.mvc",
                type: "post",
                data: form,
                processData: false,
                contentType: false,
                success: function (data) {
                    mui.toast('修改成功！', {duration: 'short', type: "div"});
                    setTimeout(function () {
                        window.location.reload();
                    },2000)
                },
                error: function (e) {
                    mui.toast('修改失败！', {duration: 'short', type: "div"});
                }
            });
        }
    }

    function submit() {
        var reg=/(^\s+)|(\s+$)|\s+/g;
        var str = $("#exampleInputFile").val();
        if(reg.test(str)){
            alert("文件名不能包含空格");
        }else if ($("#title").val() === "") {
            alert("标题不能为空!");
        } else {
            $("#content").val($("#editor1").html());
            var form = new FormData(document.getElementById("form1"));
            $.ajax({
                url: "<%=basePath%>insertPolicy.mvc",
                type: "post",
                data: form,
                processData: false,
                contentType: false,
                success: function (data) {
                    alert("政策信息录入成功!")
                    window.location.reload();
                },
                error: function (e) {
                    alert("政策信息录入失败！");
                }
            });
        }
    }
</script>
</body>
<script src="../public/mui/js/mui.min.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript" charset="UTF-8">
    mui.init({
        swipeBack: true //启用右滑关闭功能
    });

    var up = document.getElementsByClassName("update")
    for (var i = 0; i < up.length; i++) {
        up[i].onclick = function () {
            var that = this;
            var btnArray = ['否', '是'];
            mui.confirm('提示消息 ', '是否确认修改？', btnArray, function (e) {
                if (e.index == 1) {
                    var hr = that.href;
                    window.location.href = hr;
                }
            })
            return false;
        }
    }


    var de = document.getElementsByClassName("delete")
    for (var j = 0; j < de.length; j++) {
        de[j].onclick = function () {
            var that = this;
            var btnArray = ['否', '是'];
            mui.confirm('将会删除该内容下的文件', '是否确认删除？', btnArray, function (e) {
                if (e.index == 1) {
                    var hr = that.href
                    $.ajax({
                        url: hr,
                        type: "post",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            mui.toast('删除成功！', {duration: 'short', type: "div"});
                            setTimeout(function () {
                                window.location.reload();
                            },2000)
                        },
                        error: function (e) {
                            mui.toast('删除失败！', {duration: 'short', type: "div"});
                        }
                    });

                }
            })
            return false;
        }
    }

</script>

</html>
<!--引入富文本框-->
<script type="text/javascript">
    window.jQuery || document.write("<script src='../news/editor/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>

<script type="text/javascript">
    window.jQuery || document.write("<script src='../news/editor/assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='../news/editor/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript" src="../news/editor/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../news/editor/assets/js/typeahead-bs2.min.js"></script>
<script type="text/javascript" src="../news/editor/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="../news/editor/assets/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="../news/editor/assets/js/markdown/markdown.min.js"></script>
<script type="text/javascript" src="../news/editor/assets/js/markdown/bootstrap-markdown.min.js"></script>
<script type="text/javascript" src="../news/editor/assets/js/jquery.hotkeys.min.js"></script>
<script type="text/javascript" src="../news/editor/assets/js/bootstrap-wysiwyg.min.js"></script>
<script type="text/javascript" src="../news/editor/assets/js/bootbox.min.js"></script>
<script type="text/javascript" src="../news/editor/assets/js/ace-elements.min.js"></script>
<script type="text/javascript" src="../news/editor/assets/js/ace.min.js"></script>
<<script src="../publicpages/js/editor.js"></script>
<script src="../public/js/public.js"></script>