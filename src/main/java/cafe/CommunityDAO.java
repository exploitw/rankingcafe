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
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class CommunityDAO {

	public int result = 0;
	final static String QUERY_PATH = "/cafe/cafe_queries.properties";
	final static Map<String, String> QM;

	private DataSource dataSource;

	static {
		try {
			QM = QueryLoader.instance().load(QUERY_PATH);
		} catch (IOException ioe) {
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

	public Community selectCommunityById(int id) {
		Community rtn = null;

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<Community> h = new BeanHandler<>(Community.class);
			Object[] p = { id };
			rtn = qr.query(QM.get("selectCommunityById"), h, p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}

		return rtn;
	}

	public List<Object[]> getCustomer() {
		List<Object[]> rtn = new ArrayList<>();

		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
			rtn = qr.query(c, QM.get("getCustomer"), h);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}

		return rtn;

	}

	public int write(Community community) {

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
			Object[] p = {
					community.getCustomerId(),
					community.getTitle(),
					community.getImg(),
					community.getContent(),
					new java.util.Date()
			};

			qr.execute(QM.get("addingnewCommunity"), h, p);

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return result;
	}

	public void updateCommunity(Community community) {

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			Object[] p = {
					community.getTitle(),
					community.getImg(),
					community.getContent(),
					community.getId()
			};
			qr.execute(QM.get("updateCommunity"), p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	
	public void updateCommunityNoImg(Community community) {
		
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			Object[] p = {
					community.getTitle(),
					community.getContent(),
					community.getId()
			};
			qr.execute(QM.get("updateCommunityNoImg"), p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}

	public void deleteCommunity(int id) {

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			Object[] p = { id };
			qr.execute(QM.get("deleteCommunity"), p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	
	public List<Object[]> getCommunityByCustomerId(int id) {
		List<Object[]> rtn = new ArrayList<>();

		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
			Object[] p = { id };
			rtn = qr.query(c, QM.get("getCommunityByCustomerId"), h, p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}

		return rtn;

	}
	
	public void viewCnt(long cnt) {
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			Object[] p = { cnt };
			qr.execute(QM.get("updateViewcnt"), p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
}
