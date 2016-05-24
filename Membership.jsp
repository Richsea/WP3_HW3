<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>

<html>
<head>
	<title>회원가입</title>
	<meta charset="UTF-8">
</head>

<body>
	<form action="Login.jsp" method="post">
		<label>I D:	</label><input type="text" name="memberId"><br>
		<label>P W:	</label><input type="password" name="memberPw"><br>
		<input type="submit" value="가입" onclick="location.href='http://52.79.133.205:8080/WP3_HW3/Login.jsp';">
	</form>
	
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
	PrintWriter p = response.getWriter();
	
	if(id == null){
		p.println("<script type=\"text/javascript\">");
		p.println("alert('id를 입력하세요')");
		p.println("location='Membership.jsp';");
		p.println("</script>");
	}else if(password == null){
		p.println("<script type=\"text/javascript\">");
		p.println("alert('pw를 입력하세요')");
		p.println("location='Membership.jsp';");
		p.println("</script>");
	}else{
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
	}
	%>
</body>
</html>