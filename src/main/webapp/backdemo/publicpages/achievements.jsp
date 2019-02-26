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
    <title>成果展示</title>
    <link rel="icon" href="<%=path%>/title.ico" type="image/x-icon"/>
    <!-- 引入bootstrap -->
    <link rel="stylesheet" href="<%=path%>/backdemo/public/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://unpkg.com/cropperjs/dist/cropper.css">
    <link rel="stylesheet" href="<%=path%>/backdemo/publicpages/css/main.css">

    <!-- 引入图标样式 -->
    <script src="<%=path%>/backdemo/public/icon/font_9rqbtihwbsm/iconfont.js"></script>
    <!-- 引入公告样式 -->
    <link rel="stylesheet" href="<%=path%>/backdemo/public/css/public.css">
    <!-- 引入自定义样式 -->
    <link rel="stylesheet" href="<%=path%>/backdemo/publicpages/css/achievements.css">

    <%-- 引入文本编辑框 --%>
    <link href="<%=path%>/backdemo/news/editor/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=path%>/backdemo/news/editor/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=path%>/backdemo/news/editor/assets/css/font-awesome-ie7.min.css"/>
    <link rel="stylesheet" href="<%=path%>/backdemo/news/editor/assets/css/jquery-ui-1.10.3.custom.min.css"/>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"/>
    <link rel="stylesheet" href="<%=path%>/backdemo/news/editor/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=path%>/backdemo/news/editor/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="<%=path%>/backdemo/news/editor/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="<%=path%>/backdemo/news/editor/assets/css/ace-ie.min.css"/>
    <script src="<%=path%>/backdemo/news/editor/assets/js/ace-extra.min.js"></script>

    <script>
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
            <!-- 头部的信息 -->
            <div class="new-header">
                <p>
                    成果发布界面
                </p>
                <div>
                    <button type="button" class="btn btn-danger" onclick="logout()">退出</button>

                </div>
            </div>

            <div class="new-body">

                <div class="container">
                    <div class="row">
                        <div class="col-md-9">
                            <!-- <h3>Demo:</h3> -->
                            <div class="img-container">
                                <img id="image" src="<%=path%>/backdemo/publicpages/images/picture.jpg" alt="Picture">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <!-- <h3>Preview:</h3> -->
                            <div class="docs-preview clearfix">
                                <div class="img-preview preview-lg"></div>
                                <div class="img-preview preview-md"></div>
                                <div class="img-preview preview-sm"></div>
                                <div class="img-preview preview-xs"></div>
                            </div>

                            <!-- <h3>Data:</h3> -->
                            <div class="docs-data">
                                <!-- <div class="input-group input-group-sm">
                                    <span class="input-group-prepend">
                                      <label class="input-group-text" for="dataX">X</label>
                                    </span>
                                    <input type="text" class="form-control" id="dataX" placeholder="x">
                                    <span class="input-group-append">
                                      <span class="input-group-text">px</span>
                                    </span>
                                  </div> -->
                                <!-- <div class="input-group input-group-sm">
                                    <span class="input-group-prepend">
                                      <label class="input-group-text" for="dataY">Y</label>
                                    </span>
                                    <input type="text" class="form-control" id="dataY" placeholder="y">
                                    <span class="input-group-append">
                                      <span class="input-group-text">px</span>
                                    </span>
                                  </div> -->
                                <div class="input-group input-group-sm">
                                        <span class="input-group-prepend">
                                            <label class="input-group-text" for="dataWidth">宽度</label>
                                        </span>
                                    <input type="text" class="form-control" id="dataWidth" placeholder="width">
                                    <span class="input-group-append">
                                            <span class="input-group-text">px</span>
                                        </span>
                                </div>
                                <div class="input-group input-group-sm">
                                        <span class="input-group-prepend">
                                            <label class="input-group-text" for="dataHeight">高度</label>
                                        </span>
                                    <input type="text" class="form-control" id="dataHeight" placeholder="height">
                                    <span class="input-group-append">
                                            <span class="input-group-text">px</span>
                                        </span>
                                </div>
                                <div class="input-group input-group-sm">
                                        <span class="input-group-prepend">
                                            <label class="input-group-text" for="dataRotate">角度</label>
                                        </span>
                                    <input type="text" class="form-control" id="dataRotate" placeholder="rotate">
                                    <span class="input-group-append">
                                            <span class="input-group-text">deg</span>
                                        </span>
                                </div>
                                <div class="input-group input-group-sm">
                                        <span class="input-group-prepend">
                                            <label class="input-group-text" for="dataScaleX">左右</label>
                                        </span>
                                    <input type="text" class="form-control" id="dataScaleX" placeholder="scaleX">
                                </div>
                                <div class="input-group input-group-sm">
                                        <span class="input-group-prepend">
                                            <label class="input-group-text" for="dataScaleY">上下</label>
                                        </span>
                                    <input type="text" class="form-control" id="dataScaleY" placeholder="scaleY">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9 docs-buttons">
                            <!-- <h3>Toolbar:</h3> -->

                            <!-- 放大缩小 -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="zoom" data-option="0.1"
                                        title="Zoom In">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;zoom&quot;, 0.1)">
                                      <span class="fa fa-search-plus"></span>
                                    </span> -->
                                    放大
                                </button>
                                <button type="button" class="btn btn-primary" data-method="zoom" data-option="-0.1"
                                        title="Zoom Out">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;zoom&quot;, -0.1)">
                                      <span class="fa fa-search-minus"></span>
                                    </span> -->
                                    缩小
                                </button>
                            </div>
                            <!-- 左移右移上移下移 -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="move" data-option="-10"
                                        data-second-option="0" title="Move Left">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;move&quot;, -10, 0)">
                                      <span class="fa fa-arrow-left"></span>
                                    </span> -->
                                    左移
                                </button>
                                <button type="button" class="btn btn-primary" data-method="move" data-option="10"
                                        data-second-option="0" title="Move Right">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;move&quot;, 10, 0)">
                                      <span class="fa fa-arrow-right"></span>
                                    </span> -->
                                    右移
                                </button>
                                <button type="button" class="btn btn-primary" data-method="move" data-option="0"
                                        data-second-option="-10" title="Move Up">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;move&quot;, 0, -10)">
                                      <span class="fa fa-arrow-up"></span>
                                    </span> -->
                                    上移
                                </button>
                                <button type="button" class="btn btn-primary" data-method="move" data-option="0"
                                        data-second-option="10" title="Move Down">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;move&quot;, 0, 10)">

                                      <span class="fa fa-arrow-down"></span>
                                    </span> -->
                                    下移
                                </button>
                            </div>
                            <!-- 左旋右旋 -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="rotate" data-option="-45"
                                        title="Rotate Left">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;rotate&quot;, -45)">
                                      <span class="fa fa-rotate-left"></span>
                                    </span> -->
                                    左旋
                                </button>
                                <button type="button" class="btn btn-primary" data-method="rotate" data-option="45"
                                        title="Rotate Right">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;rotate&quot;, 45)">
                                      <span class="fa fa-rotate-right"></span>
                                    </span> -->
                                    右旋
                                </button>
                            </div>
                            <!-- 左右上下反向 -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="scaleX" data-option="-1"
                                        title="Flip Horizontal">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;scaleX&quot;, -1)">
                                      <span class="fa fa-arrows-h"></span>
                                    </span> -->
                                    左右翻转
                                </button>
                                <button type="button" class="btn btn-primary" data-method="scaleY" data-option="-1"
                                        title="Flip Vertical">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;scaleY&quot;, -1)">
                                      <span class="fa fa-arrows-v"></span>
                                    </span> -->
                                    上下翻转
                                </button>
                            </div>


                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="reset" title="Reset">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;reset&quot;)">
                                      <span class="fa fa-refresh"></span> -->
                                    重置
                                    </span>
                                </button>
                                <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
                                    <input type="file" class="sr-only" id="inputImage" name="file"
                                           accept=".jpg,.jpeg,.png,.gif,.bmp,.tiff">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="Import image with Blob URLs">
                                      <span class="fa fa-upload"></span>
                                    </span> -->
                                    选择图片
                                </label>
                            </div>
                            <div class="btn-group btn-group-crop">
                                <!-- data-option="{ &quot;maxWidth&quot;: 4096, &quot;maxHeight&quot;: 4096 }" -->
                                <button type="button" class="btn btn-success" data-method="getCroppedCanvas">
                                    <!-- <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;getCroppedCanvas&quot;, { maxWidth: 4096, maxHeight: 4096 })">
                                      上传
                                    </span> -->
                                    上传
                                </button>
                            </div>
                        </div>
                    </div>

                </div>


                <form action="./insertAchievement" method="POST" id="form" role="form"
                      enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="title">成果标题</label>
                        <input type="text" class="form-control" name="title" id="title" placeholder="请输入标题">
                    </div>
                    <!-- 文本编辑器 -->
                    <div class="text-area">
                        <input type="hidden" name="path" id="path">
                        <input type="hidden" name="content" id="content">
                        <div class="wysiwyg-editor" id="editor1">
                        </div>
                        <div class="hr hr-double dotted"></div>
                    </div>
                </form>
                <div class="show-btn">
                    <button class="btn btn-primary" onclick="submitAchievement()">发布</button>
                </div>


                <div class="show-img">
                    <c:forEach items="${results}" var="result" varStatus="id">
                        <div class="media">
                            <div class="media-left media-middle">
                                <img class="media-object" src="/logistics/${result.path}" alt="...">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">${result.title}</h4>
                                    ${result.content}
                            </div>
                            <a href="javascript:deleteAche(${id.index})" class="btn btn-danger">删除</a>
                        </div>


                    </c:forEach>
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
</div>
</body>

