package cafe;

import java.util.List;

public class CommunityService {
	CommunityDAO communityDao;

	public CommunityService() {
		communityDao = new CommunityDAO();
	}

	public List<Community> getCommunity() {
		return communityDao.selectCommunity();
	}

	public List<Object[]> getCustomer() {
		return communityDao.getCustomer();
	}

	public void write(Community community) {
		communityDao.write(community);
	}

	public Community getCommunityOrBlank(int id) {
		Community rtn = null;

		rtn = communityDao.selectCommunityById(id);

		if (rtn == null) {
			rtn = new Community();
			rtn.setTitle("");
			rtn.setImg("");
			rtn.setContent("");
		}
		return rtn;
	}

	public void setCommunity(Community community) {
		communityDao.updateCommunity(community);
	}

	public void addOrSetCommunity(Community community) {
		if (community.getId() == -1) {
			write(community);
		} else {
			setCommunity(community);
		}
	}

	public void removeCommunity(int id) {
		communityDao.deleteCommunity(id);
	}
	
	public List<Object[]> getCommunityByCustomerId(int id) {
		return communityDao.getCommunityByCustomerId(id);
	}
}
