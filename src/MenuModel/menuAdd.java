package MenuModel;

public class menuAdd {
	private int id;
	private String email;
	private String Dishname;
	private String image;
	private String Description;
	private int Price;
	
	public menuAdd() {
		super();
		// TODO Auto-generated constructor stub
	}

	public menuAdd(int id) {
		super();
		this.id = id;
	}

	public menuAdd(int id, String Dishname) {
		super();
		this.id = id;
		this.Dishname = Dishname;
	}

	public menuAdd(String email,String Dishname, String image, String Description, int Price) {
		super();
		this.email = email;
		this.Dishname = Dishname;
		this.image = image;
		this.Description = Description;
		this.Price = Price;
	}

	public menuAdd(int id, String email,String Dishname, String image, String Description, int Price) {
		super();
		this.id = id;
		this.email = email;
		this.Dishname = Dishname;
		this.image = image;
		this.Description = Description;
		this.Price = Price;
	}

	public menuAdd(int id, String email,String Dishname, String image, String Description) {
		super();
		this.id = id;
		this.email = email;
		this.Dishname = Dishname;
		this.image = image;
		this.Description = Description;
	}

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getemail() {
		return email;
	}

	public void setemail(String email) {
		this.email = email;
	}

	public String getDishname() {
		return Dishname;
	}

	public void setDishname(String Dishname) {
		this.Dishname = Dishname;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return Description;
	}

	public void setDiscription(String Description) {
		this.Description = Description;
	}

	public int getPrice() {
		return Price;
	}

	public void setPrice(int Price) {
		this.Price = Price;
	}
	
	
	
	
}
