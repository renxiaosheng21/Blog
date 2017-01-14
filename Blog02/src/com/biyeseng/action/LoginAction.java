package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**
 *管理员登录
 */
public class LoginAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		this.doPost(request, response);
		out.close();
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username=request.getParameter("username");
		String userpwd=request.getParameter("userpwd");
		
		DBManager dbm=new DBManager();
		boolean login=dbm.login(username, userpwd);
		if(login){
		   request.getSession().setAttribute("user", username);
		   response.sendRedirect("admin/index.jsp");
			
		}else{
			out.println("<script>alert('用户名或密码有误！');");
			out.println("window.location.href='admin/login.jsp'</script>");
		}
	}

}
