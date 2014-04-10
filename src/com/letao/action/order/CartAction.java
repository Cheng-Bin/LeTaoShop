package com.letao.action.order;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.letao.action.BaseAction;
import com.letao.model.order.Order;
import com.letao.model.order.OrderItem;
import com.letao.model.product.Product;

/**
 * 
 * @description 购物车Action
 * @author ChengBin
 * @date   2013-11-28下午4:26:49
 * @version 1.0
 */
@SuppressWarnings("serial")
@Controller(value = "cartAction")
@Scope("prototype")
@Namespace("/cart")
public class CartAction extends BaseAction implements Serializable {

	
	/**
	 * 
	 * @description CART界面
	 * @author ChengBin
	 * @date   2013-11-28下午4:42:00
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value = "cart_list", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/user/product_car.jsp"),
			@Result(name=INPUT, location="/WEB-INF/pages/login.jsp")})
	public String cart_list() {
		items = getList();
		if (items == null) {
			return INPUT;
		}
		return SUCCESS;
	}
	
	
	/**
	 * 
	 * @description CART界面
	 * @author ChengBin
	 * @date   2013-11-28下午4:42:00
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value = "cart_edit", results = { 
			 @Result(type="json")})
	public String cart_edit() {
		OrderItem item;
		if(productId != null && productId > 0){
			HashMap<Integer, OrderItem> cart = getCart();
			
			if (cart.containsKey(productId)) {	//如果是同一件物品
				item = cart.get(productId);
				item.setAmount(size);
				cart.put(productId, item);
				session.put(CART, cart);
			}
			
		}
		return SUCCESS;
	}
	
	
	/**
	 * 添加物品到购物车
	 */
	@Action(value = "cart_add", results = { @Result(name = SUCCESS, location = "cart_list", type="redirectAction") })
	public String cart_add() {
		OrderItem item;
		if(productId != null && productId > 0){
			HashMap<Integer, OrderItem> cart = getCart();
			
			if (cart.containsKey(productId)) {	//如果是同一件物品
				item = cart.get(productId);
				item.setAmount(item.getAmount()+size);
				cart.put(productId, item);
			} else { // 不是同一件商品
				System.out.println("size:_______"+size);
				item = new OrderItem();
				Product pro = productDaoBean.load(productId);
				item.setProductId(pro.getId());
				item.setProductPrice(pro.getSellPrice());
				item.setProductName(pro.getName());
				item.setPath(pro.getUploadFile().getPath());
				item.setAmount(size);
				cart.put(pro.getId(), item);
			}
	
			session.put(CART, cart);
		}
		return SUCCESS;
	}

	/**
	 * 
	 * @description 根据id从购物车中删除商品
	 * @author ChengBin
	 * @date   2013-11-28下午4:42:12
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value = "cart_delete", results = { @Result(name = SUCCESS, location = "cart_list", type="redirectAction") })
	public String cart_remove() {
		HashMap<Integer, OrderItem> cart = getCart();
		cart.remove(productId);
		return SUCCESS;
	}
	
	
	// 清空购物车
	@Action(value = "cart_clear", results = { @Result(name = SUCCESS, location = "cart_list", type="redirectAction") })
	public String clear() throws Exception {
		session.remove(CART);
		return SUCCESS;
	}
	
	/**
	 * 
	 * @description 检查数量
	 * @author ChengBin
	 * @date   2013-11-28下午6:07:28
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value = "check_number", results = { @Result(type="json") })
	public String check_number() {
		Product product = productDaoBean.load(productId);
		System.out.println("start="+start);
		if (product.getCount() >= size) {
			exists = "1";
		} else {
			exists = "0";
		}
		return SUCCESS;
	}
	

	// 商品id
	private Integer productId;
	private int size;
	private int start;
	private String exists;
	private String path;
	private List<OrderItem> items;
	
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	private List<Order> orders;
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}


	public String getExists() {
		return exists;
	}

	public void setExists(String exists) {
		this.exists = exists;
	}


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}


	public List<OrderItem> getItems() {
		return items;
	}


	public void setItems(List<OrderItem> items) {
		this.items = items;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}	
	
	
	
	
}
