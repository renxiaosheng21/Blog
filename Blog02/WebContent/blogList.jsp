<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.biyeseng.db.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";   //path=/blog  bashpath=http://localhost:8451/blog/
%>
<head>
	<base href="<%=basePath%>"></base>
	
	<title>博客浏览</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/picture_preview.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="js/tab.js"></script>
	<script type="text/javascript" src="<%=path%>/js/popup.js"></script>
	<script src="js/jquery-1.4.2.js" type="text/javascript"></script>
	<script src="js/picture_preview.js" type="text/javascript"></script>
	
	<script>
		$(document).ready(function() {
			$("img[id^='preImg']").fancyZoom( {
				scaleImg : true,
				closeOnClick : true
			});
		});
	</script> 
</head>
<html>
<body>
  <div class="page">
	<div class="page_con">
		<jsp:include flush="true" page="top.jsp"></jsp:include>
			<div class="sub_main">
				<div class="sub_maincon">
					<div class="sub_mainbox clearfix">
						<div class="m_title2">
							<h3>最新博文</h3>
						</div>
						<div>
							<ul>
								<%
									DBManager dbm = new DBManager();
									Connection conn = dbm.getConnection();
									String queryName = request.getParameter("queryName");
									String sql = "select top 10 * from blog  order by date desc";

									PreparedStatement pstmt = conn.prepareStatement(sql);
									ResultSet rs = pstmt.executeQuery();

									while (rs.next()){
										String id = rs.getString("id");//博客的id：日期加手机号
								%>
								<li>
									<%=rs.getString("name") %>
									&emsp;
									<%=rs.getString("date") %>
									<a href="getBlog.jsp?id=<%=id%>">
										<%=rs.getString("title")%>
									</a>
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
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
