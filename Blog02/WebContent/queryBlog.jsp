<%@ page language="java" import="java.util.*,java.sql.*,com.biyeseng.db.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>"></base>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>我的动态</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/tab.js"></script>
	<script type="text/javascript" src="<%=path%>/js/popup.js"></script>
	<link href="css/picture_preview.css" rel="stylesheet" type="text/css" />
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

<body>

<div class="page">
	<div class="page_con">
		<jsp:include flush="true" page="top.jsp"></jsp:include>
		<div class="sub_main">
			<div class="sub_maincon">
				<div class="sub_mainbox clearfix">
					<div class="m_title2">
						<h3>
							搜索结果
						</h3>
					</div>

					 <div class="article_listbox">
						<ul>
							<%
								DBManager dbm = new DBManager();
								Connection conn = dbm.getConnection();
								String keywords = request.getParameter("keywords");
								String sql = "select * from blog where title like '%"+keywords+"%' or  info like '%"+keywords+"%' or  tag like '%"+keywords+"%' order by date desc";

								PreparedStatement pstmt = conn.prepareStatement(sql);
								ResultSet rs = pstmt.executeQuery();

								while (rs.next()) {
									String id = rs.getString("id");
							%>
							<li>
								<span class="time"><%=rs.getString("name") %> &nbsp;&nbsp;&nbsp;&nbsp;
								<%=rs.getString("date") %></span>
								<a href="getBlog.jsp?id=<%=id%>"><%=rs.getString("title")%></a>
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
