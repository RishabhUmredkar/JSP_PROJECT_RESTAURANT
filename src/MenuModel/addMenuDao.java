package MenuModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import MenuModel.menuAdd;
import UserModel.User;

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
	    PreparedStatement ps = con.prepareStatement( "INSERT INTO menuadd(email,Dishname, image, Description,Price) VALUES (?,?,?,?,?)");
	    ps.setString(1, u.getemail());
	    ps.setString(2, u.getDishname());
	    ps.setString(3, u.getImage());
	    ps.setString(4, u.getDescription());
	    ps.setInt(5, u.getPrice());

		int m1 =ps.executeUpdate();
		con.close();
		return m1;
	}



public List<menuAdd> getAllData() throws ClassNotFoundException, SQLException {

	String sql="SELECT * FROM  menuadd ";
	con = getconnect();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(sql);
	
	List<menuAdd> le=new ArrayList<menuAdd>();
	
	
	while(rs.next())
	{
		menuAdd e=new menuAdd(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6));
		
		le.add(e);
	}
	
	
	return le;
}


public int delete(int id) throws ClassNotFoundException, SQLException {
	Connection con=getconnect();
	PreparedStatement ps=con.prepareStatement("delete from menuAdd where id=?");
	ps.setInt(1,id);

	int a=ps.executeUpdate();
	con.close();
	return  a;
}


/*
public menuAdd getOneDish(String email) throws ClassNotFoundException, SQLException {
    String sql = "SELECT * FROM menuAdd WHERE email=?";
	Connection con = getconnect();
	 PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

	 ps.setString(1, email);

	ResultSet rs = ps.executeQuery();
	rs.absolute(1);
	System.out.println("Value of a ="+rs.getString(2));

	menuAdd e=new menuAdd(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6));
	return e;
}*/


public List<menuAdd> getOneDish(String email) throws ClassNotFoundException, SQLException {
    String sql = "SELECT * FROM menuadd WHERE email = ?";
    con = getconnect();
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, email);
    ResultSet rs = pstmt.executeQuery();
    
    List<menuAdd> le = new ArrayList<menuAdd>();
    
    while (rs.next()) {
        menuAdd e = new menuAdd(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
        le.add(e);
    }
    
    return le;
}

	
}
