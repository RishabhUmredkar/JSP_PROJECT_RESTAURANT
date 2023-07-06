<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="UserModel.User"%>
<%@page import="UserModel.UserDao"%>
<%@ page import="java.util.List" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

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
			 
			 
			 
			 
<body>

  <div class="hero_area">
    <div class="bg-box" style="width: 100%;height: 75%;-o-object-fit: cover;object-fit: cover;">
      <img src="images/hero-bg.jpg" alt="">
    </div>
<%@ include file="navbar.jsp" %>



  <section class="book_section layout_padding">
    <div class="container">
      <div class="heading_container">
        <h2>
Edit User       
 </h2>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="form_container">
            <form action="updateUser.jsp">
              <div>
                <input type="text"  name="id"  value=<%= u.getId() %> class="form-control" placeholder="Id" />
              </div>
              <div>
                <input type="text"  name="name"  value=<%= u.getName() %> class="form-control" placeholder="Id" />
              </div>
              <div>
                <input type="text"  name="number"  value=<%= u.getNumber() %> class="form-control" placeholder="Id" />
              
                <input type="email"  name="email"  value=<%= u.getEmail() %> class="form-control" placeholder="Id" />
              </div>
              <div>
                <input type="text"  name="gender"  value=<%= u.getGender() %> class="form-control" placeholder="Id" />
              </div>
              <div>
                <input type="date"  name="date"  value=<%= u.getDate() %> class="form-control" placeholder="Id" />
              </div>
              <div>
                <input type="text"  name="pass"  value=<%= u.getPass() %> class="form-control" placeholder="Id" />
              </div>
              <div>

              <div class="btn_box">
                <button>Update</button>
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
			 
				 
				 
			<% 	 
				 
			 }}}}
%>
</body>
</html>