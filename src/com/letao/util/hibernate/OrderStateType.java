package com.letao.util.hibernate;

import com.letao.model.OrderState;

/**
 * 
 * @description ����״̬Hibernateӳ������
 * @author ChengBin
 * @date   2013-11-28����12:34:18
 * @version 1.0
 */
public class OrderStateType extends EnumType<OrderState> {
	public OrderStateType() {
		super(OrderState.class);
	}
}
