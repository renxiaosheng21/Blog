package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**
 *会员登录
 */
public class UserLogAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void init() throws ServletException {
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String tel = request.getParameter("tel");
		String userpwd = request.getParameter("pwd");

		DBManager dbm = new DBManager();
		boolean login = dbm.loginUsers(tel, userpwd);
		if(login){
			Connection conn = dbm.getConnection();
			String sql = "select * from users where tel='" + tel + "'";

			try{
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()){
					String name=rs.getString("name");
					//这两个session很重要，后面很多都用到name和tel这两个value值
					request.getSession().setAttribute("name", name);
					request.getSession().setAttribute("tel", tel);
				}
			}catch (Exception e){
				e.printStackTrace();
			}
			out.println("<script>");
			out.println("alert('登陆成功！');window.location.href='blogList.jsp'");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("alert('信息有误！');window.location.href='blogList.jsp'");
			out.println("</script>");
		}
	}
	
}
