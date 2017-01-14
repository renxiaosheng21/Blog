<%@ page import="java.util.*" pageEncoding="UTF-8"%>
<html>
<body>
<%
   session.invalidate();
   response.sendRedirect("blogList.jsp");
%>
</body>
</html>