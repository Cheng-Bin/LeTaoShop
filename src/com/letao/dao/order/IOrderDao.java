package com.letao.dao.order;

import com.letao.dao.BaseDao;
import com.letao.model.order.Order;

public interface IOrderDao extends BaseDao<Order> {

	public void saveOrder(Order order);
}
