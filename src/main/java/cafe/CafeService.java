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
	
	public void set(Cafe cafe) {
		
		cafeDao.updateCafe(cafe);
	}
	
	public void setNoImg(Cafe cafe) {
		
		cafeDao.updateCafeNoImg(cafe);
	}
	
	public void remove(int id) {
		cafeDao.deleteCafe(id);
	}
	
}
