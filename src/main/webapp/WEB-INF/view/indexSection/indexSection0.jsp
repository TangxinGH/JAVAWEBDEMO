<%--
  Created by IntelliJ IDEA.
  User: yayi
  Date: 2019/11/12
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<%--导航条--%>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 3px;position: absolute;  ">
    <legend >更多导航主题</legend>
</fieldset>

<ul class="layui-nav layui-bg-green">
    <li class="layui-nav-item layui-this"><a href="">墨绿导航</a></li>
    <li class="layui-nav-item " id="weather" ><a HREF="/bing" target="_blank ">产品</a></li>
    <li class="layui-nav-item"><a href="">大数据</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;">解决方案</a>
        <dl class="layui-nav-child">
            <dd><a href="">移动模块</a></dd>
            <dd><a href="">后台模版</a></dd>
            <dd><a href="popupsingin">电商平台</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item"><a href="">社区</a></li>
    <li class="layui-nav-item"><a href="http://tangxin.mycool.net" target="_blank">PHP</a></li>
    <li class="layui-nav-item layui-col-md-offset8"><a href="./signin" target="_blank">登录</a></li>
    <li class="layui-nav-item"><a href="./signup" target="_blank">注册</a></li>

</ul>