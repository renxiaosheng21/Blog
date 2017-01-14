package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**
 * É¾³ý²©¿Í
 */
public class DelBlogAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");

		DBManager dbm = new DBManager();
		String sql = "delete from blog where id='"+id+"'";
		String sqlping = "delete from pinglun where did='"+id+"'";
	 

		Statement stat = null;
		Connection conn = null;
		try {
			conn = dbm.getConnection();
			stat = conn.createStatement();
			stat.execute(sql);
			stat.execute(sqlping);
			 
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
		String type=request.getParameter("type");
		if(type!=null&&type.trim().length()>0&&type.equals("back")){
			response.sendRedirect("admin/dong/list.jsp");
		}else{
		response.sendRedirect("myBlog.jsp");
		}
		out.flush();
		out.close();
	}
}
