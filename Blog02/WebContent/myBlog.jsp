<%@ page language="java" import="java.util.*,java.sql.*,com.biyeseng.db.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
	<base href="<%=basePath%>"></base>
	<title>我的动态</title>
	<link href="css/picture_preview.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="js/tab.js"></script>
	<script type="text/javascript" src="<%=path%>/js/popup.js"></script>
	<script src="js/jquery-1.4.2.js" type="text/javascript"></script>
    <script src="js/picture_preview.js" type="text/javascript"></script>
    <script>
		$(document).ready(function(){
			$("img[id^='preImg']").fancyZoom({scaleImg: true, closeOnClick: true});
		});
	 </script>
</head>

<body>
<div class="page">
	<div class="page_con">
		<jsp:include flush="true" page="top.jsp"></jsp:include>
		<!----------------内容区开始-------------------->
		<div class="sub_main">
			<div class="sub_maincon">
				<div class="sub_mainbox clearfix">
					<div class="m_title2">
						<h3>
							我的博客
						</h3>
					</div>
					<div class="article_listbox">
						<ul>
							<%
								DBManager dbm = new DBManager();
								Connection conn = dbm.getConnection();
								String queryName = request.getParameter("queryName");
								String tel=(String)session.getAttribute("tel");
								String sql = "select * from blog where tel ='"+tel+"' order by date desc";

								PreparedStatement pstmt = conn.prepareStatement(sql);
								ResultSet rs = pstmt.executeQuery();

								while (rs.next()){
									String id = rs.getString("id");
							%>
							<li>
								<span class="time">
									<%=rs.getString("name") %>&emsp;
									<%=rs.getString("date") %>&emsp;
									<a href="DelBlogAction?id=<%=id %>">
										<font color="red">删除博文</font>
									</a>
								</span>
								<a href="getBlog.jsp?id=<%=id%>">
								<%=rs.getString("title")%></a>
							</li>
							<%
								}
								if (rs != null)
									rs.close();
								if (pstmt != null)
									pstmt.close();
								if (conn != null)
									conn.close();
							%>
						</ul>
					</div>
					<div class="m_content">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
