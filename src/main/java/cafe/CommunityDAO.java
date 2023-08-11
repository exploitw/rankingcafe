package cafe;

import java.io.IOException;
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
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class CommunityDAO {
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
	
	public CommunityDAO() {
		 try {
	            Context initialContext = new InitialContext();
	            Context envContext = (Context) initialContext.lookup("java:/comp/env");
	            dataSource = (DataSource) envContext.lookup("jdbc/cafedb");
	        } catch (NamingException ne) {
	            ne.printStackTrace();
	        }
	}
	
	public List<Community> selectCommunity() {
		List<Community> rtn = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Community>> h = new BeanListHandler<>(Community.class);
			rtn = qr.query(QM.get("selectCommunity"), h);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}

		return rtn;
	}
	
//	public List<Community> selectList(){
//		List<Community> rtn = new ArrayList<>();
//
//		try {
//			QueryRunner qr = new QueryRunner(dataSource);
//			ResultSetHandler<List<Community>> h = new BeanListHandler<>(Community.class);
//			rtn = qr.query(QM.get("selectCummunity"), h);
//		} catch (SQLException sqle) {
//			sqle.printStackTrace();
//		}
//
//		return rtn;
//	}
//	
//	public Community selectCommunityById(int id) {
//		Community rtn = null;
//
//		try {
//			QueryRunner qr = new QueryRunner(dataSource);
//			ResultSetHandler<Community> h = new BeanHandler<>(Community.class);
//			Object[] p = { id };
//			rtn = qr.query(QM.get("selectCommunityById"), h, p);
//		} catch (SQLException sqle) {
//			sqle.printStackTrace();
//		}
//		return rtn;
//	}
	
	/*
	 * public int nextval() { try(Connection c =dataSource.getConnection();
	 * PreparedStatement ps = c.prepareStatement(QM.get("addingnewid")); ){
	 * 
	 * } }
	 */
	
	
	
	
	
}
