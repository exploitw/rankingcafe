package rankingcafe;

public class CustomerService {
		CustomerDAO customerDao;
		
		public CustomerService() {
			customerDao = new CustomerDAO();
		}
		
		public void join(Customer customer) {
			customerDao.join(customer);
		}
}
