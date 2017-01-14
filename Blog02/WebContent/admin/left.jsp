<%@ page language="java" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>

<html>
<head>
	<title>管理页面</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">  
</head>
<body bgcolor="#EEF2FB">
<table>
	<tr>
		<td width="182" valign="top">
			<br>
			<div class="content">
				<ul class="MM">
					<li>
						<a href="<%=path %>/admin/users/list.jsp" target="main">用户信息</a>
					</li>
				</ul>
			</div>
			<br>
			<div class="content">
				<ul class="MM">
					<li>
						<a href="<%=path %>/admin/blog/list.jsp" target="main">博文管理</a>
					</li>
				</ul>
				
			</div>
			<br>
			<div class="content">
				<ul class="MM">
					<li>
						<a href="<%=path %>/admin/ping/list.jsp" target="main">评论管理</a>
					</li>
				</ul>
			</div>
			
			<br>
			<div class="content">
				<ul class="MM">
					<li>
						<a href="<%=path %>/admin/message/list.jsp" target="main">留言管理</a>
					</li>
				</ul>
			</div>
	    </td>
   </tr>
</table>
</body>
</html>
 