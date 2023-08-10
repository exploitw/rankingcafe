package cafe;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryLoader;
import org.apache.commons.dbutils.QueryRunner;

public class CustomerDAO {
	final static String QUERY_PATH = "/cafe/cafe_queries.properties";
	final static Map<String, String> QM;
	private static CustomerDAO customerDao;

	private DataSource dataSource;
	private int result;
	
	static {
		try {
			QM = QueryLoader.instance().load(QUERY_PATH);
		}catch (IOException ioe) {
			ioe.printStackTrace();
			
			throw new ExceptionInInitializerError(ioe);
		}
	}
	
	public static synchronized CustomerDAO getInstance() {
		if (customerDao == null) {
			customerDao = new CustomerDAO();
		}
		return customerDao;
	}

	public CustomerDAO() {
		try {
			Context initialContext = new InitialContext();
			Context envContext = (Context) initialContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/cafedb");
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
	}

	public int join(Customer customer) {
		try (Connection c = dataSource.getConnection();) {
			QueryRunner qr = new QueryRunner();
			Object[] p = { customer.getName(), customer.getEmail(), customer.getPassword(), customer.getNickName(),
					customer.getAddress(), customer.getPhone() };
			result = qr.execute(c, QM.get("insertCustomer"), p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return result;
	}
	
	
public int login(String email, String password) {
		
		
		try(Connection c =dataSource.getConnection();
				PreparedStatement ps = c.prepareStatement(QM.get("loginCustomer"));
				){
			ps.setString(1, email);
			try(ResultSet rs = ps.executeQuery();){
				if(rs.next()) if(rs.getString("password").equals(password)) {
					return 1;
				} else {
					return 0;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return -1;
	}
}
