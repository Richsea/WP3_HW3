<%@page contentType="text/html; chaset=UTF-8"%>
<%@page import="java.io.*"%>
<% String getUserInfo=request.getParameter("USERINFO");%>

<html>
<head>
	<meta charset="UTF-8">
	<link href="stylesheet.css" rel="./stylesheet/index.css" type="text/css"></link>
</head>
<body>
	<section>
	
	
	</section>
	
	<%
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter p = response.getWriter();
		if(getUserInfo != null){
			p.println("<script type=\"text/javascript\">");
			if(getUserInfo.equals("SUCCESSJOIN"))
				p.println("alert('market.jsp')");
			else if(getUserInfo.equals("FAILJOIN"))
				p.println("alert('market.jsp')");
			else
				p.println("alert('market.jsp')");
			p.println("location='Login.jsp';");
			p.println("</script>");
		}
	%>
</body>
</html>