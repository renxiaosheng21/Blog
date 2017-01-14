<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>注册</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="tiny_mce/style.css" media="screen" type="text/css" />
</head>
<body>
<h1 class="register-title">注册</h1>
<form method="post"	action="UserRegAction" class="register" >
  <div class="register-switch">
    <input type="radio" name="sex" value="女" id="sex_f" class="register-switch-input" >
    <label for="sex_f" class="register-switch-label">女</label>
    <input type="radio" name="sex" value="男" id="sex_m" class="register-switch-input" checked>
    <label for="sex_m" class="register-switch-label">男</label>
  </div>
  <input type =text  class="register-input" name="tel" placeholder="账号（手机号）">
  <input type="password" class="register-input" name="pwd" placeholder="密码">
  <input type="password" class="register-input" name="again_pwd" placeholder="确认密码">
  <input type=text class="register-input" name="name" placeholder="昵称">
  <input type =text class="register-input" name="age" placeholder="年龄">
  <input type =submit class="register-button" value = "注册" >
  
  <a href="blogList.jsp">
  	<input type="button" value="返回登录" class="register-button">
  </a>
</form>
<div style="text-align:center;clear:both;">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>
</body>
</html> 