package AdminController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminserv")
public class AdminServ extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String mail = request.getParameter("email");
		String pass = request.getParameter("pass");

		
		if(mail.equals("rishabh@gmail.com")){
			
			Cookie c = new Cookie("email", mail);
			response.addCookie(c);


			request.getRequestDispatcher("viewUser.jsp").forward(request, response);
		}
		else{
			out.print("<p style='color:red;'>Please signup First</p>");
			request.getRequestDispatcher("admin.html").include(request, response);

		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
