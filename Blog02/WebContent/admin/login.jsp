<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
 <meta charset="UTF-8">
<title>登录</title>
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css">

  <link rel='stylesheet' href='css/jquery-ui.css'>
	<link rel='stylesheet prefetch' href='css/bootstrap.min.css'>

    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />

    <script src="js/modernizr.js"></script>
    <script>
		 function check1()
		 {               
		     if(document.ThisForm.username.value=="")
			 {
			 	alert("请输入用户名");
				document.ThisForm.username.focus();
				return false;
			 }
			 if(document.ThisForm.userpwd.value=="")
			 {
			 	alert("请输入密码");
				document.ThisForm.userpwd.focus();
				return false;
			 }
			return true;
		 }
	 </script>
</head>


<body class="login-page">
<div class="login-form">
		<div class="login-content">
			<FORM action="../LoginAction" name="ThisForm" method="post">
				<div class="form-group">
					<img src="images/logo.png" width="279" height="68">
				</div>
				
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-user"></i>
						</div>
						<input type="text" class="form-control" name="username" placeholder="管理员账号" autocomplete="off" />
					</div>

				</div>

				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-key"></i>
						</div>
						<input type="password" class="form-control" name="userpwd" id="password" placeholder="密码" autocomplete="off" />
					</div>

				</div>
				
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block btn-login" value = "登录" onClick="return check1()">
						<i class="fa fa-sign-in"></i>
						登录
					</button>
				</div>

			<!-- 	<div class="form-group" >
					<a href="register.jsp">
					<button type="button" class="btn btn-default btn-lg btn-block google-button">
						&#160;&#160;
                    |  Create Account
					</button>
					</a>
				</div> -->
		
			</form>

			<div style="text-align:center;clear:both;">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>

</div>
</div>
  <script src='js/jquery_and_jqueryui.js'></script>
</body>
</html>