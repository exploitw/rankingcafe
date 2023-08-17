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
}
