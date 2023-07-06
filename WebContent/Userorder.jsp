<%@page import="MenuModel.addMenuDao"%>
<%@page import="MenuModel.menuAdd"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><!DOCTYPE html>
    
    <%@page import="MenuModel.addMenuDao"%>
<%@page import="MenuModel.menuAdd"%>
<%@page import="MenuModel.AddImage"%>
    <%@page import="UserModel.User"%>
<%@page import="UserModel.UserDao"%>
<%@page import="MenuModel.AddImage"%>
<%@ page import="java.util.List" %>
 
    <%@page import="UserModel.User"%>
<%@page import="UserModel.UserDao"%>
<%@ page import="java.util.List" %>

<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="">
<%@ include file="AllCss.jsp" %>

  <title> Feane </title>

</head>

<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
<%@ include file="Usernavbar.jsp" %>

    <!-- end header section -->
  </div>
  
  

<br><br>



<% 
Cookie cookies[] = request.getCookies();
if (cookies != null) {
    {
		String mail = cookies[0].getValue();

		
		if(!mail.equals("")|| mail!=null)
		{
int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			User u = null;
			int a=0;
			
				u = new UserDao().getOneUser(id);


			 if(u!=null){%>
			 
			 
  <!-- food section -->
<section class="food_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          Our Menu
        </h2>
      </div>
<% 
String email=(String)session.getAttribute("email");
out.print(email);



			menuAdd u = null;
			int a=0;
			
				u = new addMenuDao().getOneDish(email);


			 if(u!=null){%>
			 
  <!-- book section -->
<body class="custom-body">
  <div class="container">
    <div class="custom-container">
      <h2 class="custom-heading">User Details</h2>
      <table class="custom-table">
        <thead class="custom-thead">
          <tr>
            <th class="custom-th">ID</th>
            <th class="custom-th">Email</th>
            <th class="custom-th">Dish Name</th>
            <th class="custom-th">Price</th>
            <th class="custom-th">Delete </th>
          </tr>
        </thead>
        					<%for(menuAdd e:le){%>
        
        <tbody> <tr>
     <td class="custom-td"><%= e.getId() %></td>
    <td class="custom-td"><%= e.getemail()%></td>
    <td class="custom-td"><%= e.getDishname()%></td>
    <td class="custom-td"><%= e.getPrice() %></td>
    <td class="custom-actions">
      <a href="deleteDish.jsp?id=<%=e.getId() %>" class="custom-btn-fancy">Delete</a>

   
    </td>
  </tr>
  <% } %>
  
        </tbody>
      </table>
    </div>
  </div>
      
  </section>
   <br>
     <br>  <%}}}}} %>
     
  <!-- footer section -->
  <%@ include file="footer.jsp" %>
  
  <!-- footer section -->

  <!-- jQery -->  <%@ include file="AllCss.jsp" %>

  <!-- End Google Map -->
	</body>

</html>