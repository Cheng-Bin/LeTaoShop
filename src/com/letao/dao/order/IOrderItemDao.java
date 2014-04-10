package com.letao.dao.order;

import com.letao.dao.BaseDao;
import com.letao.model.order.OrderItem;

public interface IOrderItemDao extends BaseDao<OrderItem>{

	public void saveOrderItem(OrderItem item);
}
