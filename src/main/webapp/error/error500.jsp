<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>500</title>
    <style>
        body{
            margin: 0px;
            height: 0px;
            background-color: rgb(242, 242, 242);
        }
        .error{
            position: fixed;
            width: 100%;
            height: 100%;
            background-image: url(../error/images/1.jpg);
            background-position: center;
        }
    </style>
</head>
<body background="images/1.jpg">
    <div class="error">
        错误页面
    </div>
</body>

</html>