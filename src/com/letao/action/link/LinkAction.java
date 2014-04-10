package com.letao.action.link;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.letao.action.BaseAction;

@SuppressWarnings("serial")
@Controller(value = "linkAction")
@Scope(value = "prototype")
@Namespace(value = "/link")
public class LinkAction extends BaseAction {

	@Action(value = "link_list", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/link.jsp") })
	public String link_list() {
		return SUCCESS;
	}

	@Action(value = "link_add", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/link_add.jsp") })
	public String link_add() {
		return SUCCESS;
	}
}
