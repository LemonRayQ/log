<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
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
    <title>后勤管理处介绍</title>
    <link rel="icon" href="<%=basePath%>title.ico" type="image/x-icon"/>
    <!-- public样式 -->
    <link rel="stylesheet" href="<%=basePath%>public/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>public/css/public.css">
    <script src="<%=basePath%>public/js/jquery-3.3.1.min.js"></script>
    <script src="<%=basePath%>public/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>public/fonts/font_9rqbtihwbsm/iconfont.js"></script>

    <!-- 自定样式 -->
    <link rel="stylesheet" href="<%=basePath%>public/css/public.css">
    <link rel="stylesheet" href="<%=basePath%>connect/css/introduce.css">

    <style>
        .table > tbody > tr > td,
        .table > tbody > tr > th,
        .table > tfoot > tr > td,
        .table > tfoot > tr > th,
        .table > thead > tr > td,
        .table > thead > tr > th {
            vertical-align: middle;
        }
    </style>
</head>

<body>
<div class="bodys">
    <!-- 头部图片和文字 -->
    <jsp:include page="../publicPage/title.jsp"/>

    <div class="html-container">
        <div clss="html-body">
            <!-- 内容展示区域 -->
            <div class="container-fluid">
                <div class="rules-content">
                    <!-- 右侧消息展示区域 -->
                    <div class="content-right">
                        <div class="content-news">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <p class="title">
                                <span>
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-tongzhi"></use>
                                    </svg>&nbsp;
                                </span>
                                        &nbsp;&nbsp;
                                        <span class="title-header">联系我们</span>
                                    </p>
                                    <ol class="breadcrumb">
                                        <li><a href="./Home">网站首页</a></li>
                                        <li><a href="#">
                                            联系我们
                                        </a></li>

                                    </ol>
                                </div>
                                <div class="panel-body">
                                    <!-- 正文内容 -->
                                    <div class="item-work">
                                        <div class="work-content">
                                            <table class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>序号</th>
                                                    <th>科室</th>
                                                    <th>姓名</th>
                                                    <th>办公电话</th>
                                                    <th>备注</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>处长</td>
                                                    <td>李珲</td>
                                                    <td>3370490</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td rowspan="2">副处长</td>
                                                    <td>谈钊</td>
                                                    <td>3371811</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>伍轶群</td>
                                                    <td>3370158</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td rowspan="4">综合科</td>
                                                    <td>赵秋泉</td>
                                                    <td>3375163</td>
                                                    <td>处长助理兼科长</td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td>李雪梅</td>
                                                    <td rowspan="3">3507760</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>6</td>
                                                    <td>许静</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>7</td>
                                                    <td>陈梦诗</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>8</td>
                                                    <td rowspan="3">医疗卫生科</td>
                                                    <td>王志贤
                                                    </td>
                                                    <td rowspan="3">3375282</td>
                                                    <td>科长</td>
                                                </tr>
                                                <tr>
                                                    <td>9</td>
                                                    <td>邱小琼
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>10</td>
                                                    <td>曹庆琼
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>11</td>
                                                    <td rowspan="4">工程管理科</td>
                                                    <td>秦良彬
                                                    </td>
                                                    <td rowspan="4">3373995</td>
                                                    <td>科长</td>
                                                </tr>
                                                <tr>
                                                    <td>12</td>
                                                    <td>楚希
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>13</td>
                                                    <td>杨华
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>14</td>
                                                    <td>李恩
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>15</td>
                                                    <td rowspan="6">校园管理科</td>
                                                    <td>王勇
                                                    </td>
                                                    <td rowspan="2">3500519</td>
                                                    <td>科长</td>
                                                </tr>
                                                <tr>
                                                    <td>16</td>
                                                    <td>童斌
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>17</td>
                                                    <td>李国林
                                                    </td>
                                                    <td rowspan="4">3373606</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>18</td>
                                                    <td>文斌
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>19</td>
                                                    <td>管芳
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>20</td>
                                                    <td>王利霞
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>21</td>
                                                    <td rowspan="3">工程经济科</td>
                                                    <td>王瑞雪
                                                    </td>
                                                    <td rowspan="3">3375391</td>
                                                    <td>科长</td>
                                                </tr>
                                                <tr>
                                                    <td>22</td>
                                                    <td>李宏莉
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>23</td>
                                                    <td>吴志豪
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>24</td>
                                                    <td rowspan="3">房屋管理科</td>
                                                    <td>程桥
                                                    </td>
                                                    <td rowspan="3">3370612
                                                    </td>
                                                    <td>科长</td>
                                                </tr>
                                                <tr>
                                                    <td>25</td>
                                                    <td>张利华
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>26</td>
                                                    <td>周雨桦
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>27</td>
                                                    <td rowspan="2">膳食科</td>
                                                    <td>童守俊</td>
                                                    <td rowspan="2">3370671</td>
                                                    <td>科长</td>
                                                </tr>
                                                <tr>
                                                    <td>28</td>
                                                    <td>李晓勇
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>29</td>
                                                    <td rowspan="6">物业中心</td>
                                                    <td>常树义
                                                    </td>
                                                    <td rowspan="4">3370627
                                                    </td>
                                                    <td>经理</td>
                                                </tr>
                                                <tr>
                                                    <td>30</td>
                                                    <td>张畅
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>31</td>
                                                    <td>任登明
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>32</td>
                                                    <td>雷静
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>33</td>
                                                    <td>谭浩觉
                                                    </td>
                                                    <td rowspan="2">3372799
                                                    </td>
                                                    <td>副经理</td>
                                                </tr>
                                                <tr>
                                                    <td>34</td>
                                                    <td>王丽
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>35</td>
                                                    <td rowspan="4">公寓中心</td>
                                                    <td>田乐
                                                    </td>
                                                    <td rowspan="4">3370878
                                                    </td>
                                                    <td>经理</td>
                                                </tr>
                                                <tr>
                                                    <td>36</td>
                                                    <td>刘小红
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>37</td>
                                                    <td>邓娟
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>38</td>
                                                    <td>王东
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>39</td>
                                                    <td rowspan="2">北苑物业部</td>
                                                    <td>熊怀林
                                                    </td>
                                                    <td rowspan="2">3371108
                                                    </td>
                                                    <td>经理</td>
                                                </tr>
                                                <tr>
                                                    <td>40</td>
                                                    <td>王洁
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!-- 一个内容 -->

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="html-footer">
    <jsp:include page="../publicPage/foot.jsp"/>
</div>


</body>
<script src="<%=basePath%>public/js/public.js"></script>
</html>