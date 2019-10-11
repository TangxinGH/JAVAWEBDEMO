<%--
  Created by IntelliJ IDEA.
  User: 26284
  Date: 2019/10/11
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>homepage</title>

    <%--/*导航条*/--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./layui/css/layui.css"  media="all">
</head>
<body style="background-color: slategrey">

<div class="layui-card">
    <div class="layui-card-header">卡片面板</div>
    <div class="layui-card-body">
        卡片式面板面板通常用于非白色背景色的主体内<br>
        从而映衬出边框投影
    </div>
</div>

<script> layui.use('element', function(){
var element = layui.element;

//一些事件监听
element.on('tab(demo)', function(data){
console.log(data);
});
});
</script>
</body>
</html>
