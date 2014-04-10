package com.letao.action;

import java.io.ByteArrayInputStream;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.letao.utils.SecurityCode;
import com.letao.utils.SecurityImage;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
@Namespace(value="/security")
@Result(name=ActionSupport.SUCCESS, type="stream", params={
		"contentType", "image/jpeg", "inputName",
        "imageStream", "bufferSize", "2048"})
@Scope("prototype")
public class SecurityCodeImageAction extends BaseAction {

	private ByteArrayInputStream imageStream;

	public ByteArrayInputStream getImageStream() {
		return imageStream;
	}

	public void setImageStream(ByteArrayInputStream imageStream) {
		this.imageStream = imageStream;
	}

	@Action(value="securityCodeImageAction")
	public String execute() {
		String securityCode = SecurityCode.getSecurityCode();
		imageStream = SecurityImage.getImageAsInputStream(securityCode);
		session.put(SESSION_SECURITY_CODE, securityCode);		
		return SUCCESS;
	}
}
