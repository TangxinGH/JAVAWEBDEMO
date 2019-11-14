<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <title>carousel模块快速使用</title>
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <script src="./assets/js/jquery-3.4.1.js"></script>

</head>
<body>

<div class="layui-carousel" id="test1">
    <div carousel-item>
        <div><img src="" id="bing1"></div>
        <div><img src="" id="bing2"></div>
        <div><img src="" id="bing3"></div>
        <div><img src="" id="bing4"></div>
        <div><img src="" id="bing5"></div>
        <div><img src="" id="bing6"></div>
        <div><img src="" id="bing7"></div>
    </div>
</div>
<div id="bingText">

</div>
<!-- <img id="bing中可以是任意内容，如：<img src=""> -->

<script src="/layui/layui.js"></script>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,height:'800px'
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
</script>

    <%--jsonp 回调--%>
    <script type="text/javascript">
        let localHandler = function(data){
        // alert('我是本地函数，可以被跨域的remote.js文件调用，远程js带来的数据是：' + data.result);
            for (let i = 0; i < 7; i++) {

               console.log( data[i].images[0].url);
                document.getElementById("bing" + (i + 1)).setAttribute("src", "https://cn.bing.com/" + data[i].images[0].url);
            }
    };
</script>
<script src="bingImg"></script>



</body>
</html>