package com.letao.model.user;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.letao.model.product.Favorite;


@Entity
@Table(name="customers")
public class Customer implements Serializable {

	private static final long serialVersionUID = 1L;
	
	
	private int cusId;
	private String cusName;
	private String cusPassword;
	private String cusRealName;
	private char cusSex;
	private String cusAddress;
	private String cusEmail;
	private String cusMobile;
	private Date cusBirthday;
	private String post;
	private Set<Favorite> favorite;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="cId")
	public int getCusId() {
		return cusId;
	}
	
	public void setCusId(int cusId) {
		this.cusId = cusId;
	}
	
	
	@Column(name="cName")
	public String getCusName() {
		return cusName;
	}
	
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	
	@Column(name="cPassword")
	public String getCusPassword() {
		return cusPassword;
	}
	
	public void setCusPassword(String cusPassword) {
		this.cusPassword = cusPassword;
	}
	
	@Column(name="cRealName")
	public String getCusRealName() {
		return cusRealName;
	}
	
	public void setCusRealName(String cusRealName) {
		this.cusRealName = cusRealName;
	}
	
	@Column(name="cSex")
	public char getCusSex() {
		return cusSex;
	}
	
	public void setCusSex(char cusSex) {
		this.cusSex = cusSex;
	}
	
	@Column(name="cAddress", columnDefinition="")
	public String getCusAddress() {
		return cusAddress;
	}
	
	public void setCusAddress(String cusAddress) {
		this.cusAddress = cusAddress;
	}
	
	@Column(name="cEmail", columnDefinition="")
	public String getCusEmail() {
		return cusEmail;
	}
	
	public void setCusEmail(String cusEmail) {
		this.cusEmail = cusEmail;
	}
	
	@Column(name="cMobile", columnDefinition="")
	public String getCusMobile() {
		return cusMobile;
	}
	
	public void setCusMobile(String cusMobile) {
		this.cusMobile = cusMobile;
	}
	
	@Column(name="cBirthday", columnDefinition="1990-10-10")
	@Temporal(TemporalType.DATE)
	public Date getCusBirthday() {
		return cusBirthday;
	}
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="customer", cascade=CascadeType.ALL)
	public Set<Favorite> getFavorite() {
		return favorite;
	}

	public void setFavorite(Set<Favorite> favorite) {
		this.favorite = favorite;
	}

	public void setCusBirthday(Date cusBirthday) {
		this.cusBirthday = cusBirthday;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public Customer(){}

	
}
