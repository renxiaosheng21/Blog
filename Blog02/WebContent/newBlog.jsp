<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
	<base href="<%=basePath%>"></base> 
	<title>发布博客</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/tab.js"></script>
	<script type="text/javascript" src="<%=path%>/js/popup.js"></script>
	<script type="text/javascript" src="tiny_mce/tiny_mce.js"></script>
	
	 <script type="text/javascript">
		 tinyMCE.init({
				mode : "textareas",
				theme : "advanced",
				theme_advanced_toolbar_location : "top",
				theme_advanced_toolbar_align : "left",
			}); 
	</script> 
</head>

<body>
	<div class="page">
		<div class="page_con">
			<jsp:include flush="true" page="top.jsp"/>
			<div class="sub_main">
				<div class="sub_maincon">
					<div class="sub_mainbox clearfix">
						<div class="m_border">
							<div class="m_title2">
								<h3>
									新博文
								</h3>
							</div>
							<div class="m_content message_con">
								<form action="AddBlogAction" method="post">
									标题：
									<input type="text" name="title" id="title" class="text_input"
										size="50" />
									<br/>
									标签：
									<input type="text" name="tag" id="tag" class="text_input"
										size="30" />
									<br/>
									文章：
									<textarea rows="30" cols="100" name="info"></textarea>

									<br/>
									<input type="image" src="images/ok.gif" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
