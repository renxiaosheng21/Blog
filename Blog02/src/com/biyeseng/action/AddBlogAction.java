package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**
 *添加博客文章
 */
public class AddBlogAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void destroy() {
		super.destroy();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
			
		DBManager dbm = new DBManager();
		
		
		@SuppressWarnings("deprecation")
		String date = new Date().toLocaleString();
		Object tel = request.getSession().getAttribute("tel");
		
		String title = request.getParameter("title");
		String info=request.getParameter("info");
		String tag=request.getParameter("tag");
		
		String teluser = "";
		if (tel != null && tel.toString() != null) {
			teluser = (String) tel;
		}
		Object name = request.getSession().getAttribute("name");
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String key=formatter.format(new Date())+teluser;
		
		Statement stat = null;
		Connection conn = null;
		try {
			conn = dbm.getConnection();
			stat = conn.createStatement();
				
		
		String insertdong="insert into blog(id,tel,title,info,date,tag,name) values('"+key+"','"+teluser+"','"+title+"','"+info+"','"+date+"','"+tag+"','"+name+"')";
		stat.execute(insertdong);
			
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
		out.println("<script>alert('发布成功！');window.location.href='myBlog.jsp'</script>");
	}


}
