<%@page import="MenuModel.addMenuDao"%>
<%@page import="MenuModel.menuAdd"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><!DOCTYPE html>
    
    <%@page import="MenuModel.addMenuDao"%>
<%@page import="MenuModel.menuAdd"%>
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
    
  .custom-btn-green {
    background-color: green;
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
<%@ include file="Usernavbar.jsp" %>

    <!-- end header section -->
  </div>
  
  

<br><br>


  <%-- Check if the user is logged in and retrieve the email --%>
  <% String email = (String) session.getAttribute("email");
  if (email != null && !email.isEmpty()) { %>

    <%-- Retrieve the list of menu items for the user --%>
    <% List<menuAdd> le = new addMenuDao().getOneDish(email); %>

    <%-- Display the table of user details and payment functionality --%>
    <section class="food_section layout_padding">
      <div class="container">
        <div class="heading_container heading_center">
          <h2>Our Menu</h2>
        </div>
        <div class="custom-container">
          <h2 class="custom-heading">User Details</h2>
          <table class="custom-table">
            <thead class="custom-thead">
              <tr>
                <th class="custom-th">ID</th>
                <th class="custom-th">Email</th>
                <th class="custom-th">Dish Name</th>
                <th class="custom-th">Price</th>
                <th class="custom-th">Order Price</th>
                <th class="custom-th">Delete</th>
                <th class="custom-th">Pay</th>
              </tr>
            </thead>
            <tbody>
              <% 
              int existingPrice = 0;
              for (menuAdd e : le) {
                existingPrice += e.getPrice();
              %>
              <tr>
                <td class="custom-td"><%= e.getId() %></td>
                <td class="custom-td"><%= e.getemail() %></td>
                <td class="custom-td"><%= e.getDishname() %></td>
                <td class="custom-td"><%= e.getPrice() %></td>
                <td class="custom-td"><%= existingPrice %></td>
                <td class="custom-actions">
                  <a href="deleteDish.jsp?id=<%= e.getId() %>" class="custom-btn-fancy">Delete</a>
                </td>
                <td class="custom-actions">
  <button class="custom-btn-fancy custom-btn-green" onclick="showQR('<%= e.getId() %>')">Pay</button>
</td>

              </tr>
              <% 
              }
              %>
            </tbody>
          </table>
        </div>
      </div>
    </section>

    <!-- Modal for displaying QR code -->
    <div id="paymentModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-body">
<img id="qrCodeImage" src="/JSP_PROJECT_RESTAURANT2.0/WebContent/images/QR Code.jpg" alt="QR Code">
          </div>
        </div>
      </div>
    </div>

    <%-- JavaScript code --%>
    <script>
      function showQR(id) {
        // Generate a unique payment ID
        var paymentId = '<%= java.util.UUID.randomUUID().toString() %>';

        // Construct the payment URL with the payment ID and dish ID
        var paymentURL = 'payment.jsp?paymentId=' + paymentId + '&dishId=' + id;

        // Set the src attribute of the QR code image to the payment URL
        var qrCodeImage = document.getElementById('qrCodeImage');
        qrCodeImage.src = paymentURL;

        // Open the payment modal dialog
        $('#paymentModal').modal('show');
      }
    </script>

  <%-- If the user is not logged in, display an error message --%>
  <% } else { %>
    <p>User not logged in. Please log in to view the details.</p>
  <% } %>

  <!-- footer section -->
  <%@ include file="footer.jsp" %>

  <!-- footer section -->

  <!-- jQery -->  <%@ include file="AllCss.jsp" %>

  <!-- End Google Map -->
	</body>

</html>