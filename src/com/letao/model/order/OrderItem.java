package com.letao.model.order;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.context.annotation.Scope;

/**
 * 
 * @description 订单条目
 * @author ChengBin
 * @date 2013-11-28下午12:10:32
 * @version 1.0
 */
@Entity
@Table(name = "orderItem")
@Scope(value = "prototype")
public class OrderItem implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="orderItemId")
	private Integer itemId;// 商品条目编号
	private Integer productId;// 商品id
	private String productName;// 商品名称
	private Float productPrice;// 商品销售价格
	private Integer amount = 1;// 购买数量
	@Transient
	private String path;
	
	//字段不能为空
	////一的一方为EAGER
	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.REFRESH}, optional=false, fetch=FetchType.EAGER ) 
	@JoinColumn(name="orderId")
	private Order order;// 所属订单

	

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Float getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Float productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "OrderItem [itemId=" + itemId + ", productId=" + productId
				+ ", productName=" + productName + ", productPrice="
				+ productPrice + ", amount=" + amount + ", path=" + path
				+ ", order=" + order + "]";
	}	
	

}
