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
	   // String sql = "INSERT INTO menu(Dishname, image, Description, Price) VALUES (?, ?, ?, ?)";
	    con = getconnect();
	    PreparedStatement ps = con.prepareStatement( "INSERT INTO menu(Dishname, image, Description, Price) VALUES (?, ?, ?, ?)");
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
	
	


	public List<Menu> getAllData() throws ClassNotFoundException, SQLException {

		String sql="SELECT * FROM menu ORDER BY id DESC";
		con = getconnect();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(sql);
		
		List<Menu> le=new ArrayList<Menu>();
		
		
		while(rs.next())
		{
			Menu e=new Menu(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4),rs.getInt(5));
			
			le.add(e);
		}
		
		
		return le;
	}
	

	public int delete(int id) throws ClassNotFoundException, SQLException {
		Connection con=getconnect();
    	PreparedStatement ps=con.prepareStatement("delete from menu where id=?");
		ps.setInt(1,id);
	
		int a=ps.executeUpdate();
		con.close();
		return  a;
	}

	
	

public int insertMenuAdd(Menu u) throws ClassNotFoundException, SQLException {
	   // String sql = "INSERT INTO menu(Dishname, image, Description, Price) VALUES (?, ?, ?, ?)";
	    con = getconnect();
	    PreparedStatement ps = con.prepareStatement( "INSERT INTO menuadd(id,Dishname, image, Description) VALUES (?, ?,?,?)");
	    ps.setInt(1, u.getId());
	    ps.setString(2, u.getDishname());
	    ps.setString(3, u.getImage());
	    ps.setString(4, u.getDescription());
		
		int m1 =ps.executeUpdate();
		con.close();
		return m1;
	}
	

		
}
