<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("memeberID");
String password = request.getParameter("memeberPw");
int point = 50000;
	
boolean bExist = false;
String filePath = application.getRealPath("HW_INF");
String filePath_purchase = application.getRealPath("HW_INF");
File directory = new File(filePath);
	
File[] files = directory.listFiles();
	
if(files != null){
	for(File file : files)
	{
		if(file.getName().equals(id + ".txt"))
		{
			bExist = true;
			break;
		}
	}
}
	
filePath = application.getRealPath("HW_INF/" + id + ".txt");
filePath_purchase = application.getRealPath("HW_INF/" + id + "_purchase.txt");
	
String result = null;
if(bExist){
	result = "FAIL";
}else{
	try(PrintWriter writer = new PrintWriter(filePath, "UTF-8")){
		writer.println(id);
		writer.println(password);
		writer.println(point);
		result = "TRUE";
	}catch(Exception e){
		result = "FAIL";
	}
}
response.sendRedirect("Login.jsp?RESULT="+result);
%>