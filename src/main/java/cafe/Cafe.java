package cafe;

import org.json.simple.JSONObject;

public class Cafe {
	private long id;
	private String city;
	private String name;
	private String img;
	private String address;
	private String phone;
	private String dayOff;
	private String openingHours;
	private boolean parking;
	private String website;
	private String info;
	private String category;
	public Cafe() {
		
	}
	
	public String toJsonString() {
        String rtn = null;

        JSONObject jo = new JSONObject();
        jo.put("id", id);
        jo.put("city", city);
        jo.put("name", name);
        jo.put("img", img);
        jo.put("address", address);
        jo.put("phone", phone);
        jo.put("dayOff", dayOff);
        jo.put("openingHours", openingHours);
        jo.put("parking", parking);
        jo.put("website", website);
        jo.put("info", info);

        rtn = jo.toString();

        return rtn;
    }
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	public String getDayOff() {
		return dayOff;
	}
	public void setDayOff(String dayOff) {
		this.dayOff = dayOff;
	}
	public String getOpeningHours() {
		return openingHours;
	}
	public void setOpeningHours(String openingHours) {
		this.openingHours = openingHours;
	}
	public boolean isParking() {
		return parking;
	}
	public void setParking(boolean parking) {
		this.parking = parking;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}
