package com.letao.dao.user.impl;


import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.letao.dao.impl.DaoSupport;
import com.letao.dao.user.ICustomerDao;
import com.letao.model.user.Customer;

@Repository("customerDaoBean")
@Transactional
public class CustomerDaoBean extends DaoSupport<Customer> implements ICustomerDao {
	
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public Customer login(String cName, String cPassword) {
		if (cName != null && cPassword != null
				&& !"".equals(cName) && !"".equals(cPassword)) {
			String where = " where cName=? and cPassword=?";
			Object[] queryParams = {cName, cPassword};//设置参数对象数组
			List<Customer> list = find(-1, -1, where, queryParams).getList();
			if(list != null && list.size() > 0){//如果list集合不为空
				return list.get(0);//返回List中的第一个存储对象
			}
		}
		return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public boolean isUnique(String cName) {
		List list = getTemplate().find("from customers where adminName = ?", cName);
		if(list != null && list.size() > 0){
			return false;
		}
		return true;
	}
	

	/**
	 * 添加用户
	 * 
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public void addCustomer(Customer customer) {
		getTemplate().save(customer);
	}

}
