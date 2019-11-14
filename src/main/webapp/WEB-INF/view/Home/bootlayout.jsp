<%--
  Created by IntelliJ IDEA.
  User: yayi
  Date: 2019/11/14
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>


       <script src="./assets/js/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="/assets/css/responsive.css" />
    <%--<script src="/assets/js/bootstrap.min.js"></script>--%>
<%--布局还真是引入问题，上面的居然不行。为什么--%>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="col-md-12">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#">首页</a>
                </li>
                <li>
                    <a href="#">资料</a>
                </li>
                <li class="disabled">
                    <a href="#">信息</a>
                </li>
                <li class="dropdown pull-right">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">下拉<strong class="caret"></strong></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#">操作</a>
                        </li>
                        <li>
                            <a href="#">设置栏目</a>
                        </li>
                        <li>
                            <a href="#">更多设置</a>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                            <a href="#">分割线</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="col-md-2">
            <ul class="nav nav-list">
                <li class="nav-header">
                    welocme
                </li>
                <li class="active">
                    <a href="#">首页</a>
                </li>
                <li>
                    <a href="#">库</a>
                </li>
                <li>
                    <a href="#">应用</a>
                </li>
                <li class="nav-header">
                    功能列表
                </li>
                <li>
                    <a href="#">资料</a>
                </li>
                <li>
                    <a href="#">设置</a>
                </li>
                <li class="divider">
                </li>
                <li>
                    <a href="#">帮助</a>
                </li>
            </ul>
        </div>
        <div class="col-md-6" style="height: 50%;width: 50%">
            <div class="carousel slide" id="carousel-714820">
                <ol class="carousel-indicators">
                    <li class="active" data-slide-to="0" data-target="#carousel-714820">
                    </li>
                    <li data-slide-to="1" data-target="#carousel-714820">
                    </li>
                    <li data-slide-to="2" data-target="#carousel-714820">
                    </li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img  id="img1" alt="" src="" >
                        <div class="carousel-caption">
                            <h4>
                                棒球
                            </h4>
                            <p>
                                棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。
                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img id="img2" alt="" src="" >
                        <div class="carousel-caption">
                            <h4>
                                冲浪
                            </h4>
                            <p>
                                冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。
                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img id="img3" alt="" src="">
                        <div class="carousel-caption">
                            <h4>
                                自行车
                            </h4>
                            <p>
                                以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。
                            </p>
                        </div>
                    </div>
                </div> <a data-slide="prev" href="#carousel-714820" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-714820" class="right carousel-control">›</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="accordion" id="accordion-44862">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-parent="#accordion-44862" data-toggle="collapse" href="#accordion-element-374188">每日一读</a>
                    </div>
                    <div class="accordion-body collapse in" id="accordion-element-374188">
                        <div class="accordion-inner">
                            文字...
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-parent="#accordion-44862" data-toggle="collapse" href="#accordion-element-39589">选项卡 #2</a>
                    </div>
                    <div class="accordion-body collapse" id="accordion-element-39589">
                        <div class="accordion-inner">
                            功能块...
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<%--jsonp 回调--%>
<script type="text/javascript">
    let localHandler = function(data){
        // alert('我是本地函数，可以被跨域的remote.js文件调用，远程js带来的数据是：' + data.result);
        for (let i = 0; i < 3; i++) {
            console.log("执行了");//为什么没有输出呢？
            // let a=document.getElementsByClassName("carousel-caption")[i].childNodes[2];
            //
            // let b=document.getElementsByTagName('img id="img1"')[i];

            let c=data[i].images[0].copyright;
            let d=data[i].images[0].startdate;
            let e="https://cn.bing.com/" + data[i].images[0].url;
            document.getElementsByClassName("carousel-caption")[i].children[0].innerHTML =c;  //返回标签nodelist ， 更改内容 是从0开始，不是1
            document.getElementsByClassName("carousel-caption")[i].children[1].innerText =d //返回标签nodelist ， 更改内容 childnode有兼容性问题
            document.getElementsByTagName('img')[i].setAttribute("src", e); //有错误不行？
            // document.getElementsByTagName('img')[i].setAttribute("style", "width: 50%; height: 50%");

        }
    };
</script>
<script src="bingImg"></script>


</body>
</html>
