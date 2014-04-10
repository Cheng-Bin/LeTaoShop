package com.letao.util.hibernate;

import com.letao.model.OrderState;

/**
 * 
 * @description 订单状态Hibernate映射类型
 * @author ChengBin
 * @date   2013-11-28下午12:34:18
 * @version 1.0
 */
public class OrderStateType extends EnumType<OrderState> {
	public OrderStateType() {
		super(OrderState.class);
	}
}
