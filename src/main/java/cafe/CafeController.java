package cafe;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		}
		
		if(StringUtils.isNotEmpty(view)) {
			getServletContext().getRequestDispatcher(view).forward(request, response);
		}
		
	}
	
	String cafe(HttpServletRequest request, HttpServletResponse response) {
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
	
	

}
