package com.letao.dao.product.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.letao.dao.impl.DaoSupport;
import com.letao.dao.product.IProductCategoryDao;
import com.letao.model.product.ProductCategory;

@Repository(value="productCategoryBean")
public class ProductCategoryBean extends DaoSupport<ProductCategory> implements IProductCategoryDao {
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public List<ProductCategory> getRootMenu() {
		String where = "where categoryLevel = 1";//查询一级节点
		return find(-1, -1, where, null).getList();
	}
	
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public List<ProductCategory> getCategories() {
		String where = "where pid = 1";
		return find(-1, -1, where, null).getList();
	}

}
