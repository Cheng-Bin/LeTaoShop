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
 * @date   2013-11-30����10:29:45
 * @version 1.0
 */
@Controller(value="payAction")
@Namespace("/pay")
@Scope("prototype")
public class PayRequestAction extends BaseAction implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * ����hmac.Action
	 * 
	 * @param p0_Cmd
	 *            ҵ������
	 * @param p1_MerId
	 *            �̻����
	 * @param p2_Order
	 *            ����ID��
	 * @param p3_Amt
	 *            ֧�����
	 * @param p4_Cur
	 *            ���ױ���
	 * @param p5_Pid
	 *            ��ƷID
	 * @param p6_Pcat
	 *            ��Ʒ����
	 * @param p7_Pdesc
	 *            ��Ʒ����
	 * @param p8_Url
	 *            �̻�����֧���ɹ���ĵ�ַ
	 * @param p9_SAF
	 *            �ͻ���ַ "0"����Ҫ "1"Ϊ��Ҫ
	 * @param pa_MP
	 *            �̻���չ��Ϣ
	 * @param pd_FrpId
	 *            ���б���
	 * @param pr_NeedResponse
	 *            Ӧ�����
	 * @param keyValue
	 *            �̻���Կ
	 * @return
	 */
	private String orderid;// ����ID p2_Order
	private String amount; // ��� p3_Amt
	private String pd_FrpId; // ���к� pd_FrpId

	// �̻������õ�����Ϣ����merchantInfo.properties
	private String p1_MerId; // �̻�ID p1_MerId
	private String keyValue; // �̻���Կ keyValue
	private String p8_Url; // ����֧���ɹ��󷵻صĵ�ַ p8_Url

	// һ��Ĭ��ֵ
	private String p0_Cmd = "Buy";// ҵ������Ĭ��Ϊ"buy"
	private String p4_Cur = "CNY";// Ĭ�ϵ�λ�������
	private String p5_Pid = "";// ��ƷID ����
	private String p6_Pcat = "";// ��Ʒ���� ����
	private String p7_Pdesc = "";// ��Ʒ���� ����
	private String p9_SAF = "0"; // ����Ҫ��ַ
	private String pa_Mp = ""; // ����Ҫ�̻���չ��Ϣ
	private String pr_NeedResponse = "0"; // ����ҪӦ��
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

	// ��д execute()��validate()����
	@Action(value="go_pay", results={
			@Result(name=SUCCESS, location="/WEB-INF/user/connect.jsp")
	})
	public String execute() throws Exception {
		
		//��ת
		Properties props = PropertiesLoaderUtils.loadAllProperties("merchantInfo.properties");
		p1_MerId = props.getProperty("p1_MerId");
		keyValue = props.getProperty("keyValue");
		p8_Url = props.getProperty("merchantCallbackURL");
		// ����hmac��
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
