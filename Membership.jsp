<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>

<html>
<head>
	<title>회원가입</title>
	<meta charset="UTF-8">
</head>

<body>
	<form action="JoinMembership.jsp" method="post">
		<label>I D:	</label><input type="text" name="memberID" required="true"><br>
		<label>P W:	</label><input type="password" name="memberPW" required="true"><br>
		<input type="submit" value="가입">
	</form>
</body>
</html>