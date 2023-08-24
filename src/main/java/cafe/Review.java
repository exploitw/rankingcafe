package cafe;

import java.util.Date;

import org.json.simple.JSONObject;

public class Review {
	private long id;
	private long cafeId;
	private long customerId;
	private String img;
	private String content;
	private Date date;
	
	public Review () {
		
	}
	
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
	public long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
