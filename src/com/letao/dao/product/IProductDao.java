package com.letao.dao.product;

import java.util.List;

import com.letao.dao.BaseDao;
import com.letao.model.PageModel;
import com.letao.model.product.Product;

/**
 * 
 * @description  商品DAO
 * @author ChengBin
 * @date   2013-11-27上午9:32:20
 * @version 1.0
 */
public interface IProductDao extends BaseDao<Product> {
	
	/**
	 * 
	 * @description 查找推荐的商品
	 * @author ChengBin
	 * @date   2013-11-27上午9:31:28
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public PageModel<Product> findCommend(int n);
	
	/**
	 * 
	 * @description 查找前n件最新的商品
	 * @author ChengBin
	 * @date   2013-11-27上午9:57:07
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public PageModel<Product> findNewProduct(int n);
	
	/**
	 * 
	 * @description 查询人气高的商品
	 * @author ChengBin
	 * @date   2013-11-27上午9:31:40
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public List<Product> findClickcount();
	
	/**
	 * 
	 * @description 查询销量最高的商品
	 * @author ChengBin
	 * @date   2013-11-27上午9:31:54
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public List<Product> findSellCount();

	/**
	 * 
	 * @description 查找前n件特价的商品
	 * @author ChengBin
	 * @date   2013-11-27上午10:32:54
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public PageModel<Product> findSale(int n);
	
	/**
	 * 
	 * @description 查询出前n条限量商品
	 * @author ChengBin
	 * @date   2013-11-27下午6:49:00
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public PageModel<Product> findLimit(int n);
	
	
	public PageModel<Product> findByParentId(int id);
	
	/**
	 * 
	 * @description 查询前n条促销的商品
	 * @author ChengBin
	 * @date   2013-11-27下午7:47:06
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public PageModel<Product> findPromotion(int n);
	
}
