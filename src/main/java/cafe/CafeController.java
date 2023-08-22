package cafe;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
@MultipartConfig(maxFileSize = 1024 * 1024 * 2, location = "c:/Temp/img")
public class CafeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CustomerService customerService;
	CommunityService communityService;
	CommentService commentService;
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

		case "home":
			view = home(request, response);
			break;
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
		case "myCommunityInfo":
			view = myCommunityInfo(request, response);
			break;
		case "communityInfoUpdate":
			view = communityInfoUpdate(request, response);
			break;
		case "myCommunityInfoUpdate":
			view = myCommunityInfoUpdate(request, response);
			break;
		case "write":
			write(request, response);
			break;
		case "writing":
			view = writing(request, response);
			break;
		case "updateCommunity":
			updateCommunity(request, response);
			break;
		case "deleteCommunity":
			deleteCommunity(request, response);
			break;
		case "deleteMyCommunity":
			deleteMyCommunity(request, response);
			break;
		case "read":
			read(request, response);
			break;
		case "myPage":
			view = mypage(request, response);
			break;
		case "myPage2":
			view = mypage2(request, response);
			break;
		case "myPage3":
			view = mypage3(request, response);
			break;
		case "myPage3_1":
			view = mypage3_1(request, response);
			break;
		case "updateCustomer":
			updateCustomer(request, response);
			break;
		case "deleteCustomer":
			deleteCustomer(request, response);
			break;
		case "insertCafe":
			insertCafe(request, response);
			break;
		case "cafeList":
			view = cafeList(request, response);
			break;
		case "cafeInfo":
			view = cafeInfo(request, response);
			break;
		case "cafeInfoUpdate":
			view = cafeInfoUpdate(request, response);
			break;
		case "updateCafe":
			updateCafe(request,response);
			break;
		case "deleteCafe":
			deleteCafe(request,response);
			break;
		case "insertReview":
			insertReview(request, response);
			break;
		case "updateReview":
			updateReview(request,response);
			break;
		case "deleteReview":
			deleteReview(request,response);
			break;
		case "reviewInfoUpdate":
			view = reviewInfoupdate(request,response);
			break;
		}

		if (StringUtils.isNotEmpty(view)) {
			getServletContext().getRequestDispatcher(view).forward(request, response);
		}
	}
  
	String reviewInfoupdate(HttpServletRequest request, HttpServletResponse response) {
		int customerId = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("customerId"), "-1"));

		Review review = reviewService.getReviewByCustomerId(customerId);
		request.setAttribute("review", review);

		return "/cafe/reviewInfoUpdate.jsp";
	}
  
	void deleteReview(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
		Review review = new Review();
		reviewService.remove(id);
		response.sendRedirect("cafe?action=cafeInfo&id="+review.getCafeId());
	}

	void updateReview(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		Review review = new Review();

		try {
			Part part = request.getPart("file");
			String fileName = getFilename(part);
			if(fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
				BeanUtils.populate(review, request.getParameterMap());
				review.setImg("/img/"+fileName);
				reviewService.set(review);
			}else  {
				BeanUtils.populate(review, request.getParameterMap());
				review.setImg("/img/"+review.getImg());
				reviewService.setNoImg(review);				
			}
			response.sendRedirect("cafe?action=cafeInfo&id="+review.getCafeId());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	void insertReview (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		Review review = new Review();
		HttpSession session = request.getSession();
		Long customerId = (Long) session.getAttribute("customerId");

		try {
			Part part = request.getPart("file");
			String fileName = getFilename(part);
			if (fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
			}

			BeanUtils.populate(review, request.getParameterMap());
			review.setCustomerId(customerId);
			review.setImg("/img/" + fileName);
			reviewService.insertReview(review);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		response.sendRedirect("cafe?action=cafeInfo&id=" + review.getCafeId());
	}

	String home(HttpServletRequest request, HttpServletResponse response) {
		return "/cafe/index.jsp";
	}

	String cafeInfo(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
//		int cafeId = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("cafeId"), "-1"));

		Cafe cafe = cafeService.getCafeById(id);
		// Review review = reviewService.getReviewBycafeId(cafeId);
		// List<Review> reviewList = reviewService.getReview(cafeId);
		List<Review> reviewsList = reviewService.getReviewsByCafeId(id);

		request.setAttribute("reviewsList", reviewsList);
		request.setAttribute("cafe", cafe);
		// request.setAttribute("review", review);

		return "/cafe/cafeInfo.jsp";
	}
  
	String cafeList(HttpServletRequest request, HttpServletResponse response) {

		List<Cafe> cafeList = cafeService.getCafe();

		request.setAttribute("cafeList", cafeList);

		return "/cafe/cafeList.jsp";
	}
  
	void deleteCafe(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));

		cafeService.remove(id);
		response.sendRedirect("cafe?action=cafeList");
	}

	void updateCafe(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		Cafe cafe = new Cafe();

		try {
			Part part = request.getPart("file");
			String fileName = getFilename(part);
			if(fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
				BeanUtils.populate(cafe, request.getParameterMap());
				cafe.setImg("/img/"+fileName);
				cafeService.set(cafe);
			}else  {
				BeanUtils.populate(cafe, request.getParameterMap());
				cafe.setImg("/img/"+cafe.getImg());
				cafeService.setNoImg(cafe);
			}
			response.sendRedirect("cafe?action=cafeList");
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}
  
	String cafeInfoUpdate(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));

		Cafe cafe = cafeService.getCafeById(id);
		request.setAttribute("cafe", cafe);

		return "/cafe/cafeInfoUpdate.jsp";
	}
  
	void insertCafe(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Cafe cafe = new Cafe();

		try {
			Part part = request.getPart("file");
			String fileName = getFilename(part);
			if (fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
			}

			BeanUtils.populate(cafe, request.getParameterMap());
			cafe.setImg("/img/" + fileName);
			cafeService.insertCafe(cafe);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		response.sendRedirect("cafe?action=cafeList");
	}

	private String getFilename(Part part) {
		String fileName = null;

		String header = part.getHeader("content-disposition");
		// System.out.println("Header => " + header);

		int start = header.indexOf("filename=");
		fileName = header.substring(start + 10, header.length() - 1);

		return fileName;
	}

	String mypage(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));

		Customer customer = customerService.getCustomerById(id);
		List<Object[]> communityListByCust = communityService.getCommunityByCustomerId(id);
		request.setAttribute("customer", customer);
		request.setAttribute("communityListByCust", communityListByCust);

		return "/cafe/myPage1.jsp";
	}
	String mypage2(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));

		Customer customer = customerService.getCustomerById(id);
		List<Object[]> communityListByCust = communityService.getCommunityByCustomerId(id);
		request.setAttribute("customer", customer);
		request.setAttribute("communityListByCust", communityListByCust);

		return "/cafe/myPage2.jsp";
	}
	String mypage3(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));

		Customer customer = customerService.getCustomerById(id);
		
		request.setAttribute("customer", customer);
		
		List<String> customerJson = new ArrayList<>();
		customerJson.add(customer.toJsonString());
		
		String jsonArrayStringCustomer = StringUtils.join(customerJson);
		request.setAttribute("jsonArrayStringCustomer", jsonArrayStringCustomer);

		return "/cafe/myPage3.jsp";
	}
	
	String mypage3_1(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));

		Customer customer = customerService.getCustomerById(id);
		
		request.setAttribute("customer", customer);
		
		List<String> customerJson = new ArrayList<>();
		customerJson.add(customer.toJsonString());
		
		String jsonArrayStringCustomer = StringUtils.join(customerJson);
		request.setAttribute("jsonArrayStringCustomer", jsonArrayStringCustomer);

		return "/cafe/myPage3-1.jsp";
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
			response.sendRedirect("cafe?action=myPage3&id=" + customer.getId());
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
		CommentDAO mentDao = new CommentDAO();
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
		Community community = comuDao.selectCommunityById(id);
		List<Customer> customerList = customerService.getCustomer();
		Comment commentList = mentDao.selectCommentById(id);
		request.setAttribute("community", community);
		request.setAttribute("customerList", customerList);
		request.setAttribute("commentList", commentList);

		return "/cafe/communityInfo.jsp";
	}
	
	String myCommunityInfo(HttpServletRequest request, HttpServletResponse response) {
		CommunityDAO comuDao = new CommunityDAO();
		CommentDAO mentDao = new CommentDAO();
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
		Community community = comuDao.selectCommunityById(id);
		List<Customer> customerList = customerService.getCustomer();
		Comment commentList = mentDao.selectCommentById(id);
		request.setAttribute("community", community);
		request.setAttribute("customerList", customerList);
		request.setAttribute("commentList", commentList);

		return "/cafe/myCommunityInfo.jsp";
	}

	private String communityInfoUpdate(HttpServletRequest request, HttpServletResponse response) {
		CommunityDAO comuDao = new CommunityDAO();
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
		Community community = comuDao.selectCommunityById(id);
		List<Customer> customerList = customerService.getCustomer();
		request.setAttribute("community", community);
		request.setAttribute("customerList", customerList);

		return "/cafe/communityInfoUpdate.jsp";
	}
	
	private String myCommunityInfoUpdate(HttpServletRequest request, HttpServletResponse response) {
		CommunityDAO comuDao = new CommunityDAO();
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
		Community community = comuDao.selectCommunityById(id);
		List<Customer> customerList = customerService.getCustomer();
		request.setAttribute("community", community);
		request.setAttribute("customerList", customerList);

		return "/cafe/communityInfoUpdate.jsp";
	}

	void updateCommunity(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
			if (fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
			}

			BeanUtils.populate(community, request.getParameterMap());
			community.setCustomerId(customerId);
			community.setImg("/img/" + fileName);
			communityService.setCommunity(community);
			response.sendRedirect("cafe?action=communityInfo&id=" + community.getId());
//			response.sendRedirect("javascript:history.back()");
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	void deleteCommunity(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
		communityService.removeCommunity(id);
		response.sendRedirect("cafe?action=community");
	}
	
	void deleteMyCommunity(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
		communityService.removeCommunity(id);
		response.sendRedirect("cafe?action=myPage");
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
		// System.out.println(customerList);

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
			if (fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
			}

			BeanUtils.populate(community, request.getParameterMap());
			community.setCustomerId(customerId);
			community.setImg("/img/" + fileName);
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