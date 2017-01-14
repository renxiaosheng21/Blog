<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理页面</title>

<link href="images/skin.css" rel="stylesheet" type="text/css">

</head>
<body bgcolor="#EEF2FB">
<table width="100%" height="50" cellpadding="0" class="admin_topbg">
  <tr>
    <td >
	    <table width="100%" >
	      <tr>
	        <th>管理员您好,感谢登陆使用！</th>
	        <td width="22%">
	        	<a href="<%=path %>/admin/logout.jsp">
	        	<img src="images/out.gif" alt="安全退出" ></a></td>
	      </tr>
	    </table>
    </td>
  </tr>
</table>
</body>
</html>
