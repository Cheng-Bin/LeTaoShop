package com.letao.action.order;

import java.io.Serializable;
import java.util.Properties;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Controller;

import com.letao.action.BaseAction;
import com.letao.utils.payOnlineUtil;
/**
 * 
 * @description 
 * @author ChengBin
 * @date   2013-11-30上午10:29:45
 * @version 1.0
 */
@Controller(value="payAction")
@Namespace("/pay")
@Scope("prototype")
public class PayRequestAction extends BaseAction implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 生成hmac.Action
	 * 
	 * @param p0_Cmd
	 *            业务类型
	 * @param p1_MerId
	 *            商户编号
	 * @param p2_Order
	 *            订单ID号
	 * @param p3_Amt
	 *            支付金额
	 * @param p4_Cur
	 *            交易币种
	 * @param p5_Pid
	 *            商品ID
	 * @param p6_Pcat
	 *            商品种类
	 * @param p7_Pdesc
	 *            商品描述
	 * @param p8_Url
	 *            商户接受支付成功后的地址
	 * @param p9_SAF
	 *            送货地址 "0"不需要 "1"为需要
	 * @param pa_MP
	 *            商户扩展信息
	 * @param pd_FrpId
	 *            银行编码
	 * @param pr_NeedResponse
	 *            应答机制
	 * @param keyValue
	 *            商户密钥
	 * @return
	 */
	private String orderid;// 订单ID p2_Order
	private String amount; // 金额 p3_Amt
	private String pd_FrpId; // 银行号 pd_FrpId

	// 商户申请后得到的信息放在merchantInfo.properties
	private String p1_MerId; // 商户ID p1_MerId
	private String keyValue; // 商户密钥 keyValue
	private String p8_Url; // 接受支付成功后返回的地址 p8_Url

	// 一般默认值
	private String p0_Cmd = "Buy";// 业务类型默认为"buy"
	private String p4_Cur = "CNY";// 默认单位是人民币
	private String p5_Pid = "";// 商品ID 留空
	private String p6_Pcat = "";// 商品种类 留空
	private String p7_Pdesc = "";// 商品描述 留空
	private String p9_SAF = "0"; // 不需要地址
	private String pa_Mp = ""; // 不需要商户扩展信息
	private String pr_NeedResponse = "0"; // 不需要应答
	private String hmacValue;

	public String getPd_FrpId() {
		return pd_FrpId;
	}

	public void setPd_FrpId(String pd_FrpId) {
		this.pd_FrpId = pd_FrpId;
	}

	public String getHmacValue() {
		return hmacValue;
	}

	public void setHmacValue(String hmacValue) {
		this.hmacValue = hmacValue;
	}

	public String getP1_MerId() {
		return p1_MerId;
	}

	public String getP8_Url() {
		return p8_Url;
	}

	public String getP0_Cmd() {
		return p0_Cmd;
	}

	public String getP4_Cur() {
		return p4_Cur;
	}

	public String getP5_Pid() {
		return p5_Pid;
	}

	public String getP6_Pcat() {
		return p6_Pcat;
	}

	public String getP7_Pdesc() {
		return p7_Pdesc;
	}

	public String getP9_SAF() {
		return p9_SAF;
	}

	public String getPa_Mp() {
		return pa_Mp;
	}

	public String getPr_NeedResponse() {
		return pr_NeedResponse;
	}
	
	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	// 重写 execute()和validate()方法
	@Action(value="go_pay", results={
			@Result(name=SUCCESS, location="/WEB-INF/user/connect.jsp")
	})
	public String execute() throws Exception {
		
		//跳转
		Properties props = PropertiesLoaderUtils.loadAllProperties("merchantInfo.properties");
		p1_MerId = props.getProperty("p1_MerId");
		keyValue = props.getProperty("keyValue");
		p8_Url = props.getProperty("merchantCallbackURL");
		// 产生hmac码
	    hmacValue = payOnlineUtil.createHmac(p0_Cmd, p1_MerId, orderid, amount, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_Mp, pd_FrpId, pr_NeedResponse, keyValue);
		return SUCCESS;
	}
	
	
	@Action(value="payResult", results={
			@Result(name=SUCCESS, location="/WEB-INF/user/pay_result.jsp")
	})
	public String pay_result() {
		return SUCCESS;
	}

}
