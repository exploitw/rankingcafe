package cafe;

public class Customer {
	private long id;
	private String name;
	private String email;
	private String password;
	private String nickName;
	private String address;
	private String phone;
	
	 public Customer(){
		
	}
	
	public Customer(String name, String email, String password, String nickName, String address, String phone) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.nickName = nickName;
		this.address = address;
		this.phone = phone;
	}

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
