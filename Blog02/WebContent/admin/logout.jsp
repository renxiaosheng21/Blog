<%@ page contentType="text/html; charset=UTF-8" %>
<%@page session="true"%>
<%
	session.removeAttribute("user");
%>
<script>
      var win=window;
      while(win.parent!=window.top)
      {
      	win=win.parent;
      }
      win.parent.location.replace("login.jsp");  
</script>