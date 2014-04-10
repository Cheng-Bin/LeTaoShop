package com.letao.dao.product;

import java.util.List;

import com.letao.dao.BaseDao;
import com.letao.model.PageModel;
import com.letao.model.product.Product;

/**
 * 
 * @description  ��ƷDAO
 * @author ChengBin
 * @date   2013-11-27����9:32:20
 * @version 1.0
 */
public interface IProductDao extends BaseDao<Product> {
	
	/**
	 * 
	 * @description �����Ƽ�����Ʒ
	 * @author ChengBin
	 * @date   2013-11-27����9:31:28
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public PageModel<Product> findCommend(int n);
	
	/**
	 * 
	 * @description ����ǰn�����µ���Ʒ
	 * @author ChengBin
	 * @date   2013-11-27����9:57:07
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public PageModel<Product> findNewProduct(int n);
	
	/**
	 * 
	 * @description ��ѯ�����ߵ���Ʒ
	 * @author ChengBin
	 * @date   2013-11-27����9:31:40
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public List<Product> findClickcount();
	
	/**
	 * 
	 * @description ��ѯ������ߵ���Ʒ
	 * @author ChengBin
	 * @date   2013-11-27����9:31:54
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public List<Product> findSellCount();

	/**
	 * 
	 * @description ����ǰn���ؼ۵���Ʒ
	 * @author ChengBin
	 * @date   2013-11-27����10:32:54
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public PageModel<Product> findSale(int n);
	
	/**
	 * 
	 * @description ��ѯ��ǰn��������Ʒ
	 * @author ChengBin
	 * @date   2013-11-27����6:49:00
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public PageModel<Product> findLimit(int n);
	
	
	public PageModel<Product> findByParentId(int id);
	
	/**
	 * 
	 * @description ��ѯǰn����������Ʒ
	 * @author ChengBin
	 * @date   2013-11-27����7:47:06
	 * @version 1.0
	 * @param
	 * @return List<Product>
	 *
	 */
	public PageModel<Product> findPromotion(int n);
	
}
