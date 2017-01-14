package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;
import java.sql.*;

/**
 * 用户修改信息
 */
public class ModUserFrAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String tel = request.getParameter("tel");
	 
		DBManager dbm = new DBManager();
		String sql = "update users set pwd='"+pwd+"',sex='"+sex+"',age='"+age+"',tel='"+tel+"',name='"+name+"' where tel='"+tel+"'";

		Statement stat = null;
		Connection conn=null;
		try {
			conn=dbm.getConnection();
			stat = conn.createStatement();
			stat.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stat!=null)
					stat.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		out.println("<script>alert('用户信息修改成功！');");
		out.print("window.location.href='blogList.jsp'</script>");
	}
}
