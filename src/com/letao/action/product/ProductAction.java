package com.letao.action.product;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.letao.action.BaseAction;
import com.letao.model.PageModel;
import com.letao.model.product.Comment;
import com.letao.model.product.Product;
import com.letao.model.product.ProductCategory;
import com.letao.model.product.UploadFile;
import com.letao.model.user.User;
import com.letao.utils.DateUtils;
import com.letao.utils.FileUpload;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @description 产品Action
 * @author ChengBin
 * @date 2013-11-26下午6:17:27
 * @version 1.0
 */
@SuppressWarnings("serial")
@Namespace("/product")
@Scope("prototype")
@Controller("productAction")
public class ProductAction extends BaseAction implements ModelDriven<Product> {

	// 后台Action
	/**
	 * 
	 * @description 商品列表
	 * 
	 * @author ChengBin
	 * @date 2013-11-26下午9:07:20
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "product_list", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/product_list.jsp") })
	public String product_menu() {
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("id", "desc");
		pageModel = productDaoBean.find(pageNo, pageSize, orderby);
		return SUCCESS;
	}

	/**
	 * 
	 * @description 添加page
	 * @author ChengBin
	 * @date 2013-11-26下午6:17:05
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "product_add", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/product_add.jsp") })
	public String product_add_menu() {
		long no = productDaoBean.getCount();
		product.setNo(String.format("%06d", no));
		categoryMap = getCategory();
		return SUCCESS;
	}

	/**
	 * 
	 * @description 更新产品
	 * @author ChengBin
	 * @date 2013-11-26下午9:43:11
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "edit", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/product_edit.jsp") })
	public String product_edit() {
		categoryMap = getCategory();
		product = productDaoBean.get(product.getId());
		return SUCCESS;
	}

	/**
	 * 
	 * @description 保存产品
	 * @author ChengBin
	 * @date 2013-11-26下午6:17:18
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "save", results = { @Result(name = SUCCESS, location = "product_list", type = "redirectAction") })
	public String save_page() {
		String dir = "";
		if (picFile != null && picFile.getAbsoluteFile() != null) {

			try {
				dir = FileUpload.upload(picFile, "proPic");
				UploadFile uploadFile = new UploadFile();// 实例化对象
				uploadFile.setPath(dir);// 设置文件名称
				product.setUploadFile(uploadFile);// 设置上传路径
			} catch (IOException e) {
				return INPUT;
			}
		}
		product.setAddTime(DateUtils.getCurrentDate());
		Object obj = session.get("user");
		if (obj instanceof User) {
			product.setAddAuthor(((User) obj).getUserName());
		}

		// 如果商品类别不为空，则保存商品类别信息
		if (product.getCategory() != null) {
			System.out.println("product.getCategory().getCategoryId()"
					+ product.getCategory().getCategoryId());
			product.setCategory(productCategoryBean.load(product.getCategory()
					.getCategoryId()));
		}
		// 如果上传文件和上传文件ID不为空，则保存文件的上传路径信息
		if (product.getUploadFile() != null
				&& product.getUploadFile().getId() != null) {
			product.setUploadFile(uploadFileDaoBean.load(product
					.getUploadFile().getId()));
		}

		productDaoBean.saveOrUpdate(product);

		return SUCCESS;
	}

	/**
	 * 
	 * @description 根据ID删除产品
	 * @author ChengBin
	 * @date 2013-11-26下午9:57:51
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "delete", results = { @Result(name = SUCCESS, location = "product_list", type = "redirectAction") })
	public String product_delete() {
		int id = product.getId();
		System.out.println("id=" + id);
		productDaoBean.delete(id);
		return SUCCESS;
	}

	/*************** 前台 ***************/

