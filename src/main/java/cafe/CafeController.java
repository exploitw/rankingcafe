package cafe;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;

@WebServlet("/cafe")
@MultipartConfig(maxFileSize=1024*1024*2,location="c:/Temp/img")
public class CafeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	CustomerService customerService;
	CommunityService communityService;
	CafeService cafeService;
	ReviewService reviewService;
	
	public CafeController() {
		customerService = new CustomerService();
		communityService = new CommunityService();
		cafeService = new CafeService();
		reviewService = new ReviewService();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = StringUtils.defaultIfEmpty(request.getParameter("action"), "cafe");
		String view = "";

		switch (action) {

		case "cafe":
			view = cafe(request, response);
			break;
		case "join":
			join(request, response);
			break;
		case "signup":
			view = signup(request, response);
			break;
		case "login":
			login(request, response);
			break;
		case "logout":
			logout(request, response);
			break;
		case "community":
			view = community(request, response);
			break;
		case "communityInfo":
			view = communityInfo(request, response);
			break;
		case "write":
			write(request, response);
			break;
		case "writing":
			view = writing(request, response);
			break;
		case "read":
			read(request, response);
		case "mypage":
			view = mypage(request, response);
			break;
		case "updateCustomer":
			updateCustomer(request, response);
			break;
		case "deleteCustomer":
			deleteCustomer(request, response);
			break;
		case "insertCafe":
			insertCafe(request,response);
			break;
		case "cafeList":
			view = cafeList(request,response);
			break;
		case "cafeInfo":
			view = cafeInfo(request,response);
			break;
		case "insertReview":
			insertReview(request,response);
			break;
		
		}

		if (StringUtils.isNotEmpty(view)) {
			getServletContext().getRequestDispatcher(view).forward(request, response);
		}
	}
	
	
	void insertReview (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		Review review = new Review();
		HttpSession session = request.getSession();
		Long customerId = (Long) session.getAttribute("customerId");
		
		try {
			Part part = request.getPart("file");
			String fileName = getFilename(part);
			if(fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
			}
			
			BeanUtils.populate(review, request.getParameterMap());
			review.setCustomerId(customerId);
			review.setImg("/img/"+fileName);
			reviewService.insertReview(review);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		response.sendRedirect("cafe?action=cafeInfo&id="+review.getCafeId());
	}
	
	
	String cafeInfo(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
		int cafeId = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("cafeId"), "-1"));
		
		
		
		Cafe cafe  = cafeService.getCafeById(id);
		//Review review = reviewService.getReviewBycafeId(cafeId);
		//List<Review> reviewList = reviewService.getReview(cafeId);
		List<Review> reviewsList = reviewService.getReviewsByCafeId(id);

		
		request.setAttribute("reviewsList", reviewsList);
		request.setAttribute("cafe", cafe);
		//request.setAttribute("review", review);

		return "/cafe/cafeInfo.jsp";
	}
	
	
	String cafeList(HttpServletRequest request, HttpServletResponse response) {
		
		List<Cafe> cafeList = cafeService.getCafe();

		
		request.setAttribute("cafeList", cafeList);

		return "/cafe/cafeList.jsp";
	}
	
	
	
		void insertCafe(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		
		Cafe cafe = new Cafe();

		try {
			Part part = request.getPart("file");
			String fileName = getFilename(part);
			if(fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
			}
			
			BeanUtils.populate(cafe, request.getParameterMap());
			cafe.setImg("/img/"+fileName);
			cafeService.insertCafe(cafe);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		response.sendRedirect("cafe/cafeList.jsp");
	}
	

	private String getFilename(Part part) {
		String fileName = null;

		String header = part.getHeader("content-disposition");
		//System.out.println("Header => " + header);

		int start = header.indexOf("filename=");
		fileName = header.substring(start + 10, header.length() - 1);
		
		return fileName;
	}

	String mypage(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));

		Customer customer = customerService.getCustomerById(id);
		request.setAttribute("customer", customer);

		return "/cafe/mypage.jsp";
	}

	void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));

		customerService.remove(id);
		response.sendRedirect("cafe?action=logout");

	}

	void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {

		Customer customer = new Customer();

		try {
			BeanUtils.populate(customer, request.getParameterMap());

			customerService.set(customer);
			response.sendRedirect("cafe?action=mypage&id="+customer.getId());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	String community(HttpServletRequest request, HttpServletResponse response) {
		boolean hasOrdering = Boolean
				.parseBoolean(StringUtils.defaultIfEmpty(request.getParameter("hasOrdering"), "false"));
		List<Community> communityList = communityService.getCommunity();
		List<Customer> customerList = customerService.getCustomer();

		request.setAttribute("hasOrdering", hasOrdering);
		request.setAttribute("communityList", communityList);
		request.setAttribute("customerList", customerList);

		return "/cafe/communityList.jsp";
	}
	

	String communityInfo(HttpServletRequest request, HttpServletResponse response) {
		CommunityDAO comuDao = new CommunityDAO();
		CustomerDAO custDao = new CustomerDAO();
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
		Community community = comuDao.selectCommunityById(id);
		Customer customer = custDao.getCustomerById(id);
		List<Customer> customerList = customerService.getCustomer();
		request.setAttribute("community", community);
		request.setAttribute("customerList", customerList);
		
		return "/cafe/communityInfo.jsp";
	}


	String cafe(HttpServletRequest request, HttpServletResponse response) {
		return "/cafe/login.jsp";

	}

	String signup(HttpServletRequest request, HttpServletResponse response) {
		return "/cafe/signUp.jsp";

	}

	void join(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Customer customer = new Customer();

		try {
			BeanUtils.populate(customer, request.getParameterMap());
			customerService.join(customer);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		response.sendRedirect("cafe");
	}

	void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nickName = request.getParameter("nickName");
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));

		Customer customer1 = customerService.getCustomerById(id);

		request.setAttribute("customer1", customer1);

		CustomerDAO customerDao = new CustomerDAO();
		int loginResult = customerDao.login(email, password);

		if (loginResult == 1) {
			request.setAttribute("loginResult", loginResult);
			HttpSession session = request.getSession();

			session.setAttribute("sessionEMAIL", email);

			Customer customer = customerDao.getCustomerByEmail(email);
			session.setAttribute("customerId", customer.getId());

			RequestDispatcher rd = request.getRequestDispatcher("/cafe/index.jsp");
			rd.forward(request, response);

		} else {
			request.setAttribute("loginResult", loginResult);
			RequestDispatcher rd = request.getRequestDispatcher("/cafe/login.jsp");
			rd.forward(request, response);
		}
	}

	void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		response.sendRedirect("cafe");
	}

	String read(HttpServletRequest request, HttpServletResponse response) {
		List<Object[]> customerList = communityService.getCustomer();

		request.setAttribute("customerList", customerList);
		//System.out.println(customerList);

		return "/rankingcafe/cafe/index.jsp";
	}

	void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String sessionEMAIL = (String) session.getAttribute("sessionEMAIL");
		Long customerId = (Long) session.getAttribute("customerId");

		if (sessionEMAIL == null) {
			sessionEMAIL = "비회원";
		}

		Community community = new Community();

		try {
			Part part = request.getPart("file");
			String fileName = getFilename(part);
			if(fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
			}
			
			
			BeanUtils.populate(community, request.getParameterMap());
			community.setCustomerId(customerId);
			community.setImg("/img/"+fileName);
			communityService.write(community);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("cafe?action=community");
	}
  
	String writing(HttpServletRequest request, HttpServletResponse response) {
		return "/cafe/write.jsp";
	}
}