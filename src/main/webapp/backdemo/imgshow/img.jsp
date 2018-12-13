<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
    function logout() {
        window.location.href = "../../logout.mvc";
    }
</script>
<head>
    <meta content="" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>图片管理</title>
    <link rel="icon" href="../../title.ico" type="image/x-icon"/>
    <!-- 引入bootstrap -->
    <link rel="stylesheet" href="../public/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/cropperjs/dist/cropper.css">
    <link rel="stylesheet" href="css/main.css">

    <!-- 引入图标样式 -->
    <script type="text/javascript" src="../public/icon/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 引入公告样式 -->
    <link rel="stylesheet" href="../public/css/public.css">
    <!-- 引入自定义样式 -->
    <link rel="stylesheet" href="./css/img.css">
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
                <!-- 头部的信息 -->
                <div class="new-header">
                    <p>
                        图片管理界面
                    </p>
                    <div>
                        <button type="button" onclick="logout()" class="btn btn-danger">退出</button>
                    </div>
                </div>

                <div class="new-body">
                    <!-- 图片展示区 -->
                    <!-- 一个页面渲染8张图片 -->
                    <div class="show-img">
                        <c:forEach items="${imageList}" var="image">
                            <tr>
                                <td>
                                    <div class="img-item">
                                        <div class="img">
                                            <img src="/logistics/${image.path}" alt="哦豁,出bug了！">
                                        </div>
                                        <a href="../../deleteImage.mvc?shuffling_id=${image.shufflingId}" class="btn btn-danger">删除</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </div>
                    <!-- 分页的标签 -->
                    <%--<div class="news-pages">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>--%>

                    <div class="container">
                        <div class="row">
                            <div class="col-md-9">
                                <!-- <h3>Demo:</h3> -->
                                <div class="img-container">
                                    <img id="image" src="./images/picture.jpg" alt="Picture">
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
                                        <%--</span>--%>
                                    </button>
                                    <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
                                        <input type="file" class="sr-only" id="inputImage" name="file" accept=".jpg,.jpeg,.png,.gif,.bmp,.tiff">
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

                </div>
                <!-- 页脚 -->
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="../public/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../public/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://fengyuanchen.github.io/js/common.js"></script>
<script type="text/javascript" src="https://unpkg.com/cropperjs/dist/cropper.js"></script>
<script type="text/javascript" src="js/jquery-cropper.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="../public/js/public.js"></script>
</html>