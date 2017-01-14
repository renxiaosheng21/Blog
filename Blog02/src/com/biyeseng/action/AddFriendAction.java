package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**
 *添加好友
 */
public class AddFriendAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String friendTel = request.getParameter("friendTel");
		

		String user = (String)request.getSession().getAttribute("tel");

		String appuser = "";
		if (user != null && appuser.toString() != null) {
			appuser=user;
		}

		DBManager dbm = new DBManager();
		String sql="insert into friend (tel,friendTel) values('"+appuser+"','"+friendTel+"')";

		Statement stat = null;
		Connection conn = null;
		try {
			conn = dbm.getConnection();
			stat = conn.createStatement();

			stat.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stat != null)
					stat.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		out.println("<script>alert('添加好友成功！');");
		out.println("window.location.href='friend.jsp'</script>");
	}
}
