<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
<% String result=request.getParameter("RESULT");%>

<html>
<head>
	<title>TP3_201402377_예부해</title>
	<meta charset="UTF-8">
</head>
<body>
	<form action="userInfo.jsp" method="post">
		<label>I D:	</label><input type="text" name="id"><br>
		<label>P W:	</label><input type="password" name="pw"><br>
		<label><input type="submit" name="loginButton" value="로그인"><input type="button" name="loginButton" value="회원가입" onclick="location.href='http://52.79.133.205:8080/WP3_HW3/Membership.jsp';">
	</form>
	
	<%
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter p = response.getWriter();
		if(result != null){
			p.println("<script type=\"text/javascript\">");
			if(result.equals("TRUE"))
				p.println("alert('회원가입 성공')");
			else
				p.println("alert('존재하는 id')");
			p.println("location='Login.jsp';");
			p.println("</script>");
		}
	%>
	
</body>
</html>