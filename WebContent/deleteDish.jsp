
    <%@page import="MenuModel.menuAdd"%>
<%@page import="MenuModel.addMenuDao"%>
<%@ page import="java.util.List" %>

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

menuAdd u =new menuAdd(id);		
addMenuDao ud = new addMenuDao();


		ud.delete(id);
		response.sendRedirect("menu.jsp");

%>
Delete Menu
		

	
		<%
		

}}}
%>











</body>
</html>