	/**
	 * 
	 * @description 最新商品
	 * @author ChengBin
	 * @date 2013-11-27下午3:49:44
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "new_product", results = { @Result(name = SUCCESS, location = "/WEB-INF/pages/product.jsp") })
	public String product_new() {
		categories = productCategoryBean.getCategories();
		product_sale = productDaoBean.findSale(5).getList();
		pageModel = productDaoBean.findNewProduct(28);
		title = "最新商品";
		return SUCCESS;
	}

	/**
	 * 
	 * @description 推荐商品
	 * @author ChengBin
	 * @date 2013-11-27下午3:41:25
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "product_recommend", results = { @Result(name = SUCCESS, location = "/WEB-INF/pages/product.jsp") })
	public String product_rcmd() {
		categories = productCategoryBean.getCategories();
		pageModel = productDaoBean.findCommend(28);
		product_sale = productDaoBean.findSale(5).getList();
		title = "推荐商品";
		return SUCCESS;
	}

	/**
	 * 
	 * @description 商品列表
	 * 
	 * @author ChengBin
	 * @date 2013-11-26下午9:07:20
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "products", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/product_list.jsp") })
	public String product_list() {
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("id", "desc");
		pageModel = productDaoBean.find(pageNo, pageSize, orderby);
		return SUCCESS;
	}

	/**
	 * 
	 * @description 限量商品
	 * @author ChengBin
	 * @date 2013-11-27下午3:41:39
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "product_limit", results = { @Result(name = SUCCESS, location = "/WEB-INF/pages/product.jsp") })
	public String product_limit() {
		categories = productCategoryBean.getCategories();
		product_sale = productDaoBean.findSale(5).getList();
		pageModel = productDaoBean.findLimit(28);
		title = "限量商品";
		return SUCCESS;
	}

	/**
	 * 
	 * @description 特价商品
	 * @author ChengBin
	 * @date 2013-11-27下午3:42:00
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "product_special", results = { @Result(name = SUCCESS, location = "/WEB-INF/pages/product.jsp") })
	public String product_special() {
		categories = productCategoryBean.getCategories();
		product_sale = productDaoBean.findSale(5).getList();
		pageModel = productDaoBean.findSale(28);
		title = "特价商品";
		return SUCCESS;
	}

	/**
	 * 
	 * @description 促销商品
	 * 
	 * @author ChengBin
	 * @date 2013-11-27下午3:42:09
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "product_sale", results = { @Result(name = SUCCESS, location = "/WEB-INF/pages/product.jsp") })
	public String product_sale() {
		categories = productCategoryBean.getCategories();
		product_sale = productDaoBean.findSale(5).getList();
		pageModel = productDaoBean.findPromotion(28);
		title = "促销商品";
		return SUCCESS;
	}

	/**
	 * 
	 * @description 获取商品详细信息
	 * @author ChengBin
	 * @date 2013-11-28上午9:42:48
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "product_info", results = {
			@Result(name = SUCCESS, location = "/WEB-INF/pages/product_info.jsp"),
			@Result(name = INPUT, type = "redirectAction", params = {
					"actionName", "index", "namespace", "/" }) })
	public String product_info() {
		categories = productCategoryBean.getCategories();
		product_sale = productDaoBean.findNewProduct(5).getList();
		if (product != null) {
			product = productDaoBean.get(product.getId());
			String where = "where categoryId = ? and id != ?";
			Object[] obj = new Object[] {
					product.getCategory().getCategoryId(), product.getId() };
			product_same = productDaoBean.find(pageNo, pageSize, where, obj).getList();
			where = "where productId.id = ?";
			Object[] obj2 = {product.getId()};
			Map<String, String> orderby = new HashMap<String, String>();
			orderby.put("addTime", "desc");
			comment_list = commentDaoBean.find(where, obj2, orderby , pageNo, 5).getList();
			if (product != null) {
				product.setClickCount(product.getClickCount() + 1);
				productDaoBean.save(product);
			} else {
				return INPUT;
			}
		}
		title = product.getName();
		return SUCCESS;
	}

	/**
	 * 
	 * @description 购买物品
	 * @author ChengBin
	 * @date 2013-11-28上午10:00:27
	 * @version 1.0
	 * @param
	 * @return String
	 * 
	 */
	@Action(value = "product_buy", results = {
			@Result(name = SUCCESS, type = "redirectAction", params = {
					"actionName", "cart_add", "namespace", "/cart",
					"productId", "${product.id}", "size", "${number}" }),
			@Result(name = INPUT, location = "/WEB-INF/pages/login.jsp") })
	public String product_buy() {
		if (checkCustomerExists()) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	@Action(value = "findByPid", results = { @Result(name = SUCCESS, location = "/WEB-INF/pages/product.jsp") })
	public String product_byParentId() {
		categories = productCategoryBean.getCategories();
		product_sale = productDaoBean.findNewProduct(5).getList();
		if (product.getCategory().getCategoryId() == null) {
			return INPUT;
		}
		pageModel = productDaoBean.findByParentId(product.getCategory()
				.getCategoryId());
		title = "搜索结果";
		return SUCCESS;
	}

	/**
	 * 
	 * @description 获取所有类别
	 * @author ChengBin
	 * @date 2013-11-26下午6:16:07
	 * @version 1.0
	 * @param
	 * @return Map<Integer,String>
	 * 
	 */
	private Map<Integer, String> getCategory() {
		List<ProductCategory> categroys = productCategoryBean.getRootMenu();
		LinkedHashMap<Integer, String> map = new LinkedHashMap<Integer, String>();
		for (ProductCategory category : categroys) {
			ProductCategoryAction.setNodeMap(map, category, false);// 将节点添加到Map集合中
		}
		return map;
	}

	// MODEL
	private Product product = new Product();
	private PageModel<Product> pageModel;
	private Map<Integer, String> categoryMap;
	private List<ProductCategory> categories;
	private List<Product> product_sale;
	private List<Product> product_list;
	private List<Product> product_same;
	private List<Comment> comment_list;
	private File picFile;
	private String title;
	private Integer number;

	// setter and getter
	@Override
	public Product getModel() {
		return product;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Map<Integer, String> getCategoryMap() {
		return categoryMap;
	}

	public void setCategoryMap(Map<Integer, String> categoryMap) {
		this.categoryMap = categoryMap;
	}

	// 文件
	public File getPicFile() {
		return picFile;
	}

	public void setPicFile(File picFile) {
		this.picFile = picFile;
	}

	public List<Product> getProduct_same() {
		return product_same;
	}

	public void setProduct_same(List<Product> product_same) {
		this.product_same = product_same;
	}

	// pageModel
	public PageModel<Product> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<Product> pageModel) {
		this.pageModel = pageModel;
	}

	public List<ProductCategory> getCategories() {
		return categories;
	}

	public void setCategories(List<ProductCategory> categories) {
		this.categories = categories;
	}

	public List<Product> getProduct_sale() {
		return product_sale;
	}

	public void setProduct_sale(List<Product> product_sale) {
		this.product_sale = product_sale;
	}

	public List<Product> getProduct_list() {
		return product_list;
	}

	public void setProduct_list(List<Product> product_list) {
		this.product_list = product_list;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public List<Comment> getComment_list() {
		return comment_list;
	}

	public void setComment_list(List<Comment> comment_list) {
		this.comment_list = comment_list;
	}

}
