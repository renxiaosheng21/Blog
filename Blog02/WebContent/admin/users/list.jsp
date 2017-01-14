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
	<title>管理</title>
	
	<LINK href="css/admin.css" type="text/css" rel="stylesheet">
	
</head>
<body bgcolor="#EEF2FB">
	<div id="printTable">
		<table  border="2" 	 align="center" >
			<tr bgcolor="#EEF4EA">
				<th height="24" colspan="10" background="admin/images/tbg.gif">
					<h3>用户信息列表</h3>
				</th>
			</tr>
			<tr align="center" bgcolor="#FAFAF1" height="22">
				 
				<td width="10%">
					ID
				</td>
				<td width="15%">
					昵称
				</td>
				<td width="10%">
					 密码	  
				</td>
				<td width="10%">
				             电话     
				</td>
				<td width="10%">
				          性别
				</td>
				<td width="10%">
				         年龄
				</td>
				<td width="10%">
					操作
				</td>
			</tr>

			<%
				DBManager dbm = new DBManager();
				Connection conn = dbm.getConnection();
				String queryName = request.getParameter("queryName");
				String sql = "select * from users";
				if (queryName != null) {
					sql = "select * from users where name like '%" + queryName
							+ "%'";
				}
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					String id = rs.getString("id");
			%>

			<tr align='center' bgcolor="#FFFFFF">
				<td><%=rs.getString("id")%>
				</td>
				<td><%=rs.getString("name")%>

				</td>
				<td align="left">
					<div align="center">
						<%=rs.getString("pwd")%>

					</div>
				</td>
				<td align="left">
					<div align="center">
						<%=rs.getString("tel")%>

					</div>
				</td>
				
				<td align="left">
					<div align="center">
						<%=rs.getString("sex")%>
					</div>
				</td>
				
				
				<td align="left">
					<div align="center">
						<%=rs.getString("age")%>

					</div>
				</td>
			 
				<td>
					<a href="DelUsersAction?id=<%=id %>">删除</a>
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