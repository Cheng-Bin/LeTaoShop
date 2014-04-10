package com.letao.dao.product;


import java.util.List;

import com.letao.dao.BaseDao;
import com.letao.model.product.ProductCategory;

public interface IProductCategoryDao extends BaseDao<ProductCategory> {
	
	/**
	 * 
	 * @description ��ȡһ���˵�
	 * @author ChengBin
	 * @date   2013-11-27����9:09:55
	 * @version 1.0
	 * @param
	 * @return List<ProductCategory>
	 *
	 */
	public List<ProductCategory> getRootMenu();
	
	
	/**
	 * 
	 * @description ��ȡ���з���
	 * @author ChengBin
	 * @date   2013-11-27����9:10:18
	 * @version 1.0
	 * @param
	 * @return List<ProductCategory>
	 *
	 */
	public List<ProductCategory> getCategories();
	
}
