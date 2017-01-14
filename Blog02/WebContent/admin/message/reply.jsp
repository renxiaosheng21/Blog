<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">

	<title>添加</title>

	<META http-equiv=Content-Type content="text/html; charset=UTF-8">
	<LINK href="css/admin.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
	 
</head>

<body >
	<form action="ReplyMsgAction" method="post">
		<table  border="1" align="center" >
			<tr bgcolor="#EEF4EA">
				<th height="24" colspan="10" background="admin/images/tbg.gif">
					<h3>留言信息回复</h3>
				</th>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF">
					<div align="right" >
						 回复内容：
					</div>
				</td>
				<td bgcolor="#FFFFFF">
					<input type="hidden" name="id" value="<%=request.getParameter("id") %>"/>
					<textarea rows="10" cols="80"  name="reply"></textarea>
				</td>
			</tr>
			 
			<tr>
				<td colspan="2" bgcolor="#FFFFFF">
						<div align="center">
							<input type="submit" value="提交">
							<input type="reset"  value="重置">
						</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
