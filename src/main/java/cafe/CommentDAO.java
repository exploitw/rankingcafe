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
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class CommentDAO {

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

	public CommentDAO() {
		try {
			Context initialContext = new InitialContext();
			Context envContext = (Context) initialContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/cafedb");
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
	}

	public List<Comment> selectComment() {
		List<Comment> rtn = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Comment>> h = new BeanListHandler<>(Comment.class);
			rtn = qr.query(QM.get("selectComment"), h);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return rtn;
	}

	public Comment selectCommentById(int id) {
		Comment rtn = null;

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<Comment> h = new BeanHandler<>(Comment.class);
			Object[] p = { id };
			rtn = qr.query(QM.get("selectCommentById"), h, p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return rtn;
	}

	public int insertComment(Comment comment) {
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
			Object[] p = {
					comment.getCustomerId(),
					comment.getCommunityId(),
					comment.getContent(),
					new java.util.Date()
			};
			qr.execute(QM.get("insertComment"), h, p);

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return result;
	}

	public void updateComment(Comment comment) {
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			Object[] p = { comment.getContent(), comment.getId() };
			qr.execute(QM.get("updateComment"), p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}

	public void deleteComment(int id) {
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			Object[] p = { id };
			qr.execute(QM.get("deleteComment"), p);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
}
