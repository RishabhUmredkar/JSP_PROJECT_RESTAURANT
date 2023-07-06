<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


</head>
<body>

  <div class="hero_area">
    <div class="bg-box" style="width: 100%;height: 62%;-o-object-fit: cover;object-fit: cover;">
      <img src="images/hero-bg.jpg" alt="">
    </div>
<%@ include file="Indexheader.jsp" %>



  <section class="book_section layout_padding">
    <div class="container">
    
        <h2>
Login        </h2>
      <div class="row">
      
        <div class="col-md-6">
          <div class="form_container">
            <form action="loginUser.jsp">
              <div>
                <input type="text" name="name" class="form-control" placeholder="Your Name" />
              </div>

              <div>
                <input type="email" name="email" class="form-control" placeholder="Your Email" />
              </div>
              <div>
                <input type="password" name="pass" class="form-control" placeholder="Your Password" />
              </div>
              <div class="btn_box">
                <button>Login</button>
              </div>
            </form>
          </div>
        </div>
        <div class="col-md-6">
          <div class="map_container ">
            <div id="googleMap"></div>
          </div>
        </div>
      </div>
    </div>
  </section>
<%@ include file="footer.jsp" %>

</body>
</html>