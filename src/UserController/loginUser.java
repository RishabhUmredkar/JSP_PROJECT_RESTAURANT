package UserController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import UserModel.User;
import UserModel.UserDao;


@WebServlet("/loginuser")
public class loginUser extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		

		String mail = request.getParameter("email");
		String pass = request.getParameter("pass");

		User u =new User(mail,pass);
		
		System.out.println("user data :  "+u);
		Cookie c = new Cookie("email", mail);
		response.addCookie(c);
		
		boolean a =false;
		
		try {
			a =new UserDao().checkUser(u);
			System.out.println("Value of a ="+a);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if(a){	
			response.sendRedirect("home.jsp");

			
	}
		else{

			out.print("Wrong Name and PassWord!");
			request.getRequestDispatcher("login.html").include(request, response);
		
			}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
