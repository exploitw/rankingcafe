package cafe;

import java.sql.Date;

public class Community {
	private long id;
	private long customerId;
	private String title;
	private String img;
	private String content;
	private Date date;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Community [id=").append(id).append(", ").append("title=")
				.append(title).append(",content=").append(content).append(", ")
				.append(", ").append(", customerId=").append(customerId).append("]");
		return builder.toString();
	}
	
}
