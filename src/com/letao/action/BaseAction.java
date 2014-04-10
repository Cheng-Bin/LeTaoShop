package com.letao.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.letao.dao.article.IArticleDao;
import com.letao.dao.article.IArticleTypeDao;
import com.letao.dao.order.IOrderDao;
import com.letao.dao.order.IOrderItemDao;
import com.letao.dao.product.IComment;
import com.letao.dao.product.IFavoriteDao;
import com.letao.dao.product.IProductCategoryDao;
import com.letao.dao.product.IProductDao;
import com.letao.dao.product.IUploadFileDao;
import com.letao.dao.user.ICustomerDao;
import com.letao.dao.user.IUserDao;
import com.letao.model.order.OrderItem;
import com.letao.model.product.Product;
import com.letao.model.user.Customer;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @description Action基类
 * @author ChengBin
 * 
 */
@ParentPackage(value = "json-default")
@SuppressWarnings("serial")
public class BaseAction extends ActionSupport implements RequestAware,
		SessionAware, ApplicationAware {

	protected int pageNo = 1;
	protected int pageSize = 10;

	// 请求结果标识
	public static final String LIST = "list";
	public static final String EDIT = "edit";
	public static final String ADD = "add";
	public static final String SELECT = "select";
	public static final String QUERY = "query";
	public static final String LEFT = "left";
	public static final String RIGHT = "right";
	public static final String INDEX = "index";
	public static final String MAIN = "main";
	public static final String MANAGER = "manager";
	public static final String TOP = "top";
	public static final String REG = "reg";
	public static final String USER_LOGIN = "userLogin";
	public static final String CUSTOMER_LOGIN = "customerLogin";
	public static final String LOGOUT = "logout";
	public static final String SESSION_SECURITY_CODE = "SESSION_SECURITY_CODE";
	public static final String SESSION_CUSTOMER = "SESSION_CUSTOMER";
	public static final String TOKEN = "invalid.token";
	public static final String CART = "cart";

	// 持久层实例
	@Autowired
	@Qualifier("userDaoBean")
	protected IUserDao userDao;
	@Autowired
	@Qualifier("articleTypeDaoBean")
	protected IArticleTypeDao articleTypeDaoBean;
	@Autowired
	@Qualifier("articleDaoBean")
	protected IArticleDao articleDaoBean;
	@Autowired
	@Qualifier("productCategoryBean")
	protected IProductCategoryDao productCategoryBean;
	@Autowired
	@Qualifier("productDaoBean")
	protected IProductDao productDaoBean;
	@Autowired
	@Qualifier("uploadFileDaoBean")
	protected IUploadFileDao uploadFileDaoBean;
	@Autowired
	@Qualifier("orderDaoBean")
	protected IOrderDao orderDaoBean;
	@Autowired
	@Qualifier("orderItemDaoBean")
	protected IOrderItemDao orderItemDaoBean;
	@Autowired
	@Qualifier("favoriteDaoBean")
	protected IFavoriteDao favoriteDaoBean;
	@Autowired
	@Qualifier("customerDaoBean")
	protected ICustomerDao customerDaoBean;
	@Autowired
	@Qualifier("commentDaoBean")
	protected IComment commentDaoBean;
	

	/**
	 * 
	 * @description 从session中取出购物车
	 * @author ChengBin
	 * @date   2013-11-28下午12:05:19
	 * @version 1.0
	 * @param
	 * @return Set<OrderItem>
	 *
	 */
	@SuppressWarnings("unchecked")
	protected HashMap<Integer,OrderItem> getCart() {
		Object obj = session.get(CART);
		if (obj == null) {
			return new HashMap<Integer, OrderItem>();
		} else {
			return (HashMap<Integer, OrderItem>) obj;
		}
	}
	
	/**
	 * 
	 * @description 获取订单list集合
	 * @author ChengBin
	 * @date   2013-12-1上午4:09:09
	 * @version 1.0
	 * @param
	 * @return List<OrderItem>
	 *
	 */
	public List<OrderItem> getList() {
		if (getCus_session() == null) {
			return null;
		}
		HashMap<Integer, OrderItem> cart = getCart();
		Iterator<Integer> iterator = cart.keySet().iterator();
		while (iterator.hasNext()) {
			Integer id = (Integer) iterator.next();
			Product p = productDaoBean.get(id);
			OrderItem order = cart.get(id);
			if (order.getAmount() > p.getCount()) {
				order.setAmount(p.getCount());
			}
			items.add(order);
		}
		return items;
	}

	
	/**
	 * 
	 * @description 取除用户对象
	 * @author ChengBin
	 * @date   2013-11-29上午10:06:28
	 * @version 1.0
	 * @param
	 * @return Customer
	 *
	 */
	public Customer getLoginCustomer(){
		if(session.get(SESSION_CUSTOMER) != null){
			return (Customer) session.get(SESSION_CUSTOMER);
		}
		return null;
	}

	/**
	 * 
	 * @description 检测用户是否登录
	 * @author ChengBin
	 * @date   2013-11-28上午10:08:12
	 * @version 1.0
	 * @param
	 * @return boolean
	 *
	 */
	public boolean checkCustomerExists() {
		Object obj = session.get(SESSION_CUSTOMER);
		if (obj != null && obj instanceof Customer) {
			return true;
		} else {
			return false;
		}
	}
	

	// Map类型的request
	protected Map<String, Object> request;
	// Map类型的session
	protected Map<String, Object> session;
	// Map类型的application
	protected Map<String, Object> application;

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}

	// 分页
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	
	 //当前用户
	@SuppressWarnings("unused")
	private Customer cus_session;


	public Customer getCus_session() {
		return (Customer) session.get(SESSION_CUSTOMER);
	}
	
	private List<OrderItem> items = new ArrayList<OrderItem>();


	public List<OrderItem> getItems() {
		return items;
	}


	public void setItems(List<OrderItem> items) {
		this.items = items;
	}
	

}
