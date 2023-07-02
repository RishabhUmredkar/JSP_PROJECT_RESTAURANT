
    <%@page import="MenuModel.Menu"%>
<%@page import="MenuModel.MenuDao"%>
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

Menu u =new Menu(id);		
MenuDao ud = new MenuDao();


		ud.delete(id);
		

%>
Delete Menu

			
	<jsp:forward page="menu.jsp">
			<jsp:param value="<%=id%>" name="id"/>
			</jsp:forward>				
				
		<%
		

}}}
%>











</body>
</html>