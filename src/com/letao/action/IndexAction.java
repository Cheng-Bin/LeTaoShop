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
 * @date   2013-11-27����9:59:33
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
		// �������е����
		categories = productCategoryBean.getCategories();
		// ����ǰ10�����µ���Ʒ
		product_new = productDaoBean.findNewProduct(10).getList();
		// ����ǰ10���Ƽ�����Ʒ
		product_commend = productDaoBean.findCommend(10).getList();
		product_sale = productDaoBean.findSale(10).getList();
		/*// ���ҵ������ߵ�ǰ10����Ʒ
		product_clickcount = productDaoBean.findClickcount();
		// ����������õ�ǰ10����Ʒ
		product_sellCount = productDaoBean.findSellCount();*/
		return SUCCESS;
	}

	
	
	// ��Ʒ���
	private List<ProductCategory> categories;
	// ����ǰ10�����µ���Ʒ
	private List<Product> product_new;
	// �Ƽ���Ʒ
	private List<Product> product_commend;
	// ������õ���Ʒ
	private List<Product> product_sellCount;
	// ������ߵ���Ʒ
	private List<Product> product_clickcount;
	// ������Ʒ
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
