package cafe;

import java.util.List;

public class CafeService {
	CafeDAO cafeDao;
	
	public CafeService() {
		cafeDao = new CafeDAO();
	}
	
	public  void insertCafe(Cafe cafe){
		cafeDao.insertCafe(cafe); 
	}
	
	public List<Cafe> getCafe(){
		return cafeDao.getCafe();
	}
	
	public Cafe getCafeById(int id) {
		Cafe rtn = null;
		
		rtn = cafeDao.getCafeById(id);
		
		return rtn;
	}
}
