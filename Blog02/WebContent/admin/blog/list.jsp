<%@ page language="java" import="java.util.*,java.sql.*,com.biyeseng.db.*"
	pageEncoding="UTF-8"%>
<%@ page %>
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
	<title></title>
	<LINK href="css/admin.css" type="text/css" rel="stylesheet">

	<script type="text/javascript" src="<%=path%>/js/popup.js"></script>


</head>
<body leftmargin="8" topmargin="8" >

		<div id="printTable">
				<table width="98%" border="1" >
					<tr bgcolor="#EEF4EA">
						<th height="24" colspan="10" background="admin/images/tbg.gif">
							<h3>博客信息列表</h3>
						</th>
					</tr>
					<tr align="center" bgcolor="#FAFAF1" height="22">

						<td width="15%">
							发布者
						</td>
						<td width="14%">
							标题
						</td>
						<td width="34%">
							时间
						</td>
						<td width="10%">
							内容
						</td>

						<td width="10%">
							操作
						</td>
					</tr>

					<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String queryName = request.getParameter("queryName");
						String sql = "select *  from blog d,users u where d.tel=u.tel order by d.date desc";
						if (queryName != null && queryName.trim().length() > 0) {
							sql = "select *  from blog d,users u where d.tel=u.tel   and d.tel='"
									+ queryName + "' order by d.date desc";
						}
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()) {
							String id = rs.getString("id");
					%>

					<tr align='center' bgcolor="#FFFFFF">
						<td><%=rs.getString("name")%>(账号：<%=rs.getString("tel")%>)

						</td>
						<td align="left">
							<div align="center">
								<%=rs.getString("title")%>

							</div>
						</td>
						<td align="left">
							<div align="center">
								<%=rs.getString("date")%>
							</div>
						</td>

						<td align="left">
							<div align="center">
								<a href="admin/blog/blogList.jsp?id=<%=id%>">查看</a>
							</div>
						</td>

						<td>
							<a href="DelBlogAction?id=<%=id%>&type=back">删除</a>
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