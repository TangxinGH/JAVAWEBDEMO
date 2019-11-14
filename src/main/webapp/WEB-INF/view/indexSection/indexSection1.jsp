<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: yayi
  Date: 2019/11/12
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--one js--%>
<script>
    $(document).ready(function(){
        for(let i=0; i<7; i++){
            $.ajax({
                type:"GET",
                url:"./one?num=-"+i,
                dataType:"json",
                success:function(data) {
                    // let json = JSON.parse(data);已是对象，不用再转
                    document.getElementById("one"+(i+1)).setAttribute("src",data.newslist[0].imgurl);
                    document.getElementById("one"+(i+1)).setAttribute("style","width:auto;height:100%;");
                    document.getElementsByTagName('b')[2*i].innerHTML = data.newslist[0].oneid;    //返回标签b的一个数组， 更改内容
                    document.getElementsByTagName('b')[2*i+1].innerHTML = data.newslist[0].imgauthor;    //返回一个数组， 更改内容作者
                    document.getElementsByTagName('span')[2*i].innerHTML = data.newslist[0].date;    //
                    document.getElementsByTagName('span')[2*i+1].innerHTML = data.newslist[0].word;    //


                }
            });
        }
        });

</script>

<% Date day=new Date();
    SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd HH:mm");
%>

<%--手风琴页面代码--%>

<div class="dh sfq">
    <ul>
        <li class="curr">
            <a href="javascript:;"><img id="one1"  src="./assets/sfq/images/1.jpg" style="	width:100%;height:100%;" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">胜率</b><span class="col2">NO.1</span></p>
                <p class="p2"><b class="col2">墨子</b><span class="col1"><% out.println(df.format(day)); %></span></p>
            </div>
        </li>
        <li>
            <a href="javascript:;"><img id="one2" src="./assets/sfq/images/2.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">出厂</b><span class="col2">NO.2</span></p>
                <p class="p2"><b class="col2">董卓</b><span class="col1"><% out.println(df.format(day)); %></span></p>
            </div>
        </li>
        <li>
            <a href="javascript:;"><img id="one3" src="./assets/sfq/images/3.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">MVP</b><span class="col2">NO.3</span></p>
                <p class="p2"><b class="col2">吕布</b><span class="col1"><% out.println(df.format(day)); %></span></p>
            </div>
        </li>
        <li>
            <a href="javascript:;"><img id="one4" src="./assets/sfq/images/4.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">场均击杀</b><span class="col2">NO.4</span></p>
                <p class="p2"><b class="col2">袁术</b><span class="col1"><% out.println(df.format(day)); %></span></p>
            </div>
        </li>
        <li>
            <a href="javascript:;"><img id="one5" src="./assets/sfq/images/5.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">场均助攻</b><span class="col2">NO.5</span></p>
                <p class="p2"><b class="col2">张郃</b><span class="col1"><% out.println(df.format(day)); %></span></p>
            </div>
        </li>
        <li>
            <a href="javascript:;"><img id="one6" src="./assets/sfq/images/6.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">场均补刀</b><span class="col2">NO.6</span></p>
                <p class="p2"><b class="col2">黄舞蝶</b><span class="col1"><% out.println(df.format(day)); %></span></p>
            </div>
        </li>
        <li>
            <a href="javascript:;"><img id="one7" src="./assets/sfq/images/3.jpg" alt=""></a>
            <div class="layer">
                <p class="p1"><b class="col1">场均金钱</b><span class="col2">NO.7</span></p>
                <p class="p2"><b class="col2">姜维</b><span class="col1"><% out.println(df.format(day)); %></span></p>
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

