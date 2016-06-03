<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("memberID");
String password = request.getParameter("memberPW");
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
	result = "FAILJOIN";
}else{
	try(PrintWriter writer = new PrintWriter(filePath, "UTF-8")){
		PrintWriter purchaseWriter = new PrintWriter(filePath_purchase, "UTF-8");
		writer.println(id);
		writer.println(password);
		writer.println(point);
		result = "SUCCESSJOIN";
	}catch(Exception e){
		result = "FAILJOIN";
	}
}
response.sendRedirect("Login.jsp?RESULT="+result);
%>