package com.letao.dao.order.impl;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.letao.dao.impl.DaoSupport;
import com.letao.dao.order.IOrderDao;
import com.letao.model.order.Order;

/**
 * 
 * @description ����Dao
 * @author ChengBin
 * @date   2013-11-28����1:08:29
 * @version 1.0
 */
@Repository(value="orderDaoBean")
@Scope(value="prototype")
public class OrderDaoBean extends DaoSupport<Order> implements IOrderDao {

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public void saveOrder(Order order) {
		save(order);
	}
	
	

}
