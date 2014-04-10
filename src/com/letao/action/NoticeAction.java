package com.letao.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("noticeAction")
@Namespace(value="/notice")
public class NoticeAction extends BaseAction {

	@Action(value="new_notice",results={
			@Result(name=SUCCESS,location="/WEB-INF/admin/noticel.jsp")
	})
	public String notice_menu() {
		return SUCCESS;
	}
	
	@Action(value="notice_add",results={
			@Result(name=SUCCESS,location="/WEB-INF/admin/notice_add.jsp")
	})
	public String notice_add_menu() {
		return SUCCESS;
	}
}
