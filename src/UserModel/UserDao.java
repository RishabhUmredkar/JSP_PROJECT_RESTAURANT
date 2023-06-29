package UserModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;





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
	
	

	public List<User> getAllData() throws ClassNotFoundException, SQLException {

		String sql="SELECT * FROM tb2";
		con = getconnect();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(sql);
		
		List<User> le=new ArrayList<User>();
		
		
		while(rs.next())
		{
			User e=new User(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
			
			le.add(e);
		}
		
		
		return le;
	}
	

	public int delete(int id) throws ClassNotFoundException, SQLException {
		Connection con=getconnect();
    	PreparedStatement ps=con.prepareStatement("delete from tb2 where id=?");
		ps.setInt(1,id);
	
		int a=ps.executeUpdate();
		con.close();
		return  a;
	}



	
	


	public User getOneUser(int id) throws ClassNotFoundException, SQLException {
		String sql = "select * from tb2 where id=?";
		con = getconnect();
		//PreparedStatement ps = con.prepareStatement(sql);
		// PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		 PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

		 ps.setInt(1,id);
		
		ResultSet rs = ps.executeQuery();
		rs.absolute(1);
		System.out.println("Value of a ="+rs.getString(2));

		User U = new User(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
		return U;
	}
	
	

	

	public int update(User u) throws ClassNotFoundException, SQLException {
		Connection con=getconnect();
    	PreparedStatement ps=con.prepareStatement("update tb2 set name=?, number=?,email=?,gender=?,date=?,pass=? where id=?");
		ps.setString(1, u.getName());
		ps.setString(2, u.getNumber());
		ps.setString(3, u.getEmail());
		ps.setString(4, u.getGender());
		ps.setString(5, u.getDate());
		ps.setString(6, u.getPass());
		ps.setInt(7, u.getId());
			
		int a=ps.executeUpdate();
		con.close();
		return  a;
	}
	
	

}