<script>
    function submitAchievement() {
        if ($("#title").val() === "") {
            alert("标题不能为空!");
        } else if ($("#editor1").html() === "") {
            alert("内容不能为空!");
        } else if($("#path").val() === ""){
            alert("请先点击上传按钮！");
        } else{
            $("#content").val($("#editor1").html());
            var form = new FormData(document.getElementById("form"));
            $.ajax({
                url: "<%=path%>/insertAchievement",
                type: "post",
                data: form,
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data === "yes") {
                        alert("添加成功!");
                        window.location.reload();
                    } else {
                        alert("添加失败!");
                    }

                },
                error: function () {
                    alert("添加失败！");
                }
            });
        }
    }
    
    function deleteAche(id) {
        $.ajax({
            url: "<%=path%>/deleteAchievement?index="+id,
            type: "post",
            success: function (data) {
                if(data === "false"){
                    alert("删除失敗!");
                }else{
                    alert("删除成功!");
                    window.location.reload();
                }

            },
            error: function (e) {
                alert("删除失败！");
            }
        });
    }

</script>
</html>

<script type="text/javascript">
    window.jQuery || document.write("<script src='<%=path%>/backdemo/news/editor/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>

<script type="text/javascript">
    window.jQuery || document.write("<script src='<%=path%>/backdemo/news/editor/assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='<%=path%>/backdemo/news/editor/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript" src="<%=path%>/backdemo/news/editor/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/backdemo/news/editor/assets/js/typeahead-bs2.min.js"></script>
<script type="text/javascript" src="<%=path%>/backdemo/news/editor/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="<%=path%>/backdemo/news/editor/assets/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="<%=path%>/backdemo/news/editor/assets/js/markdown/markdown.min.js"></script>
<script type="text/javascript" src="<%=path%>/backdemo/news/editor/assets/js/markdown/bootstrap-markdown.min.js"></script>
<script type="text/javascript" src="<%=path%>/backdemo/news/editor/assets/js/jquery.hotkeys.min.js"></script>
<script type="text/javascript" src="<%=path%>/backdemo/news/editor/assets/js/bootstrap-wysiwyg.min.js"></script>
<script type="text/javascript" src="<%=path%>/backdemo/news/editor/assets/js/bootbox.min.js"></script>
<script src="<%=path%>/backdemo/news/editor/assets/js/ace-elements.min.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript" src="<%=path%>/backdemo/news/editor/assets/js/ace.min.js"></script>
<script type="text/javascript" src="<%=path%>/backdemo/publicpages/js/editor.js"></script>

<script src="<%=path%>/backdemo/publicpages/js/http_fengyuanchen.github.io_js_common.js"></script>
<script src="<%=path%>/backdemo/publicpages/js/http_unpkg.com_cropperjs_dist_cropper.js"></script>
<script src="<%=path%>/backdemo/publicpages/js/jquery-cropper.js"></script>
<script src="<%=path%>/backdemo/publicpages/js/main.js"></script>
<script src="<%=path%>/backdemo/public/js/public.js" type="text/javascript"></script>