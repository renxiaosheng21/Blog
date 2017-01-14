<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.biyeseng.db.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
	<base href="<%=basePath%>"></base>
	<title>添加好友</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/tab.js"></script>
</head>
<body>
<div class="page">
	<div class="page_con">
		<jsp:include flush="true" page="top.jsp"></jsp:include>
		<div class="sub_main">
			<div class="sub_maincon">
				<div class="sub_mainbox clearfix">
					<div class="m_title2">
						<h3>
							添加好友
						</h3>
					</div>
					<div class="article_listbox">
						<ul>
							<%
								DBManager dbm = new DBManager();
								Connection conn = dbm.getConnection();
								String queryName = request.getParameter("queryName");
								String sql = "select * from users where tel !='"+session.getAttribute("tel")+"'";

								PreparedStatement pstmt = conn.prepareStatement(sql);
								ResultSet rs = pstmt.executeQuery();

								while (rs.next()) {
									String id = rs.getString("id");
							%>
							<li>
									<a href="AddFriendAction?id=<%=id%>&friendTel=<%=rs.getString("tel")%>">
										<input type="button" value="添加"/>
									</a> 
									&emsp;&emsp;
									<%=rs.getString("name")%>
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
