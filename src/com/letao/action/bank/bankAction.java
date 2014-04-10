package com.letao.action.bank;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.letao.action.BaseAction;

@SuppressWarnings("serial")
@Controller(value = "bankAction")
@Scope(value = "prototype")
@Namespace(value = "/bank")
public class bankAction extends BaseAction {

	@Action(value = "bank_info", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/bank_pay.jsp") })
	public String customer_pay_info() {
		return SUCCESS;
	}

	@Action(value = "api", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/api.jsp") })
	public String api_list() {
		return SUCCESS;
	}

	@Action(value = "api_add", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/api_add.jsp") })
	public String api_add() {
		return SUCCESS;
	}
}
