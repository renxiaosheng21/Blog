package com.biyeseng.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**É¾³ýºÃÓÑ
 *
 */
public class DelFriendAction extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String tel = request.getParameter("tel");
		String totel=(String) request.getSession().getAttribute("tel");

		DBManager dbm = new DBManager();
		String sql = "delete from friend where tel='"+tel+"' and friendTel='"+totel+"'";
		String sql1 = "delete from friend where tel='"+totel+"' and friendTel='"+tel+"'";

		Statement stat = null;
		Connection conn = null;
		try {
			conn = dbm.getConnection();
			stat = conn.createStatement();
			stat.execute(sql);
			stat.execute(sql1);
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
		response.sendRedirect("friend.jsp");
		
	}

}
