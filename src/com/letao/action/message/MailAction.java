package com.letao.action.message;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.letao.action.BaseAction;
import com.letao.model.message.Mail;
import com.letao.model.user.Customer;
import com.letao.utils.SimpleMailSender;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @description 
 * @author ChengBin
 * @date   2013-12-5上午2:12:42
 * @version 1.0
 */
@SuppressWarnings("serial")
@Controller(value = "mailAction")
@Scope(value = "prototype")
@Namespace(value = "/mail")
public class MailAction extends BaseAction implements ModelDriven<Mail> {

	@Action(value = "mail_add", results = { @Result(location = "/WEB-INF/admin/user_mailAdd.jsp") })
	public String mail_page() {
		System.out.println("customer.getCusId()="+id);
		customer = customerDaoBean.get(id);
		return SUCCESS;
	}

	
	/**
	 * 
	 * @description 发送邮件
	 * @author ChengBin
	 * @date   2013-12-5上午2:16:10
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value="send_email", results={
			@Result(name = SUCCESS, type = "redirectAction", params = {
					"actionName", "user_list", "namespace", "/customer" })
	})
	public String send_email() {
		System.out.println(mailInfo);
		mailInfo.setMailServerHost("smtp.163.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);
		mailInfo.setUserName("chengbinlove@163.com");
		mailInfo.setPassword("xiechunmiao");// 您的邮箱密码
		mailInfo.setFromAddress("chengbinlove@163.com");
		//mailInfo.setToAddress(mailInfo.getToAddress());
		//mailInfo.setSubject(mailInfo.getSubject()); //标题
		//mailInfo.setContent(mailInfo.getContent()); //内容
		//SimpleMailSender mailSender = new SimpleMailSender();
		SimpleMailSender.sendHtmlMail(mailInfo);// 发送html格式
		//mailSender.sendTextMail(mailInfo);
		return SUCCESS;
	}


	private Mail mailInfo = new Mail();
	private Customer customer = new Customer();
	private int id;
	
	
	@Override
	public Mail getModel() {
		return mailInfo;
	}
	public Mail getMail() {
		return mailInfo;
	}
	public void setMail(Mail mailInfo) {
		this.mailInfo = mailInfo;
	}

	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
