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
		public void login(String email,String password) {
			customerDao.login(email, password);
		}
}
