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
    <title>党建廉政</title>
    <link rel="icon" href="<%=basePath%>title.ico" type="image/x-icon"/>
    <!-- 引入bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>backdemo/public/css/bootstrap.min.css">
    <%--<script src="../public/js/jquery-3.3.1.min.js"></script>--%>
    <%--<script src="../public/js/bootstrap.min.js"></script>--%>

    <!-- 引入图标样式 -->
    <script src="<%=basePath%>backdemo/public/icon/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 引入自定义样式 -->
    <link rel="stylesheet" href="<%=basePath%>backdemo/public/css/public.css">
    <%--<link rel="stylesheet" href="./css/rules.css">--%>

    <%-- 引入文本编辑框 --%>
    <link href="<%=basePath%>backdemo/news/editor/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>backdemo/news/editor/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>backdemo/news/editor/assets/css/font-awesome-ie7.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>backdemo/news/editor/assets/css/jquery-ui-1.10.3.custom.min.css"/>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"/>
    <link rel="stylesheet" href="<%=basePath%>backdemo/news/editor/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>backdemo/news/editor/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>backdemo/news/editor/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>backdemo/news/editor/assets/css/ace-ie.min.css"/>
    <script src="<%=basePath%>backdemo/news/editor/assets/js/ace-extra.min.js"></script>
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
                       党建廉政发布界面
                    </p>
                    <div>
                        <button type="button" class="btn btn-danger" onclick="logout()">退出</button>

                    </div>
                </div>
                <div class="new-body">
                    <form action="./insertNews" method="POST" role="form" id="form">
                        <c:if test="${singleNews != null}">
                            <input type="hidden" name="newsId" value="${singleNews.newsId}"/>
                        </c:if>
                        <div class="form-group">
                            <label for="title">标题</label>
                            <input type="text" class="form-control" name="title" id="title" placeholder="请输入标题" value="${singleNews.title}"/>
                        </div>                      
                        <div class="form-group">
                            <label for="exampleInputFile">上传附件</label>
                            <input type="file" name="paths" id="exampleInputFile"/>
                        </div>
                        <input type="hidden" value="8" name="classId"/>
                        <input type="hidden" value="2" name="deptId"/>
                        <!-- 文本编辑器 -->
                        <div class="text-area">
                            <input type="hidden" name="content" id="content"/>
                            <div class="wysiwyg-editor" id="editor1">${singleNews.content}</div>
                            <div class="hr hr-double dotted"></div>
                        </div>
                    </form>
                    <c:if test="${singleNews == null}">
                        <div class="show-btn">
                            <button class="btn btn-primary" onclick="submitGovernment()">发布</button>
                        </div>
                    </c:if>
                    <div class="show-btn">
                        <c:if test="${singleNews != null}">
                            <button class="btn btn-primary" style="width:90px;" onclick="updateWork()">修改</button>
                            &nbsp;&nbsp;&nbsp;
                            <button class="btn btn-primary" onclick="cancleUpdate()">取消修改</button>
                        </c:if>
                    </div>

                </div>
                <div class="show-news">
                    <form class="navbar-form" action="../../selectGovernWithName">
                        <div class="form-group">
                            <input type="text" name="name" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">查询</button>
                    </form>
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>标题</th>                             
                                <th>时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${news}" var="news" varStatus="id">
                            <c:if test="${news.classify.classifyId == 8}">
                                <tr>
                                    <td>${id.count}</td>
                                    <td>${news.title}</td>
                                    <td>${news.time}</td>
                                    <td>
                                        <a href="javascript:uploadWork(${id.index})" class="btn btn-success">修改</a>
                                        <a href="javascript:deleteWork(${id.index})" class="btn btn-danger">删除</a>
                                    </td>
                                </tr>
                            </c:if>
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
            </div>

        </div>

    </div>

</body>

<script>

    function cancleUpdate() {
        $.ajax({
            url: "<%=basePath%>cancleUpdate",
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

    function submitGovernment() {
        if ($("#title").val() === "") {
            alert("标题不能为空!");
        } else if ($("#editor1").html() === "") {
            alert("内容不能为空!");
        } else {
            $("#content").val($("#editor1").html());
            var form = new FormData(document.getElementById("form"));
            $.ajax({
                url: "<%=basePath%>insertNews",
                type: "post",
                data: form,
                processData: false,
                contentType: false,
                success: function (data) {
                    alert("添加成功!");
                    window.location.reload();
                },
                error: function (e) {
                    alert("添加失败！");
                }
            });
        }
    }

    function deleteWork(index) {
        $.ajax({
            url: "<%=basePath%>deleteNews?index="+index,
            type: "post",
            success: function (data) {
                alert("删除成功!")
                window.location.reload();
            },
            error: function (e) {
                alert("删除失败！");
            }
        });
    }

    function uploadWork(index) {
        $.ajax({
            url: "<%=basePath%>uploadNews?index="+index,
            type: "post",
            success: function (data) {
                window.location.reload();
            },
            error: function (e) {
            }
        });
    }

    function updateWork() {
        if($("#title").val() === ""){
            alert("标题不能为空!");
        }else if($("#editor1").html() === ""){
            alert("内容不能为空!");
        }else{
            $("#content").val($("#editor1").html());
            var form = new FormData(document.getElementById("form"));
            $.ajax({
                url:"<%=basePath%>updateNews",
                type:"post",
                data:form,
                processData:false,
                contentType:false,
                success:function(data){
                    alert("修改成功!")
                    window.location.reload();
                },
                error:function(e){
                    alert("修改失败！");
                }
            });
        }
    }
</script>
</html>
<script type="text/javascript">
    window.jQuery || document.write("<script src='<%=basePath%>backdemo/news/editor/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>

<script type="text/javascript">
    window.jQuery || document.write("<script src='<%=basePath%>backdemo/news/editor/assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='<%=basePath%>backdemo/news/editor/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="<%=basePath%>backdemo/news/editor/assets/js/bootstrap.min.js"></script>
<script src="<%=basePath%>backdemo/news/editor/assets/js/typeahead-bs2.min.js"></script>
<script src="<%=basePath%>backdemo/news/editor/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="<%=basePath%>backdemo/news/editor/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=basePath%>backdemo/news/editor/assets/js/markdown/markdown.min.js"></script>
<script src="<%=basePath%>backdemo/news/editor/assets/js/markdown/bootstrap-markdown.min.js"></script>
<script src="<%=basePath%>backdemo/news/editor/assets/js/jquery.hotkeys.min.js"></script>
<script src="<%=basePath%>backdemo/news/editor/assets/js/bootstrap-wysiwyg.min.js"></script>
<script src="<%=basePath%>backdemo/news/editor/assets/js/bootbox.min.js"></script>
<script src="<%=basePath%>backdemo/news/editor/assets/js/ace-elements.min.js"></script>
<script src="<%=basePath%>backdemo/news/editor/assets/js/ace.min.js"></script>
<script src="<%=basePath%>backdemo/publicpages/js/editor.js"></script>
<script src="<%=basePath%>backdemo/public/js/public.js"></script>