package com.biyeseng.action;

import java.io.IOException;
import java.sql.*;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**
 * 添加评论
 */
public class AddPingAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String info=request.getParameter("info");
		String did=request.getParameter("did");
		
		String tel=(String) request.getSession().getAttribute("tel");
		@SuppressWarnings("deprecation")
		String date = new Date().toLocaleString();
		
		DBManager dbm = new DBManager();
		String sql = "insert into pinglun values('"+did+"','"+tel+"','"+info+"','"+date+"')";

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
		response.sendRedirect("getBlog.jsp?id="+did);//必须是id
	}
}
