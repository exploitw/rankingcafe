package cafe;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryLoader;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;

import p3.Book;

public class CustomerDAO {
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
	
	public CustomerDAO() {
		 try {
	            Context initialContext = new InitialContext();
	            Context envContext = (Context) initialContext.lookup("java:/comp/env");
	            dataSource = (DataSource) envContext.lookup("jdbc/cafedb");
	        } catch (NamingException ne) {
	            ne.printStackTrace();
	        }
	}
	
	public void join(Customer customer) {
		try( Connection c = dataSource.getConnection();) {
			 QueryRunner qr = new QueryRunner();
			 Object[] p = {
					 customer.getName(),
					 customer.getEmail(),
					 customer.getPassword(),
					 customer.getNickName(),
					 customer.getAddress(),
					 customer.getPhone()};
			 qr.execute(c, QM.get("insertCustomer"),p);
			
			
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	
	public void emailOverlap(Customer customer) {
		Customer rtn = null;

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<Customer> h = new BeanHandler<>(Book.class);
			Object[] p = { id };
			rtn = qr.query(QM.get("selectBookById"), h, p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}

		return rtn;
	}
	
	
	
}
