<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>新闻录入</title>
    <link rel="icon" href="../../title.ico" type="image/x-icon"/>
    <!-- 引入bootstrap -->
    <link rel="stylesheet" href="../public/css/bootstrap.min.css">
    <%--<script type="text/javascript" src="../public/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../public/js/bootstrap.min.js"></script>--%>

    <!-- 引入图标样式 -->
    <script type="text/javascript" src="../public/icon/font_9rqbtihwbsm/iconfont.js"></script>


    <!-- 引入自定义样式 -->
    <link rel="stylesheet" href="../public/css/public.css">
    <link rel="stylesheet" href="./css/news.css">


    <!-- 引入文本编辑器 -->
    <link href="editor/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="editor/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="editor/assets/css/font-awesome-ie7.min.css"/>
    <link rel="stylesheet" href="editor/assets/css/jquery-ui-1.10.3.custom.min.css"/>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"/>
    <link rel="stylesheet" href="editor/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="editor/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="editor/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="editor/assets/css/ace-ie.min.css"/>
    <script type="text/javascript" src="editor/assets/js/ace-extra.min.js"></script>
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
                    通知公告界面
                </p>
                <div>
                    <button type="button" onclick="logout()" class="btn btn-danger">退出</button>
                </div>
            </div>
            <div class="new-body">
                <form action="../../insertNews.mvc" id="form1" method="POST" role="form"
                      onsubmit="return addContent(this)" enctype="multipart/form-data">
                    <c:if test="${singleNews != null}">
                        <input type="hidden" name="newsId" value="${singleNews.newsId}">
                    </c:if>
                    <div class="form-group">
                        <label for="title">公告标题</label>
                        <input type="text" name="title" class="form-control" id="title" value="${singleNews.title}"
                               placeholder="请输入标题" required>
                    </div>
                    <div class="form-group">
                        <label for="deptId">请选择部门</label>
                        <select title="depart" name="deptId" id="deptId" class="form-control">
                            <c:forEach items="${depart}" var="dep">
                                <c:if test="${singleNews.deptId == dep.deptId}">
                                    <option value="${dep.deptId}" selected>${dep.name}</option>
                                </c:if>
                                <c:if test="${singleNews.deptId != dep.deptId}">
                                    <option value="${dep.deptId}">${dep.name}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="classId">请选择部门</label>
                        <select title="depart" name="classId" id="classId" class="form-control">
                            <option value="1">通知公告</option>
                            <option value="12">中标候选人公示</option>
                            <option value="13">竞争性谈判公告</option>
                            <option value="14">信息公示</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">上传附件</label>
                        <input type="file" name="paths" id="exampleInputFile">
                    </div>
                    <input type="hidden" id="content" name="content">
                    <!-- 文本编辑器 -->
                    <div class="text-area">
                        <div class="wysiwyg-editor" id="editor1">
                            ${singleNews.content}
                        </div>
                        <div class="hr hr-double dotted"></div>
                    </div>
                </form>
                <div class="put-btn">
                    <c:if test="${singleNews == null}">
                        <button class="btn btn-primary" style="width:90px;" onclick="submitNews()">发布</button>
                    </c:if>
                </div>
                <div class="put-btn">
                    <c:if test="${singleNews != null}">
                        <button class="btn btn-primary" style="width:90px;" onclick="updateNews()">修改</button>
                        &nbsp;&nbsp;&nbsp;
                        <button class="btn btn-primary" onclick="cancleUpdate()">取消修改</button>
                    </c:if>
                </div>
            </div>
            <div class="show-news">
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>标题</th>
                        <th>部门</th>
                        <th>类别</th>
                        <th>时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${news}" var="news" varStatus="id">
                        <tr>
                            <td>${id.count}</td>
                            <td>${news.title}</td>
                            <td>${news.department.name}</td>
                            <td>${news.classify.name}</td>
                            <td>${news.time}</td>
                            <td>
                                <a href="javascript:uploadNews(${id.index})" class="btn btn-success">修改</a>
                                <a href="javascript:deleteNews(${id.index})" class="btn btn-danger">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="news-pages">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        ${bar}
                    </ul>
                </nav>
            </div>
            <!-- 页脚 -->
        </div>
    </div>
