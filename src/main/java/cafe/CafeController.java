package cafe;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

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
       
   
    public CafeController() {
       customerService = new CustomerService();
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
		case "login":
			login(request,response);
			break;
		case "logout":
			logout(request,response);
			break;
		}
		
		if(StringUtils.isNotEmpty(view)) {
			getServletContext().getRequestDispatcher(view).forward(request, response);
		}
		
	}
	
	String cafe(HttpServletRequest request, HttpServletResponse response) {
		return "/cafe/login.jsp";
						
	}
	
	void join(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Customer customer = new Customer();
		
		try {
			BeanUtils.populate(customer, request.getParameterMap());
			customerService.join(customer);
		}catch(IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		response.sendRedirect("/rankingcafe/cafe/login.jsp");
	}
	
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
