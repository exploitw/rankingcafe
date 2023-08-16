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

	public void nextval() {
		communityDao.nextval();
	}

	public void write(Community community) {
		communityDao.write(community);
	}
}
