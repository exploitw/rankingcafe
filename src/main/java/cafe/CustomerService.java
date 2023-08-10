package cafe;

import javax.servlet.http.HttpServletResponse;

public class CustomerService {
		CustomerDAO customerDao;
		
		public CustomerService() {
			customerDao = new CustomerDAO();
		}
		
		public void join(Customer customer) {
			customerDao.join(customer);
		}

		public void emailOverlap(String email, HttpServletResponse response) {
			Customer = new Customer();
			Customer = customerDao.emailOverlap(email);
			if(Customer == null) {
				//dao에서 select이 되지 않아야 true
				//id가 없어야 true(사용 가능)
				response.getWriter().print("1");
			}else {
				//id가 있으면 false(중복으로 사용 불가능)
				response.getWriter().print("0");
			}			
		}
}
