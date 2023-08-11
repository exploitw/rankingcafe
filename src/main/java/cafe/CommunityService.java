package cafe;

import java.util.List;

public class CommunityService {
	CommunityDAO dao;

	public CommunityService() {
		dao = new CommunityDAO();
	}
	
	public List<Community> getCommunity() {
		return dao.selectCommunity();
	}
	
//	public Community getCommunityOrBlank(int id) {
//		Community rtn = null;
//
//		rtn = dao.selectCommunityById(id);
//
//		if (rtn == null) {
//			rtn = new Community();
//			rtn.setId(-1);
//			rtn.setCustomerId(0);
//			rtn.setTitle("");
//			rtn.setImg("");
//			rtn.setContent("");
//		}
//		return rtn;
//	}
}
