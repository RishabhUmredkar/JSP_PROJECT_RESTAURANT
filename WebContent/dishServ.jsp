<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="MenuModel.Menu"%>
<%@page import="MenuModel.MenuDao"%>
<%@page import="MenuModel.AddImage"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String Dishname = request.getParameter("Dishname");
String image = request.getParameter("image");
String Description = request.getParameter("Description");
int Price = Integer.parseInt(request.getParameter("Price"));

Menu m = new Menu(Dishname, image, Description, Price);
out.print(image);
int m1 = 0;


    m1 = new MenuDao().insert(m);

if (m1 > 0) {
    out.print("Menu item added successfully!");
    response.sendRedirect("addimage");
} else {
    out.print("Internal error!");
    response.sendRedirect("index.jsp");

}
%>




</body>
</html>