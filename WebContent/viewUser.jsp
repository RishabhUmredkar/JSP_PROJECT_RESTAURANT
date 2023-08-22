<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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

    /* Pagination styles */
    .pagination {
      margin-top: 20px;
    }

    .pagination .page-item.active .page-link {
      background-color: #007bff;
      border-color: #007bff;
    }

    .pagination .page-link {
      color: #007bff;
    }

    .pagination .page-link:hover {
      background-color: #f0f0f0;
      color: #007bff;
    }

    .pagination .page-item.disabled .page-link {
      color: #6c757d;
      pointer-events: none;
    }

    .pagination .page-item:first-child .page-link,
    .pagination .page-item:last-child .page-link {
      border-radius: 50%;
    }

    .pagination .page-item:first-child .page-link {
      margin-right: 5px;
    }

    .pagination .page-item:last-child .page-link {
      margin-left: 5px;
    }</style>
  <title>Feane</title>
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
    <!-- Your existing code for header section -->
  </div>
  <br><br>

  <%	
  Cookie c[] = request.getCookies();
  if (c != null) {
    String email = c[0].getValue();
    if (!email.equals("") || email != null) {
      List<User> le = null;
      le = new UserDao().getAllData();

      // Pagination
      int currentPage = 1;
      int recordsPerPage = 5;
      if (request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
      }
      int totalRecords = le.size();
      int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
      int start = (currentPage - 1) * recordsPerPage;
      int end = Math.min(start + recordsPerPage, totalRecords);
      List<User> currentPageData = le.subList(start, end);
  %>

  <!-- book section -->
  <body class="custom-body">
    <div class="container">
      <div class="custom-container">
        <h2 class="custom-heading">User Details</h2>
        <div class="table-responsive">
          <table class="table table-bordered custom-table">
            <thead class="custom-thead">
              <tr>
                <th class="custom-th">ID</th>
                <th class="custom-th">Name</th>
                <th class="custom-th">Number</th>
                <th class="custom-th">Email</th>
                <th class="custom-th">Gender</th>
                <th class="custom-th">Date of Registration</th>
                <th class="custom-th">PassWord</th>
                <th class="custom-th">Actions</th>
              </tr>
            </thead>
            <tbody>
              <% for (User e : currentPageData) { %>
                <tr>
                  <td class="custom-td"><%= e.getId() %></td>
                  <td class="custom-td"><%= e.getName() %></td>
                  <td class="custom-td"><%= e.getNumber() %></td>
                  <td class="custom-td"><%= e.getEmail() %></td>
                  <td class="custom-td"><%= e.getGender() %></td>
                  <td class="custom-td"><%= e.getDate() %></td>
                  <td class="custom-td"><%= e.getPass() %></td>
                  <td class="custom-actions">
                    <a href="editUser.jsp?id=<%= e.getId() %>" class="custom-btn-fancy">Update</a>
                    <a href="deleteUser.jsp?id=<%= e.getId() %>" class="custom-btn-danger">Delete</a>
                  </td>
                </tr>
              <% } %>
            </tbody>
          </table>
        </div>

        <!-- Pagination -->
        <nav aria-label="Page navigation">
          <ul class="pagination justify-content-center">
            <% if (currentPage > 1) { %>
              <li class="page-item">
                <a class="page-link" href="?page=<%= currentPage - 1 %>" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
            <% } %>

            <% for (int i = 1; i <= totalPages; i++) { %>
              <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                <a class="page-link" href="?page=<%= i %>"><%= i %></a>
              </li>
            <% } %>

            <% if (currentPage < totalPages) { %>
              <li class="page-item">
                <a class="page-link" href="?page=<%= currentPage + 1 %>" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            <% } %>
          </ul>
        </nav>
      </div>
    </div>
  </body>
  <%  } else { %>
    <% response.sendRedirect("index.jsp"); } %>
  <% } else { %>
    <% response.sendRedirect("index.jsp"); } %>
  <!-- ... Your existing code ... -->
  <!-- footer section -->
  <%@ include file="footer.jsp" %>
  <!-- footer section -->
  <!-- jQery -->
  <%@ include file="AllCss.jsp" %>
  <!-- End Google Map -->
</body>
</html>
