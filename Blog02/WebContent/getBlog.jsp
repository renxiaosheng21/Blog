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
		<!----------------内容区开始-------------------->
		<div class="sub_main">
			<div class="sub_maincon">
				<div class="sub_mainbox clearfix">
					<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String id = request.getParameter("id");//id值可以是blogLost.jsp传的参数，
														      //也可以是AddPingAction.java传的参数，两者数值一致
						String sql = "select * from blog where id ='" +id+ "'";

						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						if (rs.next()) {
					%>
					<div class="m_title2">
						<h3 align="center">
							<%=rs.getString("title")%>
						</h3>

					</div>
					<div class="article_listbox">
						<div align="right">
							作者:
							<%=rs.getString("name")%>&emsp;
							发布日期:
							<%=rs.getString("date")%>
						</div>
						<br/>
						<%=rs.getString("info")%>
					</div>
					<div class="m_title2">
						<h3 align="center">
							评论
						</h3>

					</div>
					<div class="leave_mes">
						<%
							String imgsql = "select * from pinglun,users where pinglun.tel=users.tel and pinglun.did='"+id+"' ";
							PreparedStatement pstmt1 = conn.prepareStatement(imgsql);
							ResultSet rs1 = pstmt1.executeQuery();
							while (rs1.next()) {
						%>
						<div class="mes_con">
						<table>
							<tr>
								<td>
									<%=rs1.getString("info")%>
								</td>
							</tr>
							<tr>
								<td>
									<%=rs1.getString("name")%>&nbsp;
									<%=rs1.getString("date")%>
								</td>
							</tr>
						</table>
						
						</div>

						<%
							}
								if (rs1 != null)
									rs1.close();
						%>
						
						<%
							//只有已经登录过的用户才能进行评论，否则只能看
							String user = (String)session.getAttribute("name");
							if (user!=null) {
						%>
								<form action="AddPingAction" method="post">
									<h3>
										我要评论：
									</h3>
									<p>
										<input type="hidden" value="<%=id%>" name="did" /><!--did的值和id值一样在这里体现 -->
										<textarea name="info" cols="45" rows="5" class="text_mes">
										</textarea>
									</p>
									<p class="btn_box">
										<input type="submit" value="提交"	class="btn" />
									</p>
								</form>
						<%
							}
						%>

				</div>
				<%
					}
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				%>
			</div>
		</div>
	</div>
  </div>
</div>
	
</body>
</html>
