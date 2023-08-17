package cafe;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

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

	public int nextval() {
		try (Connection c = dataSource.getConnection();
				PreparedStatement ps = c.prepareStatement(QM.get("addingnewId"));) {
			try (ResultSet rs = ps.executeQuery();) {
				while (rs.next()) {
					result = rs.getInt("MAX(bbsId)");
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
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

		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
			Object[] p = { community.getCustomerId(), community.getTitle(), community.getImg(), community.getContent(),
					new java.util.Date() };

			qr.execute(c, QM.get("addingnewCommunity"), h, p);

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return result;
	}

}
