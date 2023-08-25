package cafe;

import java.io.IOException;
import java.math.BigDecimal;
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
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;



public class CafeDAO {
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
	
	public CafeDAO() {
		 try {
	            Context initialContext = new InitialContext();
	            Context envContext = (Context) initialContext.lookup("java:/comp/env");
	            dataSource = (DataSource) envContext.lookup("jdbc/cafedb");
	        } catch (NamingException ne) {
	            ne.printStackTrace();
	        }
	}
	
	public  void insertCafe(Cafe cafe) {
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			Object[] p = {
					cafe.getCity(),
					cafe.getName(),
					cafe.getImg(),
					cafe.getAddress(),
					cafe.getPhone(),
					cafe.getDayOff(),
					cafe.getOpeningHours(),
					cafe.isParking(),
					cafe.getWebsite(),
					cafe.getInfo(),
					cafe.getCategory()
			};
			qr.execute(c, QM.get("insertCafe"), p);

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	
	public List<Cafe> getCafe(){
		List<Cafe> rtn = new ArrayList<>();
		 try { QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Cafe>> h = new BeanListHandler<>(Cafe.class);
	rtn = qr.query(QM.get("selectCafe"),h);
		  }catch(SQLException sqle) {
				sqle.printStackTrace();
			}
			
			return rtn;

	}
	
	public Cafe getCafeById(int id) {
		Cafe rtn = null;
		
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			ResultSetHandler<Cafe> h = new BeanHandler<>(Cafe.class);
			Object[] p = { id };
			rtn = qr.query(c, QM.get("getCafeById"), h, p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}

		return rtn;
	}
	
	public void updateCafe(Cafe cafe) {
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			Object[] p = { cafe.getCity(),
					cafe.getName(),
					cafe.getImg(),
					cafe.getAddress(),
					cafe.getPhone(),
					cafe.getDayOff(),
					cafe.getOpeningHours(),
					cafe.isParking(),
					cafe.getWebsite(),
					cafe.getInfo(),
					cafe.getCategory(),
					cafe.getId()

			};
			qr.execute(c, QM.get("updateCafe"), p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	public void updateCafeNoImg(Cafe cafe) {
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			Object[] p = { cafe.getCity(),
					cafe.getName(),
					cafe.getAddress(),
					cafe.getPhone(),
					cafe.getDayOff(),
					cafe.getOpeningHours(),
					cafe.isParking(),
					cafe.getWebsite(),
					cafe.getInfo(),
					cafe.getCategory(),
					cafe.getId()

			};
			qr.execute(c, QM.get("updateCafeNoImg"), p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	
	public void deleteCafe(int id) {
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			Object[] p = { id };
			qr.execute(c, QM.get("deleteCafe"), p);
		} catch (SQLException sqle) {

			sqle.printStackTrace();
		}
	}
	
	public List<Cafe> getCafeByCategoryM(){
		List<Cafe> rtn = new ArrayList<>();
		 try { QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Cafe>> h = new BeanListHandler<>(Cafe.class);
	rtn = qr.query(QM.get("getCafeByCategoryM"),h);
		  }catch(SQLException sqle) {
				sqle.printStackTrace();
			}
			
			return rtn;

	}
	
	public List<Cafe> getCafeByCategoryD(){
		List<Cafe> rtn = new ArrayList<>();
		 try { QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Cafe>> h = new BeanListHandler<>(Cafe.class);
	rtn = qr.query(QM.get("getCafeByCategoryD"),h);
		  }catch(SQLException sqle) {
				sqle.printStackTrace();
			}
			
			return rtn;

	}
	
	public List<Cafe> getCafeByCity(String city){
		List<Cafe> rtn = new ArrayList<>();
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Cafe>> h = new BeanListHandler<>(Cafe.class);
			Object[] p = {
					city
			};
			qr.execute(QM.get("getCafeByCity"),h, p);
			}catch(SQLException sqle) {
				sqle.printStackTrace();
			}
			
			return rtn;
		
	}
	
	public long getLike(long cafeId, long custId){
		long rtn = 0;
		
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<Long> h = new ScalarHandler<>();
			Object[] p = { cafeId, custId };
			rtn = qr.query(QM.get("getLike"),h, p);
			}catch(SQLException sqle) {
				sqle.printStackTrace();
			}
		
		return rtn;
	}
	
	public void insertLike(long cafeId, long custId) {
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			Object[] p = { cafeId, custId };
			qr.execute(c, QM.get("insertLike"), p);

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
		
		public void updateLike(long cafeId, long custId) {
			try (Connection c = dataSource.getConnection();) {
				QueryRunner qr = new QueryRunner();
				Object[] p = { cafeId, custId };
				qr.execute(c, QM.get("updateLike"), p);

			} catch (SQLException sqle) {
				sqle.printStackTrace();
		}
	}
		
		
		public long getLikeCnt(long cafeId) {
			long rtn = 0;

			try {
				QueryRunner qr = new QueryRunner(dataSource);
				ResultSetHandler<Long> h = new ScalarHandler<>();
				Object[] p = { cafeId };
				rtn = qr.query(QM.get("getLikeCnt"), h, p);

			} catch (SQLException sqle) {
				sqle.printStackTrace();
		}
			return rtn;
	}
		
		public void deleteLike(long cafeId, long custId) {
			try (Connection c = dataSource.getConnection();) {
				QueryRunner qr = new QueryRunner();
				Object[] p = { cafeId, custId };
				qr.execute(c, QM.get("deleteLike"), p);

			} catch (SQLException sqle) {
				sqle.printStackTrace();
		}
	}
		
		public List<Object[]> getPopularity() {
			List<Object[]> rtn = new ArrayList<>();

			try (Connection c = dataSource.getConnection();) {
				QueryRunner qr = new QueryRunner();
				ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
				rtn = qr.query(c, QM.get("getPopularity"), h);
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}

			return rtn;

		}
		
		
	
	/*
	 * public void insert(Ordering ordering) { List<Object[]> rtn = new
	 * ArrayList<>(); try { QueryRunner qr = new QueryRunner(dataSource);
	 * ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
	 * 
	 * Object[] p = { ordering.getCustomerId(), ordering.getBookId(),
	 * ordering.getSellingPrice(), new java.util.Date() };
	 * 
	 * qr.execute(sqls.getProperty("insert"), h, p);
	 * 
	 * } catch (SQLException sqle) { sqle.printStackTrace();
	 * 
	 * }
	 * 
	 * }
	 */
	/*
	 * public List<Cafe> getCafe(){ List<Cafe> rtn = new ArrayList<>(); try {
	 * QueryRunner qr = new QueryRunner(dataSource); ResultSetHandler<List<Cafe>> h
	 * = new BeanListHandler<>(Cafe.class); rtn = qr.query(QM.get("selectCafe"),h);
	 * }catch(SQLException sqle) { sqle.printStackTrace(); }
	 * 
	 * return rtn;
	 * 
	 * }
	 */
	
}
