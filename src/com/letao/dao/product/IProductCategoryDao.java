package com.letao.dao.product;


import java.util.List;

import com.letao.dao.BaseDao;
import com.letao.model.product.ProductCategory;

public interface IProductCategoryDao extends BaseDao<ProductCategory> {
	
	/**
	 * 
	 * @description 获取一级菜单
	 * @author ChengBin
	 * @date   2013-11-27上午9:09:55
	 * @version 1.0
	 * @param
	 * @return List<ProductCategory>
	 *
	 */
	public List<ProductCategory> getRootMenu();
	
	
	/**
	 * 
	 * @description 获取所有分类
	 * @author ChengBin
	 * @date   2013-11-27上午9:10:18
	 * @version 1.0
	 * @param
	 * @return List<ProductCategory>
	 *
	 */
	public List<ProductCategory> getCategories();
	
}
