<! DOCTYPE HTML>
<html  lang="en">

    <head>
        <!-- meta data -->
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<%--脚本--%>
        <script src="./assets/js/jquery-3.4.1.js"></script>
        <script src="./assets/js/jquery-3.4.1.min.js"></script>

		<style>
			input.error { border: 1px solid red; }
			label.error {
				font-weight: bold;
				color: red;
			}

		</style>
        <!--font-family-->
		<%--<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&amp;subset=devanagari,latin-ext" rel="stylesheet">--%>
        
        <!-- title of site -->
        <title>Sign in</title>

        <!-- For favicon png -->
		<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
       
        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!--animate.css-->
        <link rel="stylesheet" href="assets/css/animate.css">
		
        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- bootsnav -->
		<link rel="stylesheet" href="assets/css/bootsnav.css" >	
        
        <!--style.css-->
        <link rel="stylesheet" href="assets/css/style.css">
        
        <!--responsive.css-->
        <link rel="stylesheet" href="assets/css/responsive.css">
<%--//layui验证吗--%>
		<link rel="stylesheet" href="./layui/css/layui.css"  media="all">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		
        <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
	
	<body>

		<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->


		<!--signin  end -->
		<section class="signin">
			<div class="container">

				<div class="sign-content">

					<h2>sign in</h2>
					<form  action="/signin/signinFormRequest" method="post" id="signinForm">
					<div class="row">
						<div class="col-sm-12">
							<div class="signin-form">

									<div class="form-group">
									    <label for="signin_formEmail">Email</label>
									    <input type="email" name="email" class="form-control" id="signin_formEmail" placeholder="enter your email here">
									</div><!--/.form-group -->
									<div class="form-group">
										<label for="signin_formPassword">password</label>
									    <input type="password" name="password" class="form-control" id="signin_formPassword" placeholder="Password">
									</div><!--/.form-group -->
							</div><!--/.signin-form -->
						</div><!--/.col -->
					</div><!--/.row -->
						<%--验证码--%>
						<div  >
							<label STYLE="font-size:17PX ;font-family: 华文细黑" >Validate</label>
							<div >
								<input type="text" name="codeImg"  placeholder="input validate" class="form-control" style="BACKGROUND-COLOR: transparent;" class="layui-input">
								<img src="./getCodeImg " id="empImgContent"   style="height:40px"><i class="layui-icon layui-icon-refresh layui-anim-scaleSpring" id="refreshImage" style="font-size: 30px; color: teal ;bottom: auto " ></i>
						<script> $("#refreshImage").click(function(){
                            $("#empImgContent").attr('src', "./getCodeImg" +"?t=" + Math.random());
							// 刷新验证码 这样给图片地址拼接一个随机数，用js重新给 img 的 src 赋值，okay，scr发生变化就会重新加载
                        });</script>
							</div>
						</div>

					<div class="row">
						<div class="col-sm-12">
							<div class="signin-password">
								<div class="awesome-checkbox-list">
									<ul class="unstyled centered">

										<li>
										    <input class="styled-checkbox" id="styled-checkbox-2" name="checkbox2"  type="checkbox" value="value2">
										    <label for="styled-checkbox-2">remember Me</label>
										</li>

										<li>
										    <a href="#">Forgot email or password ?</a>
										</li>

									</ul>
								</div><!--/.awesome-checkbox-list -->
							</div><!--/.signin-password -->
						</div><!--/.col -->
					</div><!--/.row -->

					<div class="row">
						<div class="col-sm-12">
							<div class="signin-footer">
								<button type="submit" class="btn signin_btn" data-toggle="modal" data-target=".signin_modal">
								sign in
								</button>
								<p>
									Don’t have an Account ?
									<a href="signup">register</a>
								</p>
							</div><!--/.signin-footer -->
						</div><!--/.col-->
					</div><!--/.row -->
					</form><!--/form -->
				</div><!--/.sign-content -->


			</div><!--/.container -->

		</section><!--/.signin -->
		
		<!-- signin end -->

		<!--footer copyright start -->
		<footer class="footer-copyright">
			<div id="scroll-Top">
				<i class="fa fa-angle-double-up return-to-top" id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
			</div><!--/.scroll-Top-->

		</footer><!--/.hm-footer-copyright-->
		<!--footer copyright  end -->


		 <!-- Include all js compiled plugins (below), or include individual files as needed -->

		<script src="assets/js/jquery.js"></script>
        
        <!--modernizr.min.js-->
        <script src="assets/js/modernizr.min.js"></script>
		
		<!--bootstrap.min.js-->
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- bootsnav js -->
		<script src="assets/js/bootsnav.js"></script>
		
		<!-- jquery.sticky.js -->
		<script src="assets/js/jquery.sticky.js"></script>
		<script src="assets/js/jquery.easing.min.js"></script>
		
        
        <!--Custom JS-->
        <script src="assets/js/custom.js"></script>
        <%--放在后面,编码问题--%><%--验证输入js,注意编码--%>
        <script src="./assets/js/jquery.validate.js" type="text/javascript" charset="utf-8"></script>
        <script src="./assets/js/validationCheck.js" type="text/javascript" charset="utf-8"></script>


    </body>
	
</html>