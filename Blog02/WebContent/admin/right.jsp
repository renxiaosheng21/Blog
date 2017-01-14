<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/skin.css" rel="stylesheet" type="text/css" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
</head>
<body>
<body bgcolor="#EEF2FB">
	 <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" valign="top" background="images/mail_leftbg.gif">
				<img src="images/left-top-right.gif" width="17" height="29" />
			</td>
			<th  background="images/content-bg.gif">
				<div class="titlebt">
					欢迎使用博客系统
				</div>
			</th>
		</tr>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					这里是博客后台管理系统
					<br>
					<br>
					提示：
					<br>
					<br>
					&emsp;&emsp;这是用JSP开发的个人博客系统！
					<br>
					<br>
				</td>
			</tr>
				<tr>
					<td >
						<table width="100%" height="1" border="1" cellpadding="0"
							cellspacing="0" bgcolor="#CCCCCC">
						</table>
					</td>
				</tr>
		</table>
		
</body>
</html>