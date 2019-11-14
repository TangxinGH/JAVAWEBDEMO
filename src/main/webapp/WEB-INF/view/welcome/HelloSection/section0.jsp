<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: yayi
  Date: 2019/11/11
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--时间--%>
<%
    Date day=new Date();
    SimpleDateFormat m = new SimpleDateFormat("MM");
    SimpleDateFormat d = new SimpleDateFormat("dd");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
%>
<br>
<div class="layui-nav-side layui-nav  layui-nav-tree" >

    <ul class="layui-nav layui-nav-tree layui-bg-green " lay-filter="" >
        <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
        <li class="layui-nav-item  layui-nav-itemed">
            <a href="javascript:;"><i class="fa fa-user-o"></i>&nbsp;Welcome</a>
            <dl class="layui-nav-child">
                <dd><a href="javascript:;"><i class="layui-icon layui-icon-log"></i>&nbsp;时间线</a></dd>
                <dd><a href="javascript:;"><i class="fa fa-users fa-fw"></i>&nbsp;MySQL用户表</a></dd>

            </dl>
        </li>
        <li class="layui-nav-item "><a ><i class="layui-icon layui-icon-dialogue">&nbsp;留言板</i></a>  </li>
        <li class="layui-nav-item"><a id="microblog"><i class="fa fa-rss fa-fw"></i>&nbsp;发布动态</a></li >
        <li class="layui-nav-item"><a href=""><i class="fa fa-cog fa-fw"></i>&nbsp;账户设置</a></li >
        <li class="layui-nav-item " id="weather"><a><i class="fa fa-thermometer-quarter fa-fw"></i>&nbsp;天气</a></li >
        <li class="layui-nav-item"><a href=""><i class="fa fa-question fa-fw"></i>&nbsp;帮助</a></li>
        <li class="layui-nav-item" id="about"><a  ><i class="layui-icon layui-icon-about">&nbsp; 关于</i> </a></li>
        <li class="layui-nav-item"><a href="../.."> <i class="fa fa-home fa-fw"></i>&nbsp;返回首页</a></li>
        <script  >
            document.getElementById("about").addEventListener("click",function(){
                layer.open({
                    type: 2,
                    area: ['900px', '500px'],
                    content: '/assets/footer.html',///这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            });


            document.getElementById("weather").addEventListener("click",function(){
                layer.open({
                    type: 2,
                    area: ['500px', '200px'],
                    offset: '200px', /*顶部距离*/
                    // content: '/weather/index.html',///这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                    content: '/weather/HeFengWeather.html',
                });
            });

            <%--&lt;%&ndash;富文本编辑&ndash;%&gt;--%>
            document.getElementById("microblog").addEventListener("click",function(){
                layui.use('layer', function() {
                    var layer = layui.layer;
                    layer.open({
                        type: 2,
                        area: ['1000px', '600px'],
                        offset: '350px', /*顶部距离*/
                        content: '/tinymce/demo.html',///这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                    });
                });


            });


        </script>
    </ul>

    <link rel="stylesheet" href="./layui/layui.js" media="all">
    <link rel="stylesheet" href="./layui/layer.js" media="all">
    <script >
       layui.use('element', function(){
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航条点击
            element.on('nav()', function(elem){
                console.log(elem);
                layer.msg(elem.text());
                element.render('nav','side');
            });
        });
    </script>


</div>
