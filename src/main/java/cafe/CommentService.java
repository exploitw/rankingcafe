package cafe;

import java.util.List;

public class CommentService {
	CommentDAO dao;

	public CommentService() {
		dao = new CommentDAO();
	}

	public List<Comment> getComment() {
		return dao.selectComment();
	}

	public void addComment(Comment comment) {
		dao.insertComment(comment);
	}

	public Comment getCommentOrBlank(int id) {
		Comment rtn = null;

		rtn = dao.selectCommentById(id);

		if (rtn == null) {
			rtn = new Comment();
			rtn.setContent("");
		}
		return rtn;
	}

	public void setComment(Comment comment) {
		dao.updateComment(comment);
	}

	public void addOrSetComment(Comment comment) {
		if (comment.getId() == -1) {
			addComment(comment);
		} else {
			setComment(comment);
		}
	}

	public void removeComment(int id) {
		dao.deleteComment(id);
	}
}
