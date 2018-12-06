<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
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
    <title>成果展示</title>
</head>
<!-- public样式 -->
<link rel="stylesheet" href="../public/css/bootstrap.min.css">
<link rel="stylesheet" href="../public/css/public.css">
<script src="../public/js/jquery-3.3.1.min.js"></script>
<script src="../public/js/bootstrap.min.js"></script>
<script src="../public/fonts/font_9rqbtihwbsm/iconfont.js"></script>

<!-- 放大图片 -->
<!-- 自定义样式 -->
<link rel="stylesheet" href="./css/achievement.css">


<body>
    <!-- 预览图片 -->
    <div class="preview">
        <div class="content">
            <div class="bigimg">
                <img src="" alt="">
            </div>
            <div class="text">
            </div>
        </div>
        <div class="left">
            <span class="glyphicon glyphicon-menu-left
              " aria-hidden="true"></span>
        </div>
        <div class="right">
            <span class="glyphicon glyphicon-menu-right
              " aria-hidden="true"></span>
        </div>
        <div class="close">
            <span class="glyphicon glyphicon-remove
                " aria-hidden="true"></span>
        </div>
    </div>
    <jsp:include page="../publicPage/title.jsp"/>

    <!-- 成果展示区 -->
    <div class="container-fluid">
        <div class="achievement">
            <div class="a-imgs">
                <c:forEach items="${results}" var="result">
                    <div class="thumbnail" index="0">
                        <div class="img">
                            <img src="/logistics/${result.path}" data-preview-src="" data-preview-group="1" />
                        </div>
                        <div class="caption">
                            <p>${result.content}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="a-pages">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        ${bar}
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <jsp:include page="../publicPage/foot.jsp"/>

</body>
<script src="../public/js/public.js"></script>
<script src="./js/achievement.js"></script>

</html>