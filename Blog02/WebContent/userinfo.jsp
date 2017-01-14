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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<base href="<%=basePath%>"></base>
	<title>用户修改信息</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/tab.js"></script>
	<script type="text/javascript" src="<%=path%>/js/popup.js"></script>

	<script>
		function phonecheck(s) {
			if (isNaN(s) || s.length != 11) {
				alert("请输入正确手机号码！");
				return false;
			}
		    else
		    {
			    return true;
		    }
	    }

  </script>
</head>
<body>

<div class="page">
	<div class="page_con">
		<jsp:include flush="true" page="top.jsp"></jsp:include>
		<div class="sub_main">
			<div class="sub_maincon">
				<div class="sub_mainbox clearfix">
					<div class="m_border">
						<div class="m_title2">
							<h3>
								修改
							</h3>
						</div>
						<div class="m_content message_con">
							<form method="post"	action="ModUserFrAction" onsubmit="return phonecheck(document.all.tel.value)">
									<span class="red">注：带*号为必填项</span>
								
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<%
								   Object user= session.getAttribute("tel");
								   DBManager dbm = new DBManager();
								   Connection conn = dbm.getConnection();
								   String queryName = request.getParameter("queryName");
								   String sql = "select * from users where tel='"+user+"'";
								 
								   PreparedStatement pstmt = conn.prepareStatement(sql);
								   ResultSet rs = pstmt.executeQuery();

								   if (rs.next()) {
									  String id = rs.getString("id");
								 %>
									<tr>
										<td class="left_name">
											昵称：
										</td>
										<td>
											<input type="text" name="name"
												class="text_input text150" value="<%=rs.getString("name") %>"/>
											<span class="red">*</span>
										</td>
									</tr>
									<tr>
										<td class="left_name">
											密码：
										</td>
										<td>
											<input type="password" name="pwd"class="text_input text150" value="<%=rs.getString("pwd") %>"/>
											<span class="red">*</span>
										</td>
									</tr>
									<tr>
										<td class="left_name">
											性别：
										</td>
										<td>
											<span>
												<input type="radio" name="sex" 
														value="男" <%=rs.getString("sex").equals("男")?"checked":"" %>/>男
												</span>
												<span>
													<input type="radio" name="sex"
													    value="女" <%=rs.getString("sex").equals("女")?"checked":"" %>/>女
												</span>
										</td>
									</tr>

									<tr>
										<td class="left_name">
											年龄：
										</td>
										<td>
											<input type="text" name="age" class="text_input text150" 
												value="<%=rs.getString("age") %>"/>
										</td>
									</tr>

									<tr>
										<td class="left_name">
											电话：
										</td>
										<td>
											<input type="text" name="tel" class="text_input text150" 
												value="<%=rs.getString("tel") %>"/>
										</td>
									</tr>
									
									<tr>
										<td>
											&nbsp;
										</td>
										<td>
											<input type="image" name="button" src="images/ok.gif" />
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
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
