<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>welcome</title>
    <%--<script src="./assets/js/jquery-3.4.1.js"></script>--%>
    <%--<script src="./assets/js/jquery-3.4.1.min.js"></script>--%>
    <%--<script src="fontanimation/TweenMax.min.js"></script>--%>

    <link rel="stylesheet" href="./layui/css/layui.css" media="all">
    <link rel="stylesheet" href="./layui/layui.all.js" media="all">
    <link href="./icon/font-awesome/css/font-awesome.css" rel="stylesheet">

    <%--响应式--%>
    <!-- 将下面这段代码放置在 </body> 之前 -->
    <script src="/js/responsive-nav.js">

        var navigation2 = responsiveNav("#navdiv");
    </script>

<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 3px;position: absolute;  ">
    <legend >更多导航主题</legend>
</fieldset>

<ul class="layui-nav ">
    <li class="layui-nav-item layui-this"><a href="">墨绿导航</a></li>
    <li class="layui-nav-item " ><a >产品</a></li>

    <li class="layui-nav-item layui-col-md-offset9"><a href="../" ><i class="layui-icon layui-icon-close-fill layui-icon-return" > 返回</i></a></li>
    <li class="layui-nav-item"><a href=" " target="_blank"><i class="fa fa-power-off"></i>&nbsp;注销</i></a></li>

</ul>

<%--端布局div --%>
<div class="layui-fluid">
    <%--常规布局（以中型屏幕桌面为例）：--%>
    <div class="layui-row">
        <div class="layui-col-lg2">
            <%--你的内容 2/12--%>

            <%--合并jsp 内容是侧边导航条，监听事件--%>
            <%@include file="HelloSection/section0.jsp"%>
        </div>
        <div class="layui-col-lg10" id="navdiv">
            <%--你的内容 10/12--%>

            <%--合并jsp,内容是一个layui容器是生花，时间线，表格，--%>
            <%@include file="HelloSection/section1.jsp"%>

        </div>
    </div>




</body>
</html>
