<%--
  Created by IntelliJ IDEA.
  User: yayi
  Date: 2019/11/12
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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

