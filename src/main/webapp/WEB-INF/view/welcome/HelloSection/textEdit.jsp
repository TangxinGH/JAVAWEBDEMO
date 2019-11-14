<%--
  Created by IntelliJ IDEA.
  User: yayi
  Date: 2019/11/10
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>


<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<link rel="stylesheet" href="../layui/css/layui.css">
<script src ="/tinymce/tinymce.js"></script>
<body>
<div style="width: 90%;margin: 15px auto;">
    <textarea name="" id="edit" cols="30" rows="10"></textarea>
    <div class="layui-btn-group" style="margin-top: 10px">
        <button class="layui-btn" lay-event="getContent">获取内容</button>
    </div>
</div>

</body>
<script src="../layui/layui.js"></script>
<script>
    /^http(s*):\/\//.test(location.href) || alert('请先部署到 localhost 下再访问');
    layui.extend({
        tinymce: '{/}./tinymce/tinymce'
    }).use(['tinymce', 'util', 'layer'], function () {
        var tinymce = layui.tinymce

        var util = layui.util;

        var edit = tinymce.render({
            elem: "#edit"
            , height: 600
        });

        util.event('lay-event', {
            getContent: function () {
                console.log(edit.getContent());
                layer.msg("展开控制台查看")
            }
        });


    });
</script>
</html>