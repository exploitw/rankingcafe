package cafe;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryLoader;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class ReviewDAO {
	final static String QUERY_PATH = "/cafe/cafe_queries.properties";
	final static Map<String, String> QM;
	
	private DataSource dataSource;
	
	static {
		try {
			QM = QueryLoader.instance().load(QUERY_PATH);
		}catch (IOException ioe) {
			ioe.printStackTrace();
			
			throw new ExceptionInInitializerError(ioe);
		}
	}
	
	public ReviewDAO() {
		 try {
	            Context initialContext = new InitialContext();
	            Context envContext = (Context) initialContext.lookup("java:/comp/env");
	            dataSource = (DataSource) envContext.lookup("jdbc/cafedb");
	        } catch (NamingException ne) {
	            ne.printStackTrace();
	        }
	}
	
	public List<Review> getReview(int cafeId){
		List<Review> rtn = new ArrayList<>();
		 try { QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Review>> h = new BeanListHandler<>(Review.class);
			Object[] p = {cafeId};
	rtn = qr.query(QM.get("selectReview"),h,p);
		  }catch(SQLException sqle) {
				sqle.printStackTrace();
			}
			
			return rtn;

	}
	public Review getReviewBycafeId(int cafeId) {
		Review rtn = null;
		
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			ResultSetHandler<Review> h = new BeanHandler<>(Review.class);
			Object[] p = { cafeId };
			rtn = qr.query(c, QM.get("selectReview"), h, p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}

		return rtn;
	}
	
	public List<Review> getReviewsByCafeId(int id){
		List<Review> rtn = new ArrayList<>();
		 try { QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Review>> h = new BeanListHandler<>(Review.class);
			Object[] p = {id};
	rtn = qr.query(QM.get("getReviewsByCafeId"),h,p);
		  }catch(SQLException sqle) {
				sqle.printStackTrace();
			}
			
			return rtn;

	}
	
	public  void insertReview(Review review) {
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			Object[] p = {
					review.getCafeId(),
					review.getCustomerId(),
					review.getImg(),
					review.getContent(),
					new java.util.Date()
					
			};
			qr.execute(c, QM.get("insertReview"), p);

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	public void updateReview(Review review) {
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			Object[] p = { 
					review.getImg(),
					review.getContent(),
					new java.util.Date(),
					review.getId()

			};
			qr.execute(c, QM.get("updateReview"), p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	public void updateReviewNoImg(Review review) {
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			Object[] p = { 
					
					review.getContent(),
					new java.util.Date(),
					review.getId()

			};
			qr.execute(c, QM.get("updateReview"), p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	
	public void deleteReview(int id) {
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			Object[] p = { id };
			qr.execute(c, QM.get("deleteReview"), p);
		} catch (SQLException sqle) {

			sqle.printStackTrace();
		}
	}
	
	public Review getReviewByCustomerId(int customerId) {
		Review rtn = null;
		
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			ResultSetHandler<Review> h = new BeanHandler<>(Review.class);
			Object[] p = { customerId };
			rtn = qr.query(c, QM.get("getReviewByCustomerId"), h, p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}

		return rtn;
	}
}
