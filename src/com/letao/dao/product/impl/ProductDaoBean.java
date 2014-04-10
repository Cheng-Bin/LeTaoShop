package com.letao.dao.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.letao.dao.impl.DaoSupport;
import com.letao.dao.product.IProductDao;
import com.letao.model.PageModel;
import com.letao.model.product.Product;

/**
 * 
 * @author ChengBin
 *
 */
@Repository(value="productDaoBean")
public class ProductDaoBean extends DaoSupport<Product> implements IProductDao {

	/**
	 * 查询点击排名前10个商品
	 */
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public List<Product> findClickcount() {
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("clickCount", "desc");
		PageModel<Product> pageModel = find(1, 10, orderby);
		return pageModel.getList();
	}
	
	/**
	 * 查询推荐商品的前n件，按上架时间降序排序
	 */
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public PageModel<Product> findCommend(int n) {
		String where = "where commend=?";
		Object[] parames = {true};
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("addTime", "desc");
		PageModel<Product> pageModel = find(where,parames, orderby, 1, n);
		return pageModel;
	}
	
	/**
	 * 查询人气最好的前10件商品
	 */
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public List<Product> findSellCount() {
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("sellCount", "desc");
		PageModel<Product> pageModel = find(1, 10, orderby);
		return pageModel.getList();
	}

	
	/**
	 * 查找前10件最新的商品
	 */
	@Override
	public PageModel<Product> findNewProduct(int n) {
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("addTime", "desc");
		PageModel<Product> pageModel = find(1, n, orderby);
		return pageModel;
	}

	/**
	 * 查找前N件特价的商品
	 */
	@Override
	public PageModel<Product> findSale(int n) {
		String where = "where sale = ?";
		Object[] parames = {true};
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("addTime", "desc");
		PageModel<Product> pageModel = find(where,parames, orderby, 1, n);
		return pageModel;
	}
	
	/**
	 * 查找前N个特价商品
	 * 
	 */
	@Override
	public PageModel<Product> findLimit(int n) {
		String where = "where limit = ?";
		Object[] params = {true};
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("addTime", "desc");
		PageModel<Product> pageModel = find(where, params, orderby, 1, n);
		return pageModel;
	}

	/**
	 * 查找前N个促销商品
	 */
	@Override
	public PageModel<Product> findPromotion(int n) {
		String where = "where promotion = ?";
		Object[] params = {true};
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("addTime", "desc");
		PageModel<Product> pageModel = find(where, params, orderby, 1, n);
		return pageModel;
	}

	/**
	 * 通过parentId查找
	 */
	@Override
	public PageModel<Product> findByParentId(int id) {
		String where = "where categoryId = ?";
		Object[] params = {id};
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("addTime", "desc");
		PageModel<Product> pageModel = find(1, 24, where, params);
		return pageModel;
	}
	
}
