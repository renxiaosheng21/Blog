<%@ page language="java"
	import="java.util.*,java.sql.*,com.biyeseng.db.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>留言管理</title>
	<LINK href="css/admin.css" type="text/css" rel="stylesheet">
	
</head>
<body leftmargin="8" topmargin="8" >

	<div id="printTable">
		<table width="98%" border="1" >
			<tr bgcolor="#EEF4EA">
				<th height="24" colspan="10" background="admin/images/tbg.gif">
					<h3>留言信息列表</h3>
				</th>
			</tr>
			<tr align="center" bgcolor="#FAFAF1" height="22">
				<td width="6%">
					ID
				</td>
			 
				<td width="20%">
				          内容
				</td>
				
				<td width="20%">
				      日期
				</td>
				
				<td width="20%">
				     发布人
				</td>

				<td width="10%">
					操作
				</td>
			</tr>

			<%
				DBManager dbm = new DBManager();
				Connection conn = dbm.getConnection();
				String queryName = request.getParameter("queryName");
				String sql = "select * from message";
			 
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					String id = rs.getString("id");
			%>

			<tr align='center' bgcolor="#FFFFFF">
				<td><%=id%>
				</td>
			 
				<td align="left">
					<div align="center">
						<%=rs.getString("msg")%>
					</div>
				</td>
				
				<td align="left">
					<div align="center">
						<%=rs.getString("date")%>
					</div>
				</td>
				
				<td align="left">
					<div align="center">
						<%=rs.getString("appuser")%>
					</div>
				</td>
			 
				<td>
					 <a href="admin/message/reply.jsp?id=<%=id %>">回复</a>|
					 <a href="DelMsgAction?id=<%=id %>">删除</a>
				</td>
			</tr>

			<%
				}
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			%>

		</table>
	</div>

</body>
</html>