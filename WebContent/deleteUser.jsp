<%@page import="UserModel.User"%>
<%@page import="UserModel.UserDao"%>
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

Cookie cookies[] = request.getCookies();
if (cookies != null) {
    {
		String mail = cookies[0].getValue();

		
		if(!mail.equals("")|| mail!=null)
		{
int id = Integer.parseInt(request.getParameter("id"));
String email= request.getParameter("email");
String pass= request.getParameter("pass");

User u =new User(id);		
UserDao ud = new UserDao();


		ud.delete(id);
		

%>
Delete User

			
			<jsp:forward page="viewUser.jsp">
			<jsp:param value="<%=email%>" name="email"/>
			<jsp:param value="<%=pass%>" name="pass"/>
			</jsp:forward>	
				
		<%
		

}}}
%>











</body>
</html>