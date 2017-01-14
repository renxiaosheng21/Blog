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


/**会员注册
 */
public class UserRegAction extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public static boolean isNumeric(String str){
	  for (int i = str.length();--i>=0;){ 
		  
		   if (!Character.isDigit(str.charAt(i))){
		    return false;
		   }
	  }
	  return true;
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String again_pwd=request.getParameter("again_pwd");
		String sex = request.getParameter("sex");
		String age =  request.getParameter("age");
		String tel = request.getParameter("tel");
		DBManager dbm = new DBManager();
		
		if(!isNumeric(tel)||tel.length()!=11){
			out.print("<script>");
			out.print("alert('请输入正确的手机号!!!');");
			out.print("window.location.href='registered.jsp'");
			out.print("</script>");
			return;
		}
		boolean isPwd=true;
		if(!pwd.equalsIgnoreCase(again_pwd)){
			isPwd=false;
		}
		if(pwd.length()<6||pwd.length()>10){
			out.print("<script>");
			out.print("alert('密码必须是6-10位的');");
			out.print("window.location.href='registered.jsp'");
			out.print("</script>");
			return;
		}
		if(isPwd==false){
			out.print("<script>");
			out.print("alert('两次密码须一致');");
			out.print("window.location.href='registered.jsp'");
			out.print("</script>");
			return;
		}
		if( !isNumeric(age)||Integer.parseInt(age)>100||Integer.parseInt(age)<0){
			out.print("<script>");
			out.print("alert('请输入合法年龄');");
			out.print("window.location.href='registered.jsp'");
			out.print("</script>");
			return;
		}
		String sql = "insert into users(name,pwd,sex,age,tel)  "
				+ "values('"+name+"','"+pwd+ "','" + sex + "','" + age + "','" + tel + "')";

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
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		out.println("<script>alert('用户注册成功！');");
		out.println("window.location.href='blogList.jsp'</script>");
		
	}
}
