<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>

<html>
<head>
	<title>회원가입</title>
	<meta charset="UTF-8">
</head>

<body>
	<form action="Login.jsp" method="post">
		<label>I D:	</label><input type="text" name="memberId" required><br>
		<label>P W:	</label><input type="password" name="memberPw" required><br>
		<input type="submit" value="가입">
	</form>
	
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("memeberID");
	String password = request.getParameter("memeberPw");
	
	boolean bExist = false;
	String filePath = application.getRealPath("HW_INF");
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
	
	String result = null;
	if(bExist){
		result = "FAIL";
	}else{
		try(PrintWriter writer = new PrintWriter(filePath, "UTF-8")){
			writer.println(id);
			writer.println(password);
			result = "TRUE";
		}catch(Exception e){
			result = "FAIL";
		}
	}
	
	response.sendRedirect("/Login.jsp");
	%>
</body>
</html>