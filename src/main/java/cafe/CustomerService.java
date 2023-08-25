package cafe;

import java.util.List;





public class CustomerService {
		CustomerDAO customerDao;
		
		public CustomerService() {
			customerDao = new CustomerDAO();
		}
		
		public List<Customer> getCustomer(){
			return customerDao.getCustomer();
		}
		
		public void join(Customer customer) {
			customerDao.join(customer);
		}
		public void login(String email,String password) {
			customerDao.login(email, password);
		}
		
		public Customer getCustomerById(int id) {
			Customer rtn = null;
			
			rtn = customerDao.getCustomerById(id);
			/*
			 * if(rtn == null) { rtn = new Customer(); rtn.setId(-1); rtn.setName("");
			 * rtn.setAddress(""); rtn.setPhone(""); }
			 */
			return rtn;
		}
		
		public void set(Customer customer) {
			customerDao.update(customer);
		}
		
		public void remove(int id) {
			customerDao.delete(id);
		}
		
		public List<Object[]> getCustomerLike(int custId) {
			return customerDao.getCustomerLike(custId);
		}
}
