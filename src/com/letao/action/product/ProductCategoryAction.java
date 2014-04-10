package com.letao.action.product;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;
import com.letao.action.BaseAction;
import com.letao.model.PageModel;
import com.letao.model.product.ProductCategory;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @description 产品类别Action
 * 
 * @author ChengBin
 * @date   2013-11-26下午5:55:58
 * @version 1.0
 */
@SuppressWarnings("serial")
@Controller(value="productCategoryAction")
@Namespace(value="/productType")
public class ProductCategoryAction extends BaseAction implements ModelDriven<ProductCategory> {

	/**
	 * 
	 * @description 查询所有分类
	 * @author ChengBin
	 * @date   2013-11-26下午6:03:14
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value="category_list",results={
		@Result(name=SUCCESS, location="/WEB-INF/admin/product_category_list.jsp")
	})
	public String category_list_menu() {
		pageModel = productCategoryBean.find(pageNo, pageSize);
		return SUCCESS;
	}

	
	/**
	 * 
	 * @description 添加分类
	 * @author ChengBin
	 * @date   2013-11-26下午6:04:05
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value="category_add", results={
			@Result(name=SUCCESS, location="/WEB-INF/admin/product_category_add.jsp")
	})
	public String category_add() {
		List<ProductCategory> categroys = productCategoryBean.getRootMenu();

		for (ProductCategory category : categroys) {
			System.out.println(category.getCategoryName());
			setNodeMap(map, category, false);//将节点添加到Map集合中
		}
		
		return SUCCESS;
	}
	
	/**
	 * 
	 * @description
	 * @author ChengBin
	 * @date   2013-11-26下午6:05:03
	 * @version 1.0
	 * @param
	 * @return void
	 *
	 */
	public static void setNodeMap(Map<Integer, String> map,
			ProductCategory node, boolean b) {
		if (node == null) {
			return;
		}
		int level = node.getCategoryLevel();
		System.out.println("level:"+level);
		StringBuffer sb = new StringBuffer();//定义字符串对象
		System.out.println("level="+level);
		if (level > 1) {//如果不是根节点
			for (int i = 0; i < level; i++) {
				 sb.append("　");//添加空格
			}
			sb.append(b ? "├" : "└");//如果为末节点添加"└"，反之添加"├"
		}
		map.put(node.getCategoryId(), sb.append(node.getCategoryName()).toString());
		
		Set<ProductCategory> children = node.getChild();//获取其子节点
		// 包含子类别
		if(children != null &&  children.size() > 0){//如果节点不为空
			int i = 0;
			// 遍历子类别
			for (ProductCategory child : children) {
				boolean flag = true;
				if(i == children.size()-1){//如果子节点长度减1为i,说明为末节点
					flag = false;//设置布尔常量为false
				}
				setNodeMap(map,child,flag);//重新调用该方法
			}
		}
	}
	
	/**
	 *
	 * @description 保存分类
	 * 
	 * @author ChengBin
	 * @date   2013-11-26下午6:12:12
	 * @version 1.0
	 * @param null
	 * @return String 
	 *
	 */
	@Action(value="save", results={
			@Result(name=SUCCESS, location="category_list", type="redirectAction")
	})
	public String save_page() {
		int id = category.getCategoryId();
		ProductCategory p = productCategoryBean.get(id);
		category.setCategoryLevel(p.getCategoryLevel()+1);
		category.setMenu(p);
		productCategoryBean.save(category);
		return SUCCESS;
	}
	
	/**
	 * 
	 * @description 编辑page
	 * @author ChengBin
	 * @date   2013-11-26下午6:12:33
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value="category_edit", results={
			@Result(name=SUCCESS, location="/WEB-INF/admin/product_category_edit.jsp")
	})
	public String edit_page() {
		category = productCategoryBean.get(category.getCategoryId());
		category_add();
		return SUCCESS;
	}
	
	/**
	 * 
	 * @description 编辑分类
	 * @author ChengBin
	 * @date   2013-11-26下午6:12:52
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value="edit", results={
			@Result(name=SUCCESS, location="category_list", type="redirectAction")
	})
	public String edit() {
		int id = category.getMenu().getCategoryId();
		System.out.println("IDIDID="+id);
		ProductCategory p = productCategoryBean.get(id);
		category.setCategoryLevel(p.getCategoryLevel()+1);
		category.setMenu(p);
		productCategoryBean.update(category);
		return SUCCESS;
	}
	
	
	/**
	 * @description 删除分类
	 * 
	 * @author ChengBin
	 * @version 1.0 2013-11-26
	 * @param null
	 * @return String 
	 */
	@Action(value="delete", results={
			@Result(name=SUCCESS, location="category_list", type="redirectAction")
	})
	public String delete() {
		productCategoryBean.delete(category.getCategoryId());
		return SUCCESS;
	}	
	
	
	//类别
	private Map<Integer, String> map = new LinkedHashMap<Integer, String>();
	public Map<Integer, String> getMap() {
		return map;
	}
	public void setMap(Map<Integer, String> map) {
		this.map = map;
	}
	
	//model
	private ProductCategory category = new ProductCategory();
	@Override
	public ProductCategory getModel() {
		return category;
	}
	public ProductCategory getCategory() {
		return category;
	}
	public void setCategory(ProductCategory category) {
		this.category = category;
	}
	
	
	//PageModel
	private PageModel<ProductCategory> pageModel;
	public PageModel<ProductCategory> getPageModel() {
		return pageModel;
	}
	public void setPageModel(PageModel<ProductCategory> pageModel) {
		this.pageModel = pageModel;
	}

}
