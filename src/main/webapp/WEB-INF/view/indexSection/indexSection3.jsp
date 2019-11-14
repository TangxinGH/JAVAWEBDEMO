<%--
  Created by IntelliJ IDEA.
  User: yayi
  Date: 2019/11/12
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    $(document).ready(function(){

        $.ajax({
            type:"GET",
            url:"http://api.tianapi.com/txapi/ensentence/index?key=121939b0c5048ac82af5fbaa4b1c792e",
            dataType:"json",
            success:function(data){
                document.getElementById("english").innerHTML=data.newslist[0].en;
                document.getElementById("Chinese").innerHTML=data.newslist[0].zh;

            }});});
</script>


<div class="layui-row layui-col-lg-offset2">

    <h1 id="english" >

    </h1>

    <h1 id="Chinese"></h1>

</div>

<%--第3行--%>
<div class="layui-row " >

<div class="layui-progress layui-progress-big" lay-showPercent="yes">
<div class="layui-progress-bar layui-bg-green" lay-percent="50%"></div>

<script>
//注意进度条依赖 element 模块，否则无法进行正常渲染和功能性操作
layui.use('element', function(){
var element = layui.element;
});
</script>

</div>


</div>