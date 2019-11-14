<%@ page pageEncoding="utf-8"%>
<%--这一句是防止乱码--%>



<%--当然，你还可以不固定容器宽度。将栅格或其它元素放入一个带有 class="layui-fluid" 的容器中，那么宽度将不会固定，而是 100% 适应--%>
<%--<div class="layui-container " > --%> <%--这个是固定宽度--%>
<div class="layui-fluid ">

    <div class="layui-row ">
        <div class="layui-col-md12  layui-anim-scale">
            <%--welcome--%>
            <IFRAME  src="/flower" HEIGHT="25%" WIDTH="100%"  marginheight="1px" marginwidth="1px" frameborder="no" scrolling="no" allowtransparency="yes"></IFRAME>
        </div>

    </div>
    <br>
    <%--//新的一行--%>

    <%--常规布局（以中型屏幕桌面为例）：--%>
    <div class="layui-row ">

        <div class="layui-col-lg3  layui-anim-scale">
            <p1 class="layui-btn layui-btn-primary layui-btn-radius">  欢迎 <%
                Object email = session.getAttribute("email");
                out.print(email);
            %>
            </p1>
            <br><br>
            <%--时间线--%>
            <ul class="layui-timeline">
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title"><% out.println(m.format(day));%>月<% out.println(d.format(day));%>日</h3>
                        <p>
                            <i> 你的SessionId: <%= session.getId() %></i>
                        <hr class="layui-bg-red">
                        <br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
                        <br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>
                        </p>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title"><% out.println(m.format(day));%>月<%
                            Calendar calendar = Calendar.getInstance();
                            calendar.setTime(day);
                            calendar.add(Calendar.DAY_OF_MONTH, -1);
                            day = calendar.getTime();
                            out.println(d.format(day));%>日</h3>
                        <p>是否新建isCreateNew:<%= session.isNew() %>

                        </p>
                        <ul>
                            <li>存活时间maxInActiveInterval:<%= session.getMaxInactiveInterval() %>

                            </li>
                            <li ><i>创建时间CreatedTime:<%= sdf.format( new Date(session.getCreationTime())) %></i></li>
                            <hr class="layui-bg-red">
                        </ul>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title"><% out.println(m.format(day));%>月<%
                            calendar.setTime(day);
                            calendar.add(Calendar.DAY_OF_MONTH, -1);
                            day = calendar.getTime();
                            out.println(d.format(day));%>日</h3>
                        <p>最后访问
                            <i>  lastAccessedTime: <%= sdf.format( new Date(session.getLastAccessedTime())) %></i>
                        <hr class="layui-bg-red">
                        <br>常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代
                        <br>铭记、感恩
                        <br>所有为中华民族浴血奋战的英雄将士
                        <br>永垂不朽
                        </p>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <div class="layui-timeline-title">过去</div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="layui-col-lg6 layui-col-lg-offset2">

            <div  class="layui-col-lg-offset5" >
                <%--天气--%>
                <%@include file="../../../../weather/HeFengWeatherTransparency.jsp"%>
            </div>

            <%--表格--%>
            <table id="demo" lay-filter="test"></table>

            <script src="/layui/layui.js"></script>
            <script>
                layui.use('table', function(){
                    var table = layui.table;

                    //第一个实例 //渲染
                    table.render({
                        elem: '#demo'
                        ,height: 412
                        ,url: '/table/user/data.json' //数据接口
                        ,page: true //开启分页
                        ,cols: [[ //表头
                            {field: 'email', title: 'ID', width:200, sort: true, fixed: 'left'}
                            ,{field: 'firstname', title: '用户名', width:80}
                            ,{field: 'lastname', title: 'LastName', width:120, sort: true}
                            ,{field: 'password', title: '密码',width:350 }

                        ]]

                        ,parseData: function(res){ //res 即为原始返回的数据
                            console.log(res.data.item);
                            return {
                                "code": res.status, //解析接口状态，要与的控制器里的数据一致
                                "msg": res.message, //解析提示文本
                                "count": res.total, //解析数据长度
                                "data": res.data //解析数据列表 res.data.item ???
                            };
                        }
                    });

                });
            </script>


        </div>



    </div>


    <%--富文本编辑--%>

    <iframe src="/tinymce/demo.html" WIDTH="100%" height="100%" frameborder="no" allowtransparency="yes"> </iframe>


</div>
