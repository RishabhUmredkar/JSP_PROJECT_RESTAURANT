package UserModel;

public class User {
	
	private int id;
	private String name;
	private String number;
	private String email;
	private String gender;
	private String date;
	private String pass;
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int id) {
		super();
		this.id = id;
	}
	public User(int id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}
	public User(String email, String pass) {
		super();
		this.email = email;
		this.pass = pass;
	}

	public User(int id, String name, String number, String email, String gender, String date, String pass) {
		super();
		this.id = id;
		this.name = name;
		this.number = number;
		this.email = email;
		this.gender = gender;
		this.date = date;
		this.pass = pass;
	}
	
	public User(String name, String number, String email, String gender, String date, String pass) {
		super();
		this.name = name;
		this.number = number;
		this.email = email;
		this.gender = gender;
		this.date = date;
		this.pass = pass;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
	
}