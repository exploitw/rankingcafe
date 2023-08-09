package rankingcafe;

public class Comment {
	private long id;
	private long customerId;
	private long communityId;
	private String content;
	
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
	public long getCommunityId() {
		return communityId;
	}
	public void setCommunityId(long communityId) {
		this.communityId = communityId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
