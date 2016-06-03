<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
<% String result=request.getParameter("RESULT");%>

<html>
<head>
	<title>WP3_201402377_예부해</title>
	<meta charset="UTF-8">
</head>
<body>
	<form action="userInfo.jsp" method="post">
		<label>I D:	</label><input type="text" name="id"><br>
		<label>P W:	</label><input type="password" name="pw"><br>
		<label><input type="submit" name="loginButton" value="로그인">
	</form>
	<form action="Membership.jsp" method="post">
		<input type="submit" name="JoinMembershipButton" value="회원가입">
	</form>
	
	<%
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter p = response.getWriter();
		if(result != null){
			p.println("<script type=\"text/javascript\">");
			if(result.equals("SUCCESSJOIN"))
				p.println("alert('회원가입 성공')");
			else if(result.equals("FAILJOIN"))
				p.println("alert('존재하는 id')");
			else
				p.println("alert('id와 pw가 일치하지 않습니다')");
			p.println("location='Login.jsp';");
			p.println("</script>");
		}
	%>
	
</body>
</html>