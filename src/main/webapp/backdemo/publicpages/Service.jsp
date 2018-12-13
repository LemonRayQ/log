<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>服务指南</title>
    <link rel="icon" href="../../title.ico" type="image/x-icon"/>
    <!-- 引入bootstrap -->
    <link rel="stylesheet" href="../public/css/bootstrap.min.css">
    <%--<script src="../public/js/jquery-3.3.1.min.js"></script>
    <script src="../public/js/bootstrap.min.js"></script>--%>

    <!-- 引入图标样式 -->
    <script src="../public/icon/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 引入文本编辑器 -->
    <link href="../news/editor/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../news/editor/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="../news/editor/assets/css/font-awesome-ie7.min.css"/>
    <link rel="stylesheet" href="../news/editor/assets/css/jquery-ui-1.10.3.custom.min.css"/>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"/>
    <link rel="stylesheet" href="../news/editor/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="../news/editor/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="../news/editor/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="../news/editor/assets/css/ace-ie.min.css"/>
    <script src="../news/editor/assets/js/ace-extra.min.js"></script>


    <!-- 引入自定义样式 -->
    <link rel="stylesheet" href="../public/css/public.css">
    <%--<link rel="stylesheet" href="./css/rules.css">--%>

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
                       服务指南发布界面
                    </p>
                    <div>
                        <button type="button" class="btn btn-danger" onclick="logout()">退出</button>
                    </div>
                </div>
                <div class="new-body">
                    <form action="" method="POST" role="form" id="form1">
                        <!-- 文本编辑器 -->
                        <div class="text-area">
                            <input type="hidden" name="title" value="服务指南">
                            <input type="hidden" name="content" id="content">
                            <input type="hidden" name="deptId" value="2">
                            <input type="hidden" name="classId" value="5">
                            <div class="wysiwyg-editor" id="editor1">${service.content}
                            </div>
                            <div class="hr hr-double dotted"></div>
                        </div>

                    </form>
                    <div class="show-btn">
                        <button class="btn btn-success" onclick="updateService()">修改</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
<script>
    function updateService() {
        if($("#editor1").html() === ""){
            alert("新闻内容不能为空!");
        }else{
            $("#content").val($("#editor1").html());
            $.ajax({
                url:"<%=basePath%>updateService.mvc",
                type:"post",
                data:$("#form1").serialize(),
                success:function(){
                    alert("修改成功!");
                    window.location.reload();
                },
                error:function(){
                    alert("修改失败！");
                }
            });
        }
    }
</script>
</html>

<script type="text/javascript">
    window.jQuery || document.write("<script src='../news/editor/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>

<script type="text/javascript">
    window.jQuery || document.write("<script src='../news/editor/assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='../news/editor/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="../news/editor/assets/js/bootstrap.min.js"></script>
<script src="../news/editor/assets/js/typeahead-bs2.min.js"></script>
<script src="../news/editor/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="../news/editor/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="../news/editor/assets/js/markdown/markdown.min.js"></script>
<script src="../news/editor/assets/js/markdown/bootstrap-markdown.min.js"></script>
<script src="../news/editor/assets/js/jquery.hotkeys.min.js"></script>
<script src="../news/editor/assets/js/bootstrap-wysiwyg.min.js"></script>
<script src="../news/editor/assets/js/bootbox.min.js"></script>
<script src="../news/editor/assets/js/ace-elements.min.js" type="text/javascript" charset="UTF-8"></script>
<script src="../news/editor/assets/js/ace.min.js"></script>
<script src="../publicpages/js/editor.js"></script>
<script src="../public/js/public.js"></script>