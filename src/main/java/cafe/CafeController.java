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
		case "write":
			write(request,response);
			break;
		case "read":
			read(request,response);
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
	
	void login(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		CustomerDAO customerDao = new CustomerDAO();
		int loginResult = customerDao.login(email, password);
		
		if(loginResult == 1) {
			request.setAttribute("loginResult", loginResult);
			HttpSession session = request.getSession();
			
			session.setAttribute("sessionEMAIL", email);
			
			Customer customer = customerDao.getCustomerByEmail(email);
			session.setAttribute("customerId", customer.getId());
			
			
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
	
	String read(HttpServletRequest request, HttpServletResponse response){
		List<Object[]> customerList = communityService.getCustomer();
		 
		 request.setAttribute("customerList", customerList);
		System.out.println(customerList);
		
		return "/rankingcafe/cafe/index.jsp";
	}
	
	
	String write (HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		
		  HttpSession session = request.getSession();
		  String sessionEMAIL = (String)  session.getAttribute("sessionEMAIL");
		  Long customerId = (Long) session.getAttribute("customerId");
		  
		  if (sessionEMAIL == null) { sessionEMAIL = "비회원"; }
		  
		  
		  Community community = new Community();
		  
		  try {
			  BeanUtils.populate(community, request.getParameterMap());
			  community.setCustomerId(customerId);
		  communityService.write(community); 
		  }catch(IllegalAccessException |
		  InvocationTargetException e) { e.printStackTrace(); }
		 
		
		/*
		 * HttpSession session = request.getSession(); Customer customer = (Customer)
		 * request.getSession().getAttribute("CUSTOMER"); int sessionCustomerId =
		 * (Integer) session.getAttribute("sessionCustomerId"); //if (sessionCustomerId
		 * == null) { sessionCustomerId = "비회원"; }
		 * 
		 * 
		 * String title = request.getParameter("title"); String content =
		 * request.getParameter("content");
		 * 
		 * 
		 * Community community = new Community();
		 * 
		 * community.setCustomerId(sessionCustomerId); community.setTitle(title);
		 * community.setContent(content);
		 */
		

		//communityService.write(community);
		return "/rankingcafe/cafe/index.jsp";
		 
		
		 
	}
	

}
