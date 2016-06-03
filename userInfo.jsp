<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>

<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		boolean bExist = false;
		File directory = new File(filePath);
		
		File[] files = directory.listFiles();
		
		if(files != null){
			for(File file : files)
			{
				if(file.getName().equals(name+".txt"))
				{
					bExist true;
					break;
				}
			}
		}
		
		String result = null;
		
		PrintWriter p = response.getWriter();
		if(bExist){
			filePath = application.getRealPath("HW_INF/" + id + ".txt");
			try(BufferedReader reader = new BufferedReader(new FileReader(filePath))){
				String checkId = reader.readLine();
				String checkPw = reader.readLine();		
			}catch(Exception e){
				result = "FAIL";
				response.sendRedirect("Login.jsp?RESULT="+result);
			}
		}else{
			result = "FAIL";
			response.sendRedirect("Login.jsp?RESULT="+result);
		}
		
		if(checkId.equals(id)&&checkPw.equals(pw)){
			result = id;
			resposne.sendRedirect("market.jsp?RESULT="+id);
		}else{
			result = "FAIL";
			response.sendRedirect("Login.jsp?RESULT="+result);
		}
	%>
</body>
</html>