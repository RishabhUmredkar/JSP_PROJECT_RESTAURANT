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

@WebServlet("/userRegister")
public class UserRegister extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		String name = request.getParameter("name");
		String number = request.getParameter("number");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String date = request.getParameter("date");
		String pass = request.getParameter("pass");

		User u =new User(name,number,email, gender,date,pass);		
        UserDao ud = new UserDao();
		try {
			if(!ud.checkUser(u)){
				ud.insert(u);
				

				out.print("user Register !");
				request.getRequestDispatcher("login.jsp").include(request, response);
				
		}
			else if(ud.checkUser(u)){
			out.print("email already exist");
			request.getRequestDispatcher("login.jsp").include(request, response);

		}
} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*if(ud!=null){

		}
		else{
			out.print("Internal error!");
			request.getRequestDispatcher("index.jsp").include(request, response);
		}
		*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
