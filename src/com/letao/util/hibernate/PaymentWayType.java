package com.letao.util.hibernate;

import com.letao.model.PaymentWay;

/**
 * 
 * @description HibernateÓ³ÉäÀàĞÍ
 * @author ChengBin
 * @date   2013-11-28ÏÂÎç12:34:36
 * @version 1.0
 */
public class PaymentWayType extends EnumType<PaymentWay> {
	public PaymentWayType() {
		super(PaymentWay.class);
	}
}
