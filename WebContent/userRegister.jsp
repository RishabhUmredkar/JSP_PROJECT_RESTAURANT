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

String name = request.getParameter("name");
String number = request.getParameter("number");
String email = request.getParameter("email");
String gender = request.getParameter("gender");
String date = request.getParameter("date");
String pass = request.getParameter("pass");


User u =new User(name,number,email, gender,date,pass);		
UserDao ud = new UserDao();

	if(!ud.checkUser(u)){
		ud.insert(u);
		Cookie c = new Cookie("email", number);
		response.addCookie(c);

%>
User register

			
			<jsp:forward page="login.jsp">
			<jsp:param value="<%=email%>" name="email"/>
			<jsp:param value="<%=pass%>" name="pass"/>
			</jsp:forward>	
				
		<%
		

}
	else if(ud.checkUser(u)){%>	
		<jsp:include page="login.jsp"></jsp:include>
		<script>alert("Warning : Passwords did not match !! Please fill details again. ");</script>
	<%}%>
















</body>
</html>