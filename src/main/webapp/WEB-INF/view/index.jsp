<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 26284
  Date: 2019/10/4
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Index</title>

    <link rel="shortcut icon" type="image/icon" href="/favicon.ico"/>

    <%--/*导航条*/--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./layui/css/layui.css"  media="all">

    <link rel="text/javascript" href="./layui/layui.js" media="all">
    <link rel="text/javascript" href="./layui/layer.js" media="all">
    <%--/*<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->*/--%>

    <%--背景粒子--%>
    <link rel="stylesheet" media="screen" href="./particles/css/style.css">

    <link href="./fontawesomefree5web/css/all.css" rel="stylesheet"> <!--load all styles -->

    <script src="./assets/js/jquery-3.4.1.js"></script>

<%--手风琴style--%>
    <style type="text/css">
        *{margin: 0;padding: 0;}
        body{background-color: #292929}
        ul li,ul ol{list-style: none;}
        i,b,em,strong{font-style: normal;}
        body{font-family: '微软雅黑';}
        img{display: block;}
        .dh ul{position: relative;overflow: hidden;width: 1010px;height: 406px;margin: 60px auto 0;}
        .dh ul li{float: left;width: 108px;overflow: hidden;height: 100%;position: relative;cursor: pointer;}
        .dh ul li a{display: block;width: 100%;height: 100%;}
        .dh ul li .layer{position: absolute;bottom: 0;left: 0;width: 100%;background:rgba(27,29,36,0.75);height: 100%;}
        .dh ul li .layer .p1{position: absolute;bottom: 5px;left: 10px;}
        .dh ul li .layer .p2{position: absolute;bottom: 5px;right: -200%;}
        .dh ul li .layer .p2 b,.dh ul li .layer .p2 span{display: block;font-weight: bold;font-size: 20px;}
        .dh ul li .layer .p1 b,.dh ul li .layer .p1 span{display: block;font-weight: bold;font-size: 14px;}

        .dh ul li.curr{}
        /* .dh ul li.curr .layer .p1{left: -200%;}
        .dh ul li.curr .layer .p2{left: 10px;} */

        .col1{color: #00A39A;}
        .col2{color: #fff;}
    </style>

    <%--响应式--%>
    <!-- 将下面这段代码放置在 </body> 之前 -->
    <script src="assets/js/responsive-nav.js">
        var navigation = responsiveNav("#navsfq");

    </script>

</head>

<body>
<div id="particles-js" style="position: absolute;">  </div>   <%--背景动画 absolute是为了作为背景而用的，背景颜色在style.ccs中改--%>

<%--导航条文件--%>

<%@include file="./indexSection/indexSection0.jsp"%>

<br>

<div class="layui-fluid">
    <%--常规布局（以中型屏幕桌面为例）：--%>
    <div class="layui-row">
        <div class="layui-col-lg12" id="navsfq">

            <%--手风琴--%>
            <%@include file="indexSection/indexSection1.jsp"%>

            <%--导航条和手风琴，背景粒子js文件--%>
            <%@include file="indexSection/indexSection2.jsp"%>

        </div>

    </div>

        <%--<%@include file="Home/bootlayout.jsp"%>--%>
        <br><br><br><br> <br><br><br><br> <br><br><br><br> <br><br><br><br> <br><br><br> <br><br>
         <%@include file="indexSection/indexSection3.jsp"%>
</body>
</html>
