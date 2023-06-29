package MenuModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MenuDao {


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
	
	public int insert(Menu m) throws ClassNotFoundException, SQLException {
	    String sql = "INSERT INTO menu(Dishname, image, Description, Price) VALUES (?, ?, ?, ?)";
	    con = getconnect();
	    PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	    ps.setString(1, m.getDishname());
	    ps.setString(2, m.getImage());
	    ps.setString(3, m.getDescription());
	    ps.setInt(4, m.getPrice());

	    int rowsInserted = ps.executeUpdate();
	    int generatedId = -1;
	    if (rowsInserted > 0) {
	        ResultSet rs = ps.getGeneratedKeys();
	        if (rs.next()) {
	            generatedId = rs.getInt(1); // Retrieve the auto-generated ID
	        }
	    }

	    con.close();
	    return generatedId;
	}

}
