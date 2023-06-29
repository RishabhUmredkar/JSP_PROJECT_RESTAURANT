package MenuModel;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import MenuModel.Menu;
import MenuModel.MenuDao;

@MultipartConfig
@WebServlet("/addimage")
public class AddImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddImage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		
		

		System.out.println("In do post method of Add Image servlet.");
		Part file=request.getPart("image");
		
		String imageFileName = null;
		String contentDisposition = file.getHeader("content-disposition");
		if (contentDisposition != null) {
		    String[] elements = contentDisposition.split(";");
		    for (String element : elements) {
		        if (element.trim().startsWith("filename")) {
		            imageFileName = element.substring(element.indexOf("=") + 1).trim().replace("\"", "");
		            break;
		        }
		    }
		}		
		String uploadPath="E:/Coding/Java Project/JSP_PROJECT_RESTAURANT2.0/WebContent/images/"+imageFileName;
		
		System.out.println("Upload Path : "+uploadPath);
		
		//Uploading Image to a folder
		
		try
		{
		
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}

		

		
		//**********************
		
		//getting database connection (jdbc code)
		String Dishname = request.getParameter("Dishname");
		String Description = request.getParameter("Description");
		int Price = Integer.parseInt( request.getParameter("Price"));
	
		Connection connection;
		try {
			connection = MenuDao.getconnect();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","abc123");
			PreparedStatement stmt;
			String query="insert into menu(Dishname,image,Description,Price) values(?,?,?,?)";
			stmt=connection.prepareStatement(query);
			stmt.setString(1,Dishname);
			stmt.setString(2,imageFileName);
			stmt.setString(3,Description);
			stmt.setInt(4,Price);
			int row=stmt.executeUpdate(); // it returns no of rows affected.
			
			if(row>0)
			{
				System.out.println("Image added into database successfully.");
			}
			
			else
			{
				System.out.println("Failed to upload image.");
			}
			
			
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		
	}

	private String extractFileName(Part file) {
		// TODO Auto-generated method stub
		return null;
	}

	private String getSubmittedFileName(Part file) {
		// TODO Auto-generated method stub
		return null;
	}

}
