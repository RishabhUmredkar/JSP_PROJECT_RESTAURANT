<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><!DOCTYPE html>
    
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
<%@ include file="header.jsp" %>

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

      <ul class="filters_menu">
        <li class="active" data-filter="*">All</li>
        <li data-filter=".burger">Burger</li>
        <li data-filter=".pizza">Pizza</li>
        <li data-filter=".pasta">Pasta</li>
        <li data-filter=".fries">Fries</li>
      </ul>
    
              <%
              List<Menu> le=null;
				
				
				
				le=new MenuDao().getAllData();%>
				
			
      <div class="filters-content">
        <div class="row grid">
        <%for(Menu e:le){%>
			
          <div class="col-sm-6 col-lg-4 all pizza">
            <div class="box">
              <div>
          
		
	
                <div class="img-box">
                  <img src="images/<%=e.getImage()%>" alt="">
                </div>
                <div class="detail-box">
                  <h5>
					<%= e.getId() %>.  <%= e.getDishname() %>    </h5>
                  <p>	<%= e.getDescription() %>
                  </p>
                  <div class="options">
                    <h6>
                      Rs. <%= e.getPrice() %>
                    </h6>
                    <a href="deleteMenu.jsp?id=<%=e.getId() %>">
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
  <path d="M21 8h-1v11a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V8H3a1 1 0 0 1 0-2h2V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v2h2a1 1 0 0 1 0 2zm-4 0H7v11h10zm-8-2h2v9H9zm4 0h2v9h-2z" fill="#FF0000" />
</svg>

                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
                  		
        				            
        <%} 
%>

            </div>
          </div>
        </div>
      </div>
      <div class="btn-box">
        <a href="addDish.jsp">Add Dishes</a>
      </div>
    </div>
  </section>

  <!-- end food section -->

  <!-- footer section -->
  <%@ include file="footer.jsp" %>
  
  <!-- footer section -->

  <!-- jQery -->  <%@ include file="AllCss.jsp" %>

  <!-- End Google Map -->
	</body>

</html>