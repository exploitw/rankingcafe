package cafe;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;


@WebServlet("/cafe")
public class CafeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CustomerService customerService;
	CommunityService communityService;
       
   
    public CafeController() {
       customerService = new CustomerService();
       communityService = new CommunityService();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = StringUtils.defaultIfEmpty(request.getParameter("action"), "cafe");
		String view = "";
		
		switch(action) {
		
		case"cafe":
			view = cafe(request,response);
			break;
		case "join" :
			join(request,response);
			break;
		case "rs" :
			view = rs(request,response);
			break;
		case "login":
			login(request,response);
			break;
		case "logout":
			logout(request,response);
			break;
		case"community":
			view = community(request,response);
			break;
		}
		
		if(StringUtils.isNotEmpty(view)) {
			getServletContext().getRequestDispatcher(view).forward(request, response);
		}
		
	}
	
	String community(HttpServletRequest request, HttpServletResponse response) {
		boolean hasOrdering = Boolean
				.parseBoolean(StringUtils.defaultIfEmpty(request.getParameter("hasOrdering"), "false"));
		List<Community> communityList = communityService.getCommunity();

		request.setAttribute("hasOrdering", hasOrdering);
		request.setAttribute("communityList", communityList);

		return "/cafe/community.jsp";
	}
	
	String cafe(HttpServletRequest request, HttpServletResponse response) {
		return "/cafe/login.jsp";
						
	}
	String rs(HttpServletRequest request, HttpServletResponse response) {
		return "/cafe/signUp.jsp";
		
	}
	
	void join(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Customer customer = new Customer();
		
		try {
			BeanUtils.populate(customer, request.getParameterMap());
			customerService.join(customer);
		}catch(IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		response.sendRedirect("cafe");
	}
	
//	void join(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//		Customer customer = new Customer();
//		CustomerDAO customerDao = CustomerDAO.getInstance();
//		String email = request.getParameter("email");
//
//		/*
//		 * try { BeanUtils.populate(customer, request.getParameterMap());
//		 * customerService.join(customer); } catch (IllegalAccessException |
//		 * InvocationTargetException e) { e.printStackTrace(); }
//		 */
//
//		int joinResult = customerDao.join(customer);
//
//		if (joinResult == 1) {
//			request.setAttribute("joinResult", joinResult);
//			HttpSession session = request.getSession();
//			session.setAttribute("sessionEMAIL", email);
//			RequestDispatcher rd = request.getRequestDispatcher("/cafe/index.jsp");
//			rd.forward(request, response);
//		} else {
//			request.setAttribute("joinResult", 0);
//			RequestDispatcher rd = request.getRequestDispatcher("/cafe/signUp.jsp");
//			rd.forward(request, response);
//		}
//	}
	
	void login(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nickName = request.getParameter("nickName");
		
		CustomerDAO customerDao = new CustomerDAO();
		int loginResult = customerDao.login(email, password);
		
		if(loginResult == 1) {
			request.setAttribute("loginResult", loginResult);
			HttpSession session = request.getSession();
			HttpSession session1 = request.getSession();
			session.setAttribute("sessionEMAIL", email);
			session1.setAttribute("sessionnickName", nickName);
			RequestDispatcher rd = request.getRequestDispatcher("/cafe/index.jsp");
			rd.forward(request, response);
			
		}else {
			request.setAttribute("loginResult", loginResult);
			RequestDispatcher rd = request.getRequestDispatcher("/cafe/signUp.jsp");
			rd.forward(request, response);

		}
	}
	
	void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		RequestDispatcher rd = request.getRequestDispatcher("/cafe/login.jsp");
		rd.forward(request, response);
		
	}
	

}
