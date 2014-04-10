package com.letao.dao.user;

import com.letao.dao.BaseDao;
import com.letao.model.user.Customer;

public interface ICustomerDao extends BaseDao<Customer> {
	
	/**
	 * �û���¼
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public Customer login(String username, String password);
	
	/**
	 * �û�
	 * 
	 * @param username
	 * @return
	 */
	public boolean isUnique(String username);
	
	/**
	 * ����û�
	 * 
	 * @param customer
	 */
	public void addCustomer(Customer customer);
	
}
