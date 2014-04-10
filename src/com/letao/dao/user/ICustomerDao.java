package com.letao.dao.user;

import com.letao.dao.BaseDao;
import com.letao.model.user.Customer;

public interface ICustomerDao extends BaseDao<Customer> {
	
	/**
	 * 用户登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public Customer login(String username, String password);
	
	/**
	 * 用户
	 * 
	 * @param username
	 * @return
	 */
	public boolean isUnique(String username);
	
	/**
	 * 添加用户
	 * 
	 * @param customer
	 */
	public void addCustomer(Customer customer);
	
}
