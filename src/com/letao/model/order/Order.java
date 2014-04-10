package com.letao.model.order;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.context.annotation.Scope;

import com.letao.model.OrderState;
import com.letao.model.PaymentWay;
import com.letao.model.user.Customer;

/**
 * 
 * @description 订单表
 * @author ChengBin
 * @date 2013-11-28下午12:07:21
 * @version 1.0
 */
@Entity
@Table(name = "orders")
@Scope(value = "prototype")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String orderId; // 订单编号(手动分配)
	
	@ManyToOne(cascade = { CascadeType.REFRESH, CascadeType.MERGE }, fetch = FetchType.EAGER, optional = false, targetEntity = Customer.class)
	@JoinColumn(name = "customerId")
	private Customer customer;// 所属用户
	private String name;// 收货人姓名
	private String address;// 收货人住址
	private String mobile;// 收货人手机
	private String post;
	
	//mappBy表示关系被维护端，只有关系端有权去更新外键
	//关系中最后一个单词是Many，那么该加载默认为懒加载
	//多的一方为lazy
	@OneToMany(mappedBy = "order", cascade={CascadeType.ALL}, fetch = FetchType.LAZY)
	private Set<OrderItem> orderItems = new HashSet<OrderItem>();// 所买商品
	
	private Float totalPrice;// 总额
	@Enumerated(EnumType.STRING)
	private PaymentWay paymentWay;// 支付方式

	@Enumerated(EnumType.STRING)
	private OrderState orderState;// 订单状态

	@Temporal(TemporalType.TIMESTAMP)
	private Date createTime = new Date();// 创建时间

	private String remarks;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public Float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public PaymentWay getPaymentWay() {
		return paymentWay;
	}

	public void setPaymentWay(PaymentWay paymentWay) {
		this.paymentWay = paymentWay;
	}

	public OrderState getOrderState() {
		return orderState;
	}

	public void setOrderState(OrderState orderState) {
		this.orderState = orderState;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getPost() {
		return post;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setPost(String post) {
		this.post = post;
	}
	
	

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", customer=" + customer
				+ ", name=" + name + ", address=" + address + ", mobile="
				+ mobile + ", post=" + post + ", orderItems=" + orderItems
				+ ", totalPrice=" + totalPrice + ", paymentWay=" + paymentWay
				+ ", orderState=" + orderState + ", createTime=" + createTime
				+ ", remarks=" + remarks + "]";
	}

}
