package com.letao.dao.order.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.letao.dao.impl.DaoSupport;
import com.letao.dao.order.IOrderItemDao;
import com.letao.model.order.OrderItem;

/**
 * 
 * @description 订单条目dao
 * @author ChengBin
 * @date   2013-11-28下午1:08:11
 * @version 1.0
 */
@Repository(value="orderItemDaoBean")
public class OrderItemDaoBean extends DaoSupport<OrderItem> implements IOrderItemDao {

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public void saveOrderItem(OrderItem item) {
		save(item);
	}

}
