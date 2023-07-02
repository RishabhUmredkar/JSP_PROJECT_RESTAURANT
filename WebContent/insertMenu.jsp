
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="MenuModel.menuAdd"%>
    <%@page import="MenuModel.Menu"%>
<%@page import="MenuModel.AddImage"%>
<%@page import="MenuModel.menuAdd"%>
<%@page import="MenuModel.MenuDao"%>
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
String email = request.getParameter("email");
 String Dishname = request.getParameter("Dishname");
String image = request.getParameter("image");
String Description = request.getParameter("Description");
/* int Price = Integer.parseInt(request.getParameter("Price"));
 */ 

Menu u =new Menu(id,Dishname,image,Description);		
MenuDao ud = new MenuDao();


ud.insertMenuAdd(u);


%>





</body>
</html>