package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**
 * ªÿ∏¥¡Ù—‘
 */
public class ReplyMsgAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		DBManager dbm = new DBManager();

		String reply=request.getParameter("reply");
		String id=request.getParameter("id");
		if(reply!=null){
			reply=DBManager.TextToHtml(reply);
		}
		@SuppressWarnings("deprecation")
		String date=new Date().toLocaleString();
		Object user=request.getSession().getAttribute("user");
		
		String appuser="";
		if(user!=null && appuser.toString()!=null){
			appuser=(String) user;
		}
		
		String sql = "update message set reply='"+reply+"',replydate='"+date+"' where id="+id;

		Statement stat = null;
		Connection conn=null;
		try {
			conn=dbm.getConnection();
			stat = conn.createStatement();
			System.out.println(sql);
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
	    response.sendRedirect("admin/message/list.jsp");
		out.flush();
		out.close();
	}

}
