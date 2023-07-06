
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="UserModel.User"%>
    <%@page import="UserModel.UserDao"%>
    <%@page import="MenuModel.menuAdd"%>
    <%@page import="MenuModel.Menu"%>
   <%@page import="MenuModel.AddImage"%>
   <%@page import="MenuModel.menuAdd"%>
   
<%@page import="MenuModel.MenuDao"%>
<%@page import="MenuModel.addMenuDao"%>
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
MenuDao md = new MenuDao();
Menu m = new Menu();
m=md.getOneDish(id);
%>

<%=m.getId() %><br><% 
				String mail=(String)session.getAttribute("email");
				out.print(mail);%>
				
<br>
<%=m.getDishname() %><br>
<%=m.getImage() %><br>
<%=m.getPrice() %><br>
<%=m.getDescription() %><br>

<%
String email = mail;
String Dishname = m.getDishname();
String image = m.getImage(); 
int Price =  m.getPrice(); 
String Description =  m.getDescription(); %>

<% 
menuAdd u =new menuAdd(id,email,Dishname,image,Description,Price);
addMenuDao ud = new addMenuDao();
ud.insertMenuAdd(u);
if(ud!=null)
{
	System.out.println("Image added into database successfully.");
	response.sendRedirect("Usermenu.jsp");

}
    
%>
<%=id %>
<%=email %>
<%=Dishname %>
<%=image %>
<%=Description %>
<%=id %>
</body>
</html>