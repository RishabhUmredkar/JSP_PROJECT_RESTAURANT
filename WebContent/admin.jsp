<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");

		
		if(email.equals("rishabh@gmail.com")){
			
			Cookie c = new Cookie("email", email);
			response.addCookie(c);

		
%>


<%
response.sendRedirect("viewUser.jsp");

%>

<%}else{%>
<%
    request.getRequestDispatcher("index.jsp").include(request, response);
%>

		<%}%>
	
</body>
</html>