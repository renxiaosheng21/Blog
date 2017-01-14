<%@ page language="java" import="java.util.*,java.sql.*,com.biyeseng.db.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<base href="<%=basePath%>"></base>
	<title>照片</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body >
<table width="80%" border="0" >
	<tr>
		<td bgcolor="#FFFFFF">
		<input type="hidden" name="id" value="<%=request.getParameter("id") %>"/>
			
			<%
				DBManager dbm = new DBManager();
				Connection conn = dbm.getConnection();
				String ID=request.getParameter("id");
				
				String sql = "select * from blog where id='"+ID+"'";

				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {
					String id = rs.getString("id");
					out.println(rs.getString("info"));
		 
				}
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			%>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF">
			<div align="center">
				<input type="button" onclick="window.history.back()" name="Submit2" value="返回"/>
			</div>
		</td>
	</tr>
</table>
		 
	</body>
</html>
