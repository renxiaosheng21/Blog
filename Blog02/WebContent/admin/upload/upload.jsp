<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
 <head>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
  <script>
      function check()
      {
          if(document.formAdd.fujian.value=="")
          {
              alert("请选择文件");
              return false;
          }
          return true;
      }
  </script>
</head>
  
<body>
    <form action="<%=path %>/upload/upload_re.jsp" name="formAdd" method="post"  enctype="multipart/form-data">
        <input type="file" name="fujian" id="fujian" onKeyDown="javascript:alert('此信息不能手动输入');return false;" />
        <input type="submit" value="提交" onclick="return check()"/>
     </form>
</body>
</html>
