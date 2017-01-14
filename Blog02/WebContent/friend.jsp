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
	<title>我的好友</title>
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
							我的好友&emsp;&emsp;
							<a href="addfriend.jsp">
								<input type="button" value="添加">
							</a>
						</h3>
					</div>
					<div class="m_content">
					    <div class="leave_mes">
							
						</div>
						<%
							DBManager dbm = new DBManager();
							Connection conn = dbm.getConnection();
							String queryName = request.getParameter("queryName");
							String sql = "select * from friend where tel='"+session.getAttribute("tel")
							+"' or friendTel='"+session.getAttribute("tel")+"'";

							PreparedStatement pstmt = conn.prepareStatement(sql);
							ResultSet rs = pstmt.executeQuery();
							
							Hashtable<String,String> hs=new Hashtable<String,String>();

							while (rs.next()) {
								String id = rs.getString("id");
								String my=(String)session.getAttribute("tel");
								String tel="";
								if(rs.getString("tel").equals(my)){
								   tel=rs.getString("friendTel");
								}else{
								   tel=rs.getString("tel");
								}
								if(hs.containsKey(tel)){
								  continue;
								}
								
								hs.put(tel,"");
								
						%>
						<div class="leave_mes">
						
							<div class="mes_con">
							<%
							    String imgsql="select * from users where tel='"+tel+"'";
							    PreparedStatement pstmt1 = conn.prepareStatement(imgsql);
						        ResultSet rs1 = pstmt1.executeQuery();
						        while(rs1.next()){
						        
						     %>
						      <table>
						         <tr>
						          
						           <td>昵称：<%=rs1.getString("name") %></td>
						         </tr>
						          <tr>
						           
						           <td>性别：<%=rs1.getString("sex") %></td>
						         </tr>
						          <tr>
						          
						           <td>手机：<%=rs1.getString("tel") %></td>
						         </tr>
						          <tr>
						           
						           <td>年龄：<%=rs1.getString("age") %></td>
						         </tr>
						      </table>
						      
						      <a href="DelFriendAction?tel=<%=rs1.getString("tel") %>">
								<input type="button" value="删除"/>
						      </a>
						       
						     <%   
						        }
						        if (rs1 != null)
									rs1.close();
							 %>
							 
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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
