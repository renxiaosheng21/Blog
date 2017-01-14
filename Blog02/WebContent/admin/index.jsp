<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
<title>后台管理中心</title>
</head>
<frameset rows="10%,90%">
	<frame src="top.jsp" noresize="noresize"  name="topFrame" scrolling="no" marginwidth="0" marginheight="0"/>
    
    <frameset cols="200,*"  rows="560,*" id="frame">
		<frame src="left.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no"/>
		<frame src="right.jsp" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" />
	</frameset>
<noframes>

<body>
您的浏览器无法处理框架！
</body>
</noframes>
</frameset> 
</html>
