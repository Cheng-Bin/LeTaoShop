package com.letao.model.product;

import java.io.Serializable;
import java.util.Date;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.context.annotation.Scope;

import com.letao.model.user.Customer;

@Entity
@Table(name = "favorite")
@Scope(value = "prototype")
public class Favorite implements Serializable {
	private static final long serialVersionUID = 4168361960884601723L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="productId")
	private int productId;

	@Temporal(TemporalType.TIMESTAMP)
	private Date addTime = new Date();

	@ManyToOne(optional = false, fetch = FetchType.LAZY, cascade = {
			CascadeType.PERSIST, CascadeType.REFRESH })
	@JoinColumn(name = "customerId")
	private Customer customer;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

}
