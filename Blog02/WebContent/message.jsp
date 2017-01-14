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
	<title>留言</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/tab.js"></script>
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
							留言
						</h3>
					</div>
					<div class="m_content">
					
					<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String queryName = request.getParameter("queryName");
						String sql = "select * from message";
						 
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()){
							String id = rs.getString("id");
					%>
					<div class="leave_mes">
						<p class="mes_info">
							<span class="reply"> </span>
							<span>留言人：<%=rs.getString("appuser") %></span>
							<span>时间：<%=rs.getString("date") %></span>
						</p>
						<div class="mes_con">
							<%=rs.getString("msg") %>
							<br>
							<font color="red">回复：<%=rs.getString("reply")!=null?rs.getString("reply"):""%></font>
							<br>
							<font color="red">回复时间：<%=rs.getString("replydate")!=null?rs.getString("replydate"):""%></font>
						</div>
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
						
					<div class="message_con">
						 <%
						 //只有登录进去的人才能进行留言
						    String user= (String)session.getAttribute("name");
						    if(user!=null){
						 %>
						<form method="post" action="AddMsgAction">
								<h3>
									我要留言：
								</h3>
								<p>
									<textarea name="msg" cols="45" rows="5"	class="text_mes">
									</textarea>
								</p>
								<p class="btn_box">
									<input type="submit" name="button2" value="提交"	class="btn" />
								</p>
						</form>
						<%} %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
