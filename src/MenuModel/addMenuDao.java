package MenuModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import MenuModel.Menu;;

public class addMenuDao {


	static String url = "jdbc:mysql://localhost:3306/restaurant";
	static String uname = "root";
	static String upass = "abc123";
	static String driver = "com.mysql.cj.jdbc.Driver";
	
	Connection con;
	

	static Connection getconnect() throws ClassNotFoundException, SQLException
	{
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url,uname,upass);
		return con;
		
	}	

public int insertMenuAdd(menuAdd u) throws ClassNotFoundException, SQLException {
	   // String sql = "INSERT INTO menu(Dishname, image, Description, Price) VALUES (?, ?, ?, ?)";
	    con = getconnect();
	    PreparedStatement ps = con.prepareStatement( "INSERT INTO menuadd(id,email,Dishname, image, Description,Price) VALUES (?,?,?,?,?,?)");
	    ps.setInt(1, u.getId());
	    ps.setString(2, u.getemail());
	    ps.setString(3, u.getDishname());
	    ps.setString(4, u.getImage());
	    ps.setString(5, u.getDescription());
	    ps.setInt(6, u.getPrice());

		int m1 =ps.executeUpdate();
		con.close();
		return m1;
	}
	
}
