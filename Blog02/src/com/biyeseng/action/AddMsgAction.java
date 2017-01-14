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
 *¡Ù—‘
 */
public class AddMsgAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		
		DBManager dbm = new DBManager();

		String msg=request.getParameter("msg");
		if(msg!=null){
			msg=DBManager.TextToHtml(msg);
		}
		@SuppressWarnings("deprecation")
		String date=new Date().toLocaleString();
		Object user=request.getSession().getAttribute("name");
		String appuser="";
		if(user!=null && appuser.toString()!=null){
			appuser=(String) user;
		}
		
		String sql = "insert into message(msg,appuser,date)  values('"+msg+"','"+appuser+"','"+date+"')";

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
		response.sendRedirect("message.jsp");
	}
}
