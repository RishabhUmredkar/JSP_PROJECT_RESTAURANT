<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="MenuModel.Menu"%>
<%@page import="MenuModel.MenuDao"%>
<%@page import="MenuModel.AddImage"%>
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


  <!-- food section -->
<section class="food_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          Our Menu
        </h2>
      </div>

              <%
              
              



    
              List<Menu> le=null;
				
				
				
				le=new MenuDao().getAllData();
				String email=(String)session.getAttribute("email");
				out.print(email);
				
				%>
				
		
    <div class="filters-content">
        <div class="row grid">
            <% for (Menu e : le) { %>
                <div class="col-sm-6 col-lg-4 all pizza">
                    <div class="box">
                        <div>
                            <div class="img-box">
                                <img src="images/<%= e.getImage() %>" alt="Check This out">
                            </div>
                            <div class="detail-box">
                                <h5><%= e.getId() %>. <%= e.getDishname() %></h5>
                                <p><%= e.getDescription() %></p>
                                <div class="options">
                                    <h6>Rs. <%= e.getPrice() %></h6>
                                    <a href="insertMenu.jsp?id=<%= e.getId() %>"
                                       class="add-to-cart-button"
                                       onclick="addToCartClicked(this)">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                                            <path fill="currentColor" d="M12 5V19M5 12H19" stroke="currentColor"
                                                  stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                        </svg>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
        </div>
      </div>
   
    </div>
  </section>
     <script>
        function addToCartClicked(button) {
            button.classList.add('added-to-cart');
        }
    </script>

  <!-- end food section -->

  <!-- footer section -->
  <%@ include file="footer.jsp" %>
  
  <!-- footer section -->

  <!-- jQery -->  <%@ include file="AllCss.jsp" %>

  <!-- End Google Map -->
	</body>

</html>