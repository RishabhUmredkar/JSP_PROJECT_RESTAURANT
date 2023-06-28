package UserModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {


	String url = "jdbc:mysql://localhost:3306/restaurant";
	String uname = "root";
	String upass = "abc123";
	String driver = "com.mysql.cj.jdbc.Driver";
	
	Connection con;
	

	private Connection getconnect() throws ClassNotFoundException, SQLException
	{
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url,uname,upass);
		return con;
		
	}
	
public int insert(User u) throws ClassNotFoundException, SQLException {
		String sql = "insert into tb2(name, number,email,gender,date,pass) values (?,?,?,?,?,?)";
		con = getconnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, u.getName());
		ps.setString(2, u.getNumber());
		ps.setString(3, u.getEmail());
		ps.setString(4, u.getGender());
		ps.setString(5, u.getDate());
		ps.setString(6, u.getPass());
		
		int a =ps.executeUpdate();
		con.close();
		return a;
	}

	
	public boolean checkUser(User u) throws SQLException, ClassNotFoundException {
	    con = getconnect();
	    PreparedStatement ps = con.prepareStatement("SELECT * FROM tb2 WHERE email=? and pass=?");
	    ps.setString(1, u.getEmail());
	    ps.setString(2, u.getPass());
	    ResultSet rs = ps.executeQuery();

	    boolean hasRows = rs.next(); // Check if there is at least one row in the result set

	    rs.close();
	    ps.close();
	    con.close();

	    return hasRows;
	}


}
