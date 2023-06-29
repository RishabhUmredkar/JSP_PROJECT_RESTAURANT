package MenuModel;

public class Menu {
	private int id;
	private String Dishname;
	private String image;
	private String Discription;
	private int Price;
	
	public Menu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Menu(int id) {
		super();
		this.id = id;
	}

	public Menu(int id, String Dishname) {
		super();
		this.id = id;
		this.Dishname = Dishname;
	}

	public Menu(String Dishname, String image, String Discription, int Price) {
		super();
		this.Dishname = Dishname;
		this.image = image;
		this.Discription = Discription;
		this.Price = Price;
	}

	public Menu(int id, String Dishname, String image, String Discription, int Price) {
		super();
		this.id = id;
		this.Dishname = Dishname;
		this.image = image;
		this.Discription = Discription;
		this.Price = Price;
	}

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getDiscription() {
		return Discription;
	}

	public void setDiscription(String Discription) {
		this.Discription = Discription;
	}

	public int getPrice() {
		return Price;
	}

	public void setPrice(int Price) {
		this.Price = Price;
	}
	
	
	
	
}
