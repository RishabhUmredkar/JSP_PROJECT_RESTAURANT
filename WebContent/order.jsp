<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><!DOCTYPE html>
    <%@page import="UserModel.User"%>
    <%@page import="UserModel.UserDao"%>
    <%@page import="MenuModel.menuAdd"%>
    <%@page import="MenuModel.Menu"%>
   <%@page import="MenuModel.AddImage"%>
   <%@page import="MenuModel.menuAdd"%>
   
<%@page import="MenuModel.MenuDao"%>
<%@page import="MenuModel.addMenuDao"%>
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

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <style>
    body.custom-body {
      background-color: #f8f9fa;
    }

    .custom-container {
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin-top: 20px;
    }

    .custom-heading {
      margin-bottom: 20px;
    }

    .custom-table {
      width: 100%;
      border-collapse: collapse;
    }

    .custom-th,
    .custom-td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #e9ecef;
    }

    .custom-thead {
      background-color: #343a40;
      color: #fff;
    }

    .custom-tbody tr:nth-child(even) {
      background-color: #f8f9fa;
    }

    .custom-actions {
      white-space: nowrap;
    }

    .custom-actions a {
      margin-right: 5px;
    }

    .custom-btn-fancy {
      background-color: #ffbe33;
      color: #fff;
      border: none;
      border-radius: 4px;
      padding: 8px 16px;
      font-size: 14px;
      font-weight: bold;
      transition: transform 0.3s ease;
      text-decoration: none;
    }

    .custom-btn-fancy:hover {
      transform: scale(1.1);
    }

    .custom-btn-danger {
      background-color: #343a40;
      color: #fff;
      border: none;
      border-radius: 4px;
      padding: 8px 16px;
      font-size: 14px;
      font-weight: bold;
      transition: transform 0.3s ease;
      text-decoration: none;
    }

    .custom-btn-danger:hover {
      background-color: #343a40;
      transform: scale(1.1);
    }
  </style>
  <title> Feane </title>

</head>

<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
<%@ include file="navbar.jsp" %>

    <!-- end header section -->
  </div>
<br><br>

<%	
/* 
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant", "root", "abc123");

// Create a statement
Statement statement = connection.createStatement();

// Set the pagination parameters
int pageSize = 10; // Number of records per page
int currentPage = 1; // Current page number

// Calculate the offset for pagination
int offset = (currentPage - 1) * pageSize;

// Execute the query with pagination
String query = "SELECT * FROM menuadd LIMIT " + offset + ", " + pageSize;
ResultSet resultSet = statement.executeQuery(query);

// Get the column count by using ResultSetMetaData
ResultSetMetaData metaData = resultSet.getMetaData();
int columnCount = metaData.getColumnCount();

// Output the column count
System.out.println("Number of columns: " + columnCount);

// Process the result set
while (resultSet.next()) {
    // Retrieve the column values
    for (int i = 1; i <= columnCount; i++) {
        System.out.print(resultSet.getString(i) + "\t");
    }
    System.out.println();
}

// Clean up resources
resultSet.close();
statement.close();
connection.close();

 */
Cookie c[] = request.getCookies();
if(c!=null)
{

	String email = c[0].getValue();

	
	if(!email.equals("")|| email!=null)
	{

    			 List<menuAdd> le=null;
    				
					
					
					le=new addMenuDao().getAllData();%>
					
					

					
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
     <br>      
         <%  }}else{%>
            		
            		<%
response.sendRedirect("index.jsp");
         }
%>


    

  <!-- end book section -->

  <!-- footer section -->
<%@ include file="footer.jsp" %>

  <!-- footer section -->

  <!-- jQery -->
  <%@ include file="AllCss.jsp" %>
  
  <!-- End Google Map -->

</body>

</html>