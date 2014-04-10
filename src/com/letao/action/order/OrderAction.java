package com.letao.action.order;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.letao.action.BaseAction;
import com.letao.model.OrderState;
import com.letao.model.PageModel;
import com.letao.model.PaymentWay;
import com.letao.model.order.Order;
import com.letao.model.order.OrderItem;
import com.letao.model.product.Product;
import com.letao.utils.StringUitl;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
@Controller(value="orderAction")
@Namespace("/order")
@Scope("prototype")
public class OrderAction extends BaseAction implements ModelDriven<Order> {

	/**
	 * 
	 * @description 跳转到支付页面
	 * 
	 * @author ChengBin
	 * @date   2013-11-29上午10:07:44
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value="pay_page", results={
			@Result(name=SUCCESS, location="/WEB-INF/user/product_pay.jsp")
	})
	public String pay_page() {
		items = getList();
		if (checkCustomerExists()) {
			order.setName(getLoginCustomer().getCusRealName());
			order.setAddress(getLoginCustomer().getCusAddress());
			order.setMobile(getLoginCustomer().getCusMobile());
			order.setPost(getLoginCustomer().getPost());	//邮编
			order.setCustomer(getLoginCustomer());// 设置所属用户
		}
		return SUCCESS;
	}
	
	
	/**
	 * 
	 * @description 添加订单
	 * @author ChengBin
	 * @date   2013-12-2上午10:38:42
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value = "order_pay", results = { 
			@Result(name = SUCCESS, type="redirectAction",
					params={"actionName","go_pay",
					"namespace","/pay", 
					"orderid", "${order.orderId}",
					"amount", "${order.totalPrice}",
					"pd_FrpId", "${pd_FrpId}"}),
					
			@Result(name = INPUT, location="/WEB-INF/pages/login.jsp")})
	public String order_pay() {
		if (getCus_session() != null) {
			order.setCustomer(getLoginCustomer());
			
			List<OrderItem> list = getList();
			for (OrderItem item : list) {
				Product p = productDaoBean.load(item.getProductId());
				p.setCount(p.getCount() - item.getAmount());
				p.setSellCount(item.getAmount() + p.getSellCount());
				productDaoBean.update(p);
				item.setOrder(order);
				setItem.add(item);
			}
			
			order.setOrderItems(setItem);
			order.setPaymentWay(PaymentWay.NET_BANK);
			order.setOrderState(OrderState.NOT);
			orderDaoBean.saveOrder(order);
			session.remove(CART);
		} else {
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 
	 * @description 确认订单
	 * @author ChengBin
	 * @date   2013-12-2下午12:15:41
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value="order_confirm", results={
			@Result(name=SUCCESS, location="/WEB-INF/user/order_confirm.jsp")
	})
	public String order_confirm() {
		if (order == null) {
			return INPUT;
		}
		
		order.setOrderId(StringUitl.createOrderId());
		return SUCCESS;
	}
	
	/**
	 * 
	 * @description 查看所有订单(qiantai)
	 * 
	 * @author ChengBin
	 * @date   2013-12-2下午12:13:09
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value="order_list",  results={
			@Result(name=SUCCESS, location="/WEB-INF/user/order_view.jsp"),
			@Result(name=INPUT, location="/WEB-INF/admin/login.jsp")	
	})
	public String order_list() {
		if (getCus_session() == null) return INPUT;
		String where = "where name = ?";
		Object[] parames = {getCus_session().getCusRealName().trim()};
		pageModel = orderDaoBean.find(pageNo, pageSize, where, parames);
		return SUCCESS;
	} 
	
	
	@Action(value="orders",  results={
			@Result(name=SUCCESS, location="/WEB-INF/user/order_view.jsp")
	})
	public String buylist() {
		String where = "where orderState = ? and name = ?";
		Object[] parames = {OrderState.DELIVERED, getCus_session().getCusRealName().trim()};
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("id", "desc");
		pageModel = orderDaoBean.find(where, parames, orderby, pageNo, pageSize);
		return SUCCESS;
	}
	
	@Action(value="product_order", results={
		@Result(name=SUCCESS, location="/WEB-INF/admin/product_order.jsp")	
	})
	public String product_order() {
		pageModel = orderDaoBean.find(pageNo, pageSize);
		return SUCCESS;
	}
	
	@Action(value="order_del", results={
			@Result(name=SUCCESS,  type="redirectAction", location="product_order"),
			@Result(name=INPUT, location="/WEB-INF/admin/login.jsp")	
	})
	public String order_del() {
		if (order != null) {
			orderDaoBean.delete(order.getId());
		}
		return SUCCESS;
	}

	
	@Action(value="order_send", results={
			@Result(name=SUCCESS,  type="redirectAction", location="product_order")	
	})
	public String order_send() {
		if (order != null) {
			order = orderDaoBean.load(order.getId());
			order.setOrderState(OrderState.DELIVERED);
			orderDaoBean.update(order);
		}
		return SUCCESS;
	}


	
	//model
	private Order order = new Order();
	private PageModel<Order> pageModel;
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	@Override
	public Order getModel() {
		return order;
	}
	
	private List<OrderItem> items;

	public List<OrderItem> getItems() {
		return items;
	}
	public void setItems(List<OrderItem> items) {
		this.items = items;
	}
	
	private String pd_FrpId;

	public String getPd_FrpId() {
		return pd_FrpId;
	}

	public void setPd_FrpId(String pd_FrpId) {
		this.pd_FrpId = pd_FrpId;
	}
	
	private Set<OrderItem> setItem = new HashSet<OrderItem>();

	public Set<OrderItem> getSetItem() {
		return setItem;
	}
	public void setSetItem(Set<OrderItem> setItem) {
		this.setItem = setItem;
	}

	public PageModel<Order> getPageModel() {
		return pageModel;
	}
	public void setPageModel(PageModel<Order> pageModel) {
		this.pageModel = pageModel;
	}
	
	
}
