<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="UserModel.User"%>
<%@page import="UserModel.UserDao"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("name");
String number = request.getParameter("number");
String email = request.getParameter("email");
String gender = request.getParameter("gender");
String date = request.getParameter("date");
String pass = request.getParameter("pass");


    User u =new User(id,name,number,email, gender,date,pass);		

        int a = new UserDao().update(u);
        if (a > 0) {
%>
 	
 	
			<jsp:forward page="viewUser.jsp">
			<jsp:param value="<%=email%>" name="email"/>
			<jsp:param value="<%=pass%>" name="pass"/>
			</jsp:forward>	
				
		<%
		
 	
        }  else%>			<jsp:forward page="viewUser.jsp">
        
<jsp:param value="<%=email%>" name="email"/>
			<jsp:param value="<%=pass%>" name="pass"/>
			</jsp:forward>	
				
</body>
</html>