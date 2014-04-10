package com.letao.action.user;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.letao.action.BaseAction;
import com.letao.model.PageModel;
import com.letao.model.user.Customer;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author ChengBin
 *
 */
@SuppressWarnings("serial")
@Namespace("/customer")
@Scope("prototype")
@Controller("customerAction")
public class CustomerAction extends BaseAction implements ModelDriven<Customer>{

	@Action(value="login",results={
		@Result(name=CUSTOMER_LOGIN,location="/WEB-INF/pages/login.jsp")
	})
	public String login() {
		return CUSTOMER_LOGIN;
	}
	
	@Action(value="personal", results={
		@Result(name=SUCCESS, location="/WEB-INF/user/personal.jsp")
	})
	public String person_center() {
		if (getCus_session() == null) {
			return INPUT;
		}
		customer = getCus_session();
		return SUCCESS;
	}
	
	@Action(value=SUCCESS, results={
			@Result(name="message", location="/WEB-INF/user/message.jsp")
	})
	public String message() {
		return SUCCESS;
	}
	
	@Action(value="user_list", results={
			@Result(name=SUCCESS, location="/WEB-INF/admin/user.jsp")
	})
	public String user_list() {
		pageModel = customerDaoBean.find(pageNo, pageSize);
		return SUCCESS;
	}
	
	@Action(value="customer_delete", results={
			@Result(name=SUCCESS, location="user_list", type="redirectAction")
	})
	public String user_delete() {
		customerDaoBean.delete(customer.getCusId());
		return SUCCESS;
	}
	

	@Action(value="editpass", results={
			@Result(name="editpass_menu",location="/WEB-INF/user/edit_pass.jsp")
	})
	public String editpass_menu() {
		customer = getCus_session();
		return "editpass_menu";
	}
	
	
	@Action(value="edit_post", results={
			@Result(type="json")
	})
	public String editpass_post() {
		Customer cus = customerDaoBean.get(customer.getCusId());
		if (cus == null) {
			exists = "1";
		}
		if (cus.getCusPassword() != null) {
			cus.setCusPassword(customer.getCusPassword());
			customerDaoBean.update(cus);
			exists = "0";
		} else {
			exists = "1"; //密码不等
		}
		
		return SUCCESS;
	}
	
	
	@Action(value="charge", results={
			@Result(name="charge_menu",location="/WEB-INF/user/bank_charge.jsp")
	})
	public String charge_menu() {
		return "charge_menu";
	}
	@Action(value="bank", results={
			@Result(name="bank_menu",location="/WEB-INF/user/bank.jsp")
	})
	public String bank_menu() {
		return "bank_menu";
	}
	
	
	/**
	 * @Description 客户登陆验证
	 * 
	 * @return
	 */
	@Action(value="login_in", results={
		@Result(name=SUCCESS,location="/WEB-INF/user/index.jsp"),
		@Result(name=CUSTOMER_LOGIN,location="/WEB-INF/pages/login.jsp")
	})
	public String login_in() {
		customer = customerDaoBean.login(customer.getCusName(), customer.getCusPassword());
		if (customer != null) {
			session.put(SESSION_CUSTOMER, customer);
			return SUCCESS;
		}
		return CUSTOMER_LOGIN;	
	}
	
	@Action(value="register", results={
			@Result(name=SUCCESS, location="/WEB-INF/user/index.jsp")
	})	
	public String user_register() {
		System.out.println(customer.getCusName());
		if (customer != null) {
			customerDaoBean.addCustomer(customer);
			return SUCCESS;
		}
		return ERROR;
	}
	
	
	
	@Action(value="logout", results={
			@Result(name=SUCCESS, type="redirectAction",
					params={"actionName","index", "namespace","/"})
			})
	public String logout() throws Exception{
		if(session != null && session.size() > 0){
			session.clear();
		}
		session.clear();
		return SUCCESS;
	}


	
	
	/**
	 * GETTER/SETTER BEAN
	 * 
	 */
	
	private String checkCode;
	private String exists;
	private String password;
	private PageModel<Customer> pageModel;
	
	public String getCheckCode() {
		return checkCode;
	}
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public String getExists() {
		return exists;
	}
	public void setExists(String exists) {
		this.exists = exists;
	}

	public PageModel<Customer> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<Customer> pageModel) {
		this.pageModel = pageModel;
	}




	private Customer customer = new Customer();
	@Override
	public Customer getModel() {
		return customer;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
