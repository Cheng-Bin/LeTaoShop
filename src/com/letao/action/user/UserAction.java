package com.letao.action.user;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.letao.action.BaseAction;
import com.letao.model.user.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("userAction")
@Namespace(value = "/admin")
@Results(value = {
		@Result(name = ActionSupport.SUCCESS, location = "/WEB-INF/admin/main.jsp"),
		@Result(name = ActionSupport.LOGIN, location = "/WEB-INF/admin/login.jsp") })
public class UserAction extends BaseAction implements ModelDriven<User> {

	@Action("login")
	public String login() {
		return LOGIN;
	}

	@Action(value = "login_in")
	public String login_in() {
		if (user.getUserName() == null || user.getPassword() == null) {
			return LOGIN;
		}
		User u = userDao.login(user.getUserName(), user.getPassword());
		String serverCode = (String) session.get(SESSION_SECURITY_CODE);
		if (!serverCode.equals(getCheckCode())) {
			addFieldError("error", "验证码错误");
			return LOGIN;
		}
		if (u != null) {
			session.put("user", u);
		} else {
			addFieldError("error", "用户名或者密码错误");
			return LOGIN;
		}
		return SUCCESS;
	}

	@Action(value = "config", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/cfg.jsp") })
	public String config_menu() {
		return SUCCESS;
	}

	@Action(value = "edit_pass", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/editpass.jsp") })
	public String edit_pass_menu() {
		if (session.get("user") == null) return LOGIN;
		System.out.println("okkk");
		user = (User) session.get("user");
		user = userDao.load(user.getUserId());
		return SUCCESS;
	}
	
	@Action(value = "edit_password", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/login.jsp") })
	public String edit_password() {
		System.out.println("id="+user.getUserId());
		User u = userDao.get(user.getUserId());
		u.setPassword(user.getPassword());
		userDao.update(u);
		session.remove("user");
		return SUCCESS;
	}

	/**
	 * 
	 * @description 发邮件页面
	 * @author ChengBin
	 * @date   2013-12-5上午3:54:17
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value = "mail", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/mail_set.jsp") })
	public String mail_menu() {
		return SUCCESS;
	}

	@Action(value = "check", results = { @Result(name = SUCCESS, type="json") })
	public String check() {
		String name = user.getUserName().trim();
		String password = user.getPassword(); 
		String where = "where userName = ? and password = ?";
		Object[] obj = new Object[]{name, password};
		List<User> list = userDao.find(-1, -1, where, obj).getList();
		if (list.size() > 0) {
			info = "0";
		} else {
			info = "1";
		}
		System.out.println("okoko");
		return SUCCESS;
	}
	
	@Action(value = "logout", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/login.jsp") })
	public String logout() {
		if (session != null) {
			session.remove("user");
		}
		return SUCCESS;
	}
	
	@Action(value = "ppt", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/powerpoint.jsp") })
	public String ppt_menu() {
		return SUCCESS;
	}
	
	@Action(value = "ppt_add", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/ppt_add.jsp") })
	public String ppt_add_menu() {
		return SUCCESS;
	}
	
	@Action(value = "commentl", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/commentl.jsp") })
	public String comment_menu() {
		return SUCCESS;
	}
	
	@Action(value = "page", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/page.jsp") })
	public String page_menu() {
		return SUCCESS;
	}
	
	@Action(value = "page_add", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/page_add.jsp") })
	public String pageadd_menu() {
		return SUCCESS;
	}
	
	@Action(value = "log", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/log.jsp") })
	public String log_menu() {
		return SUCCESS;
	}
	
	
	
	private User user = new User();
	private String info; 

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public User getModel() {
		return user;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}



	private String checkCode;

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
}
