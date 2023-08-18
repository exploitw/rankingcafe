package cafe;

import java.util.List;

public class ReviewService {
	ReviewDAO reviewDao;
	
	public ReviewService() {
		reviewDao = new ReviewDAO();
	}
	
	public void insertReview(Review review) {
		reviewDao.insertReview(review);
	}
	
	public List<Review> getReview(int cafeId){
		return reviewDao.getReview(cafeId);
	}
	
	public Review getReviewBycafeId(int cafeId) {
		Review rtn = null;
		
		rtn = reviewDao.getReviewBycafeId(cafeId);
		
		return rtn;
	}
	
	public List<Review> getReviewsByCafeId(int id){
		return reviewDao.getReviewsByCafeId(id);
	}
}
