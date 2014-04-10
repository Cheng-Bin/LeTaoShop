package com.letao.model.product;

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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.context.annotation.Scope;

/**
 * 产品信息
 * 
 * @author ChengBin
 * 
 */
@Entity
@Table(name = "product")
@Scope("prototype")
public class Product implements Serializable {
	private static final long serialVersionUID = -7261903436825378776L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pId")
	private int id;
	@Column(name = "pNo")
	private String no;
	@Column(name = "pName")
	private String name; // 商品名称
	@Column(name = "pTag")
	private String tag; // 标签
	private String description; // 描述
	private float basePrice; // 基本价格
	private float marketPrice; // 市场价
	private float sellPrice; // 销售价
	private String sexRequest; // 适合性别
	private boolean commend = false; // 是否是推荐商品（默认值为false）
	private boolean sale = false; // 特价
	private boolean promotion = false; // 促销
	private boolean limit = false; // 限量
	private int clickCount; // 访问量（统计受欢迎的程度）
	private int sellCount; // 销售数量（统计热销商品）
	@Column(name="pCount")
	private int count; // 库存

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "categoryId")
	private ProductCategory category; // 类别ID

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional = true, targetEntity = UploadFile.class)
	@JoinColumn(name = "uploadFile")
	private UploadFile uploadFile;// 图片ID

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="productId", fetch=FetchType.LAZY)
	private Set<Comment> comment;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date addTime; // 上架时间
	private String addAuthor; // 添加人

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getBasePrice() {
		return basePrice;
	}

	public void setBasePrice(float basePrice) {
		this.basePrice = basePrice;
	}

	public float getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(float marketPrice) {
		this.marketPrice = marketPrice;
	}

	public float getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(float sellPrice) {
		this.sellPrice = sellPrice;
	}

	public String getSexRequest() {
		return sexRequest;
	}

	public void setSexRequest(String sexRequest) {
		this.sexRequest = sexRequest;
	}

	public boolean isCommend() {
		return commend;
	}

	public void setCommend(boolean commend) {
		this.commend = commend;
	}

	public boolean isSale() {
		return sale;
	}

	public void setSale(boolean sale) {
		this.sale = sale;
	}

	public boolean isPromotion() {
		return promotion;
	}

	public void setPromotion(boolean promotion) {
		this.promotion = promotion;
	}

	public boolean isLimit() {
		return limit;
	}

	public void setLimit(boolean limit) {
		this.limit = limit;
	}

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

	public int getSellCount() {
		return sellCount;
	}

	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public ProductCategory getCategory() {
		return category;
	}

	public void setCategory(ProductCategory category) {
		this.category = category;
	}

	public UploadFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(UploadFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public String getAddAuthor() {
		return addAuthor;
	}

	public void setAddAuthor(String addAuthor) {
		this.addAuthor = addAuthor;
	}


	public Set<Comment> getComment() {
		return comment;
	}

	public void setComment(Set<Comment> comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "[id=" + id + "]";
	}
	
	

}
