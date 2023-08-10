package cafe;

public class Menu {
	private long id;
	private long cafeId;
	private String name;
	private int price;
	private String content;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getCafeId() {
		return cafeId;
	}
	public void setCafeId(long cafeId) {
		this.cafeId = cafeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
