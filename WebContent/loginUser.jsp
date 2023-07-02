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
    response.setContentType("text/html");

    String email = request.getParameter("email");
    String pass = request.getParameter("pass");

    User u = new User(email, pass);

    out.println("user data: " + u);
    Cookie c = new Cookie("email", email);
    response.addCookie(c);

    boolean a = false;

   
        a = new UserDao().checkUser(u);
        out.println("Value of a = " + a);
   
    if (a) {
        response.sendRedirect("home.jsp");
    } else {
        out.println("Wrong Name and Password!");
        request.getRequestDispatcher("index.jsp").include(request, response);
    }
%>
</body>
</html>