package com.letao.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.letao.model.product.Product;
import com.letao.model.product.ProductCategory;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @description  index action
 * @author ChengBin
 * @date   2013-11-27上午9:59:33
 * @version 1.0
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("indexAction")
@Namespace(value="/")
@Action(value = "index", results = { @Result(name = ActionSupport.SUCCESS, location = "/WEB-INF/pages/index.jsp") })
public class IndexAction extends BaseAction {

	// index action
	@Override
	public String execute() {
		// 查找所有的类别
		categories = productCategoryBean.getCategories();
		// 查找前10件最新的商品
		product_new = productDaoBean.findNewProduct(10).getList();
		// 查找前10件推荐的商品
		product_commend = productDaoBean.findCommend(10).getList();
		product_sale = productDaoBean.findSale(10).getList();
		/*// 查找点击率最高的前10件商品
		product_clickcount = productDaoBean.findClickcount();
		// 查找销售最好的前10件商品
		product_sellCount = productDaoBean.findSellCount();*/
		return SUCCESS;
	}

	
	
	// 商品类别
	private List<ProductCategory> categories;
	// 查找前10件最新的商品
	private List<Product> product_new;
	// 推荐商品
	private List<Product> product_commend;
	// 销售最好的商品
	private List<Product> product_sellCount;
	// 人气最高的商品
	private List<Product> product_clickcount;
	// 促销商品
	private List<Product> product_sale;

	// getter and setter
	public List<ProductCategory> getCategories() {
		return categories;
	}

	public void setCategories(List<ProductCategory> categories) {
		this.categories = categories;
	}

	public List<Product> getProduct_commend() {
		return product_commend;
	}

	public void setProduct_commend(List<Product> product_commend) {
		this.product_commend = product_commend;
	}

	public List<Product> getProduct_sellCount() {
		return product_sellCount;
	}

	public void setProduct_sellCount(List<Product> product_sellCount) {
		this.product_sellCount = product_sellCount;
	}

	public List<Product> getProduct_clickcount() {
		return product_clickcount;
	}

	public void setProduct_clickcount(List<Product> product_clickcount) {
		this.product_clickcount = product_clickcount;
	}

	public List<Product> getProduct_new() {
		return product_new;
	}

	public void setProduct_new(List<Product> product_new) {
		this.product_new = product_new;
	}

	public List<Product> getProduct_sale() {
		return product_sale;
	}

	public void setProduct_sale(List<Product> product_sale) {
		this.product_sale = product_sale;
	}
	
	

}
