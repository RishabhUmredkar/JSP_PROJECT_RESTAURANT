package MenuModel;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import MenuModel.Menu;
import MenuModel.MenuDao;

@WebServlet("/addimage")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddImage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Dishname = request.getParameter("Dishname");
        String Description = request.getParameter("Description");
        int Price = Integer.parseInt(request.getParameter("Price"));

        Part imagePart = request.getPart("image");
        String imageName = saveImage(imagePart); // Save the image and get the image name

        Menu m = new Menu(Dishname, imageName, Description, Price);

        int m1 = 0;
		try {
			m1 = new MenuDao().insert(m);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        if (m1 > 0) {
            request.setAttribute("menu", m);
            request.getRequestDispatcher("addimage.jsp").forward(request, response);
        } else {
            response.getWriter().println("Internal error!");
        }
    }

    private String saveImage(Part imagePart) throws IOException {
        String uploadPath = "E:/Coding/Java Project/JSP_PROJECT_RESTAURANT2.0/WebContent/images/";
        String fileName = extractFileName(imagePart);

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String filePath = uploadPath + File.separator + fileName;
        imagePart.write(filePath);
        return fileName;
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}

	

//}
//else{
//
//	try {
//		Connection con = GetConnection.Connect();
//		
//		PreparedStatement ps = con.prepareStatement(Insert_Image_Query);
//		
//		ps.setString(1, imageFileName);
//		ps.setString(2, movie_name);
//		ps.setString(3, release_date);
//		
//		int status = ps.executeUpdate();
//		
//		if(status>0)
//		{
//			
//			response.sendRedirect("profileAdmin.jsp");
//			out.print("<div class='alert alert-warning alert-dismissible fade show' role='alert'>"
//					+ "<strong>Movie Added Successfully!</strong>"
//					+ "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
//					+ "</div>");
//
//		}
//		
//		else
//		{
//			RequestDispatcher dispatcher = request.getRequestDispatcher("profileAdmin.jsp");
//			dispatcher.include(request,response);
//			out.print("<div class='alert alert-warning alert-dismissible fade show' role='alert'>"
//					+ "<strong>Failed to upload!</strong>"
//					+ "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
//					+ "</div>");
//		}
//		
//	} catch (ClassNotFoundException | SQLException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}

	


