<%--
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
    <%--/*<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->*/--%>

    <%--背景粒子--%>
    <link rel="stylesheet" media="screen" href="./particles/css/style.css">




<%--手风琴style--%>
    <style type="text/css">
        *{margin: 0;padding: 0;}
        body{background-color: #292929}
        ul li,ul ol{list-style: none;}
        i,b,em,strong{font-style: normal;}
        body{font-family: '微软雅黑';}
        img{display: block;}
        .dh ul{position: relative;overflow: hidden;width: 910px;height: 306px;margin: 60px auto 0;}
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

</head>

<body>
<div id="particles-js" style="position: absolute;">  </div>   <%--背景动画 absolute是为了作为背景而用的，背景颜色在style.ccs中改--%>


<%--导航条--%>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 3px;position: absolute;  ">
    <legend >更多导航主题</legend>
</fieldset>

<ul class="layui-nav layui-bg-cyan">
    <li class="layui-nav-item"><a href="">藏青导航</a></li>
    <li class="layui-nav-item layui-this"><a href="">产品</a></li>
    <li class="layui-nav-item"><a href="">大数据</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;">解决方案</a>
        <dl class="layui-nav-child">
            <dd><a href="">移动模块</a></dd>
            <dd><a href="">后台模版</a></dd>
            <dd><a href="popupsingin">电商平台</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">登录注册</a>
          <dl class="layui-nav-child">
              <dd><a href="./signin" target="_blank">登录</a></dd>
              <dd><a href="./signup" target="_blank">注册</a></dd>
          </dl>
    </li>
    <li class="layui-nav-item"><a href="">社区</a></li>
    <li class="layui-nav-item"><a href="http://tangxin.mycool.net" target="_blank">PHP</a></li>
</ul>
<br>



<%--手风琴页面代码--%>
<script src="/demos/googlegg.js"></script>
<div class="dh sfq">
    <ul>
        <li class="curr">
            <a href="javascript:;"><img src="./assets/sfq/images/datouwang1.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">胜率</b><span class="col2">NO.1</span></p>
                <p class="p2"><b class="col2">墨子</b><span class="col1">胜率NO.1</span></p>
            </div>
        </li>
        <li>
            <a href="javascript:;"><img src="./assets/sfq/images/datouwang2.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">出厂</b><span class="col2">NO.1</span></p>
                <p class="p2"><b class="col2">董卓</b><span class="col1">胜率NO.1</span></p>
            </div>
        </li>
        <li>
            <a href="javascript:;"><img src="./assets/sfq/images/datouwang3.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">MVP</b><span class="col2">NO.1</span></p>
                <p class="p2"><b class="col2">吕布</b><span class="col1">胜率NO.1</span></p>
            </div>
        </li>
        <li>
            <a href="javascript:;"><img src="./assets/sfq/images/datouwang4.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">场均击杀</b><span class="col2">NO.1</span></p>
                <p class="p2"><b class="col2">袁术</b><span class="col1">胜率NO.1</span></p>
            </div>
        </li>
        <li>
            <a href="javascript:;"><img src="./assets/sfq/images/datouwang5.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">场均助攻</b><span class="col2">NO.1</span></p>
                <p class="p2"><b class="col2">张郃</b><span class="col1">胜率NO.1</span></p>
            </div>
        </li>
        <li>
            <a href="javascript:;"><img src="./assets/sfq/images/datouwang6.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">场均补刀</b><span class="col2">NO.1</span></p>
                <p class="p2"><b class="col2">黄舞蝶</b><span class="col1">胜率NO.1</span></p>
            </div>
        </li>
        <li>
            <a href="javascript:;"><img src="./assets/sfq/images/datouwang3.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">场均金钱</b><span class="col2">NO.1</span></p>
                <p class="p2"><b class="col2">姜维</b><span class="col1">胜率NO.1</span></p>
            </div>
        </li>
    </ul>
</div>

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript">
    $(function(){
        // 初始化 第一个 状态
        jQuery('.dh ul li.curr').animate({width:'246px'},'slow');
        jQuery('.dh ul li.curr .layer').animate({height:'60px'},'slow');
        jQuery('.dh ul li.curr .layer .p1').animate({left:'-200%'},'slow');
        jQuery('.dh ul li.curr .layer .p2').animate({right:'145px'},'slow');

        jQuery('.sfq ul li').hover(function(){
            // 获取索引
            var _index = $(this).index();

            $(this).addClass('curr')
                .stop()
                .animate({
                    width:'246px'
                },'slow')
                .siblings()
                .stop()
                .animate({
                    width:'108px'
                },'slow')
                .removeClass('curr');

            $(this).find('.layer').stop().animate({height:'60px'},'slow').parent().siblings().find('.layer').stop().animate({
                height: '100%'
            },'slow');

            $(this).find('.layer .p1').stop().animate({left:'-200%'},'slow').siblings('.p2').stop().animate({
                right: '145px'
            },'slow').parent().parent().siblings().find('.layer .p1').stop().animate({left:'10px'},'slow').siblings('.p2').stop().animate({
                right: '-200%'
            },'slow')

        },function(){
            //移出

        })
    });
</script>



<%--导航条js--%>
<script src="./layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function(elem){
            console.log(elem);
            layer.msg(elem.text());
        });
    });
</script>


<%--背景粒子--%>

<%--背景粒子--%>


<!-- scripts -->
<script src="./particles//particles.js"></script>
<script src="./particles/js/app.js"></script>



</body>
</html>
