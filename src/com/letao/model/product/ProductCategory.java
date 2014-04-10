package com.letao.model.product;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.context.annotation.Scope;

/**
 * 产品类型java bean
 * 
 * @author ChengBin
 * 
 */
@Entity
@Table(name = "productCategory")
@Scope(value = "prototype")
public class ProductCategory implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer categoryId;
	private String categoryName;
	private int categoryLevel;
	
	@ManyToOne(fetch = FetchType.LAZY, optional=false)  //多对一，懒加载
	@JoinColumn(name = "pid")			//对应数据库中的字段
	private ProductCategory menu;
	
	//一对多，懒加载，依赖引用表中的menu
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy = "menu", targetEntity=ProductCategory.class)
	@Fetch(FetchMode.SUBSELECT)
	private Set<ProductCategory> child;

	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCategoryLevel() {
		return categoryLevel;
	}

	public void setCategoryLevel(int categoryLevel) {
		this.categoryLevel = categoryLevel;
	}

	public Set<ProductCategory> getChild() {
		return child;
	}

	public void setChild(Set<ProductCategory> child) {
		this.child = child;
	}

	public ProductCategory getMenu() {
		return menu;
	}

	public void setMenu(ProductCategory menu) {
		this.menu = menu;
	}
	
	
	@Override
	public String toString() {
		return "ProductCategory [categoryId=" + categoryId + ", categoryName="
				+ categoryName + ", categoryLevel=" + categoryLevel + ", menu="
				+ menu + ", child=" + child + "]";
	}	

}
