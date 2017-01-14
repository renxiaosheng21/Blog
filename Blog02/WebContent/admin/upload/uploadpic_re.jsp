<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
%>
<%
    
    String newFile1Name=null;
    String file_name=null;
    
	SmartUpload mySmartUpload = new SmartUpload();

	//初始化上传
	mySmartUpload.initialize(pageContext);

	//只允许上载此类文件
	mySmartUpload.upload();
	
	try 
	{
	   /* com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0); */
	   File myFile = mySmartUpload.getFiles().getFile(0);
	   if (myFile.isMissing())
	   {
		  out.println("<script language=javascript>");
		  out.println("alert('必须选择图片！');");
		  out.println("history.back(-1);</script>");
		  return;
	   } 
	   else 
	   {
		   int file_size = myFile.getSize(); //取得文件的大小 (单位是b) 
		   file_name=myFile.getFileName();
		   //System.out.println("文件大小："+file_size+"文件名称："+file_name);
           newFile1Name=new Date().getTime()+file_name.substring(file_name.indexOf("."));
			
		   String saveurl = request.getSession().getServletContext().getRealPath("upload");
			
		   saveurl = saveurl+"/"+newFile1Name;
		   myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);
		} 
	  } 
	  catch (Exception e)
	  {
	    e.toString();
	  }
%>

<script>
    var myul=window.parent.document.getElementById("mypicuploadul");
    window.parent.addP('upload/<%= newFile1Name%>');
    window.parent.popclose();
</script>
