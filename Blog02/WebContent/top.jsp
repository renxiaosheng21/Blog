<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div id="top">
	<div class="banner">
		<img src="images/top.jpg" />
	</div>
	<div id="nav">
		<ul>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>
				<a href="blogList.jsp">博客浏览</a>
			</li>
			<li>
				<a href="myBlog.jsp" onclick="return checkLogin()">我的博客</a>
			</li>

			<li>
				<a href="friend.jsp" onclick="return checkLogin()">我的好友</a>
			</li>

			<li>
				<a href="message.jsp" onclick="return checkLogin()">留言</a>
			</li>
			<li>  
				<a href="admin/login.jsp">后台管理 </a>
			</li> 
		</ul>
	</div>
	<!----------------主导航菜单结束-------------------->
</div>
<!----------------下面是内容区-------------------->
<div class="login_con">
	<%
		String user = (String)session.getAttribute("name");
		boolean login = false;
		//如果user为空则显示登录页面，否则直接显示登录的用户
		if (user!=null) {
			login=true;
	%>
			欢迎你：<%=user%>&emsp; &emsp; 
			<a href="logout.jsp" class="zc">注销</a>&emsp; 
			<a href="userinfo.jsp" class="zc">我的信息</a>&emsp;
			<a href="newBlog.jsp" class="zc">发布博文</a> 
	<%
		}
		else{
	%>
			<form action="UserLogAction" method="post" >
				账号： 
				<input type="text" name="tel"/> 
				 
				密码：
				<input type="password" name="pwd"/> 
				 
			    <input type="submit" value="登录" />
			    &emsp;
				<a href="registered.jsp">
					<input type="button" value="注册" > 
				</a>
			</form>
	<%
		 }
	%>
	
</div>

<script type="text/javascript">
	function checkLogin() {
		var islogin = "<%=login%>"
	
		if (islogin == 'false') {
			alert("请登录后使用");
			return false;
		} else {
			return true;
		}
	
	}
</script>
&emsp;
<div align="center">
	<form method="post" action="queryBlog.jsp" >
	<span> 
		<input type="text" name="keywords" class="text_input" size="50"/> 
	</span>
	<span> 
		<input type="submit" name="button"	value="搜索博文" class="denlu" />
    </span>	
   	
	</form></div>
	
<html>
<body>
</body>
</html>
