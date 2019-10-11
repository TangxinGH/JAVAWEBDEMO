<! DOCTYPE html>
<html lang="en">

<head>
    <!-- meta data -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <style>
        #wave {
            background-color: #d7ffff;
            margin: 0px;
            overflow: hidden;
        }
    </style>


    <%--脚本, 记得加点，因为根目录为Demo了--%>
    <script src="./assets/js/jquery-3.4.1.js"></script>
    <script src="./assets/js/jquery-3.4.1.min.js"></script>
    <script src="./assets/js/messages_zh.js" type="text/javascript" charset="utf-8"></script>
    <!--font-family-->
    <link href="./assets/css/fontcss.css" rel="stylesheet">

    <link href="assets/css/fontfamily.css" rel="stylesheet">
    <!-- title of site -->
    <title>Sign up</title>

    <!-- For favicon png -->
    <link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>

    <!--font-awesome.min.css-->
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <!--animate.css-->
    <link rel="stylesheet" href="assets/css/animate.css">

    <!--bootstrap.min.css-->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <!-- bootsnav -->
    <link rel="stylesheet" href="assets/css/bootsnav.css">

    <!--style.css-->
    <link rel="stylesheet" href="assets/css/style.css">

    <!--responsive.css-->
    <link rel="stylesheet" href="assets/css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<%--波浪--%>
<div id="wave" style="position:fixed; z-index:0 " ></div>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->


<!-- signin end -->
<section class="signin signup">
    <div class="container"  style="float: right">
        <form action="signin.jsp" id="signupForm">
            <div class="sign-content" >
               <h2 style="position: absolute;">sign up</h2>
                <br>
                <br>
                <br>
                <br>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="signin-form">

                            <div class="form-col">
                                <div class="form-group">

                                    <input type="text" class="form-control" id="signup_form_firstname" name="firstname"
                                           placeholder="first name">
                                </div><!--/.form-group -->
                            </div><!--/.form-col -->
                            <div class="form-col1">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="signup_form_lastname" name="lastname"
                                           placeholder="last name">
                                </div><!--/.form-group -->
                            </div><!--/.form-col1 -->
                            <div class="form-group">
                                <input type="email" class="form-control" id="signup_form_email" name="email"
                                       placeholder="enter your email here">
                            </div><!--/.form-group -->
                            <div class="form-group">
                                <input type="password" class="form-control" id="signup_form_password" name="password"
                                       placeholder="Password">
                            </div><!--/.form-group -->
                            <div class="form-group">
                                <input type="password" class="form-control" id="signup_form_confirm_password"
                                       name="confirm_password" placeholder="Retype Password">
                            </div><!--/.form-group -->

                        </div><!--/.signin-form -->
                    </div><!--/.col -->
                </div><!--/.row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="signin-password">
                            <div class="awesome-checkbox-list">
                                <ul class="unstyled centered">

                                    <li>
                                        <input class="styled-checkbox" id="styled-checkbox-2" type="checkbox"
                                               value="value2" name="agree-checkbox">
                                        <label for="styled-checkbox-2">accept our terms & condition</label>
                                    </li>

                                    <li></li>

                                </ul>
                            </div><!--/.awesome-checkbox-list -->
                        </div><!--/.signin-password -->
                    </div><!--/.col -->
                </div><!--/.row -->


                <div class="row">
                    <div class="col-sm-12">
                        <div class="signin-footer">
                            <button type="submit" class="btn signin_btn" data-toggle="modal"
                                    data-target=".signin_modal">
                                sign up
                            </button>
                            <p>
                                already member ?
                                <a href="signin">sign in</a>
                            </p>
                        </div><!--/.signin-footer -->
                    </div><!--/.col-->
                </div><!--/.row -->

            </div><!--/.sign-content -->

        </form><!--/form -->
    </div><!--/.container -->

</section><!--/.signin -->

<!-- signin end -->


<!-- Include all js compiled plugins (below), or include individual files as needed -->

<script src="assets/js/jquery.js"></script>

<!--modernizr.min.js-->
<script src="assets/js/modernizr.min.js"></script>

<!--bootstrap.min.js-->
<script src="./assets/js/bootstrap.min.js"></script>

<!-- bootsnav js -->
<script src="./assets/js/bootsnav.js"></script>

<!-- jquery.sticky.js -->
<script src="./assets/js/jquery.sticky.js"></script>
<script src="./assets/js/jquery.easing.min.js"></script>

<%--<script src="./assets/css/errorColor.css"> 这个不是脚本，emmm。。。</script>--%>
<link rel="stylesheet" href="./assets/css/errorColor.css">
<!--Custom JS-->
<script src="./assets/js/custom.js"></script>

<%--验证输入js,注意编码--%>
<script src="./assets/js/jquery.validate.js" type="text/javascript" charset="utf-8"></script>
<script src="./assets/js/validationCheck.js" type="text/javascript" charset="utf-8"></script>


<%--波浪效果--%>
<script src="./waveSign/three.min.js"></script>
<script src="./waveSign/wave.js"></script>


</body>

</html>