</div>
<script type="text/javascript">
    function submitNews() {
        var o = $("#form1");
        var reg = /(^\s+)|(\s+$)|\s+/g;
        var str = o.val();
        if (reg.test(str)) {
            alert("文件名不能包含空格");
            return false;
        } else if ($("#title").val() === "") {
            alert("标题不能为空!");
            return false;
        } else if ($("#editor1").html() === "") {
            alert("新闻内容不能为空!");
            return false;
        } else {
            $("#content").val($("#editor1").html());
            var form = new FormData(document.getElementById("form1"));
            $.ajax({
                url: "<%=basePath%>insertNews.mvc",
                type: "post",
                data: form,
                processData: false,
                contentType: false,
                success: function (data) {
                    alert("工作动态添加成功!");
                    window.location.reload();
                },
                error: function (e) {
                    alert("工作动态添加失败！");
                }
            });
        }
    }

    /*function addContent(o) {
        var reg = /(^\s+)|(\s+$)|\s+/g;
        var str = o.paths.value;
        if (reg.test(str)) {
            alert("文件名不能包含空格");
            return false;
        } else if ($("#title").val() === "") {
            alert("标题不能为空!");
            return false;
        } else if ($("#editor1").html() === "") {
            alert("新闻内容不能为空!");
            return false;
        } else {
            $("#content").val($("#editor1").html());
            return true;
        }
    }*/

    function uploadNews(id) {
        $.ajax({
            url: "<%=basePath%>uploadNews.mvc",
            type: "post",
            data: {"index": id},
            success: function (data) {
                window.location.reload();
            },
            error: function (e) {
            }
        });
    }


    function deleteNews(id) {
        $.ajax({
            url: "<%=basePath%>deleteNews.mvc",
            type: "post",
            data: {"index": id},
            success: function (data) {
                alert("新闻删除成功!");
                window.location.reload();
            },
            error: function (e) {
                alert("新闻删除失败！");
            }
        });
    }

    function cancleUpdate() {
        $.ajax({
            url: "<%=basePath%>cancleUpdate.mvc",
            type: "post",
            success: function (data) {
                alert("取消成功!");
                window.location.reload();

            },
            error: function (e) {
                alert("取消成功!");
            }
        });
    }

    function updateNews() {
        if ($("#title").val() === "") {
            alert("标题不能为空!");
        } else if ($("#editor1").html() === "") {
            alert("新闻内容不能为空!");
        } else {
            $("#content").val($("#editor1").html());
            var form = new FormData(document.getElementById("form1"));
            $.ajax({
                url: "<%=basePath%>updateNews.mvc",
                type: "post",
                data: form,
                processData: false,
                contentType: false,
                success: function (data) {
                    alert("新闻修改成功!")
                    window.location.reload();
                },
                error: function (e) {
                    alert("新闻修改失败！");
                }
            });
        }
    }
</script>
</body>

</html>
<!--引入富文本框-->
<script type="text/javascript">
    window.jQuery || document.write("<script src='editor/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>

<script type="text/javascript">
    window.jQuery || document.write("<script src='editor/assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='editor/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript" src="editor/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="editor/assets/js/typeahead-bs2.min.js"></script>
<script type="text/javascript" src="editor/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="editor/assets/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="editor/assets/js/markdown/markdown.min.js"></script>
<script type="text/javascript" src="editor/assets/js/markdown/bootstrap-markdown.min.js"></script>
<script type="text/javascript" src="editor/assets/js/jquery.hotkeys.min.js"></script>
<script type="text/javascript" src="editor/assets/js/bootstrap-wysiwyg.min.js"></script>
<script type="text/javascript" src="editor/assets/js/bootbox.min.js"></script>
<script type="text/javascript" src="editor/assets/js/ace-elements.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="editor/assets/js/ace.min.js"></script>
<script type="text/javascript" src="../publicpages/js/editor.js"></script>
<script type="text/javascript" src="../public/js/public.js"></script>