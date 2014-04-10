package com.letao.utils;

/**
 * 
 * @description 
 * @author ChengBin
 * @date   2013-11-30����10:30:25
 * @version 1.0
 */
public class payOnlineUtil {
	/**
	 * ����hmac����
	 * 
	 * @param p0_Cmd
	 *            ҵ������
	 * @param p1_MerId
	 *            �̻����
	 * @param p2_Order
	 *            �̻�����ID��
	 * @param p3_Amt
	 *            ֧�����
	 * @param p4_Cur
	 *            ���ױ���
	 * @param p5_Pid
	 *            ��Ʒ����
	 * @param p6_Pcat
	 *            ��Ʒ����
	 * @param p7_Pdesc
	 *            ��Ʒ����
	 * @param p8_Url
	 *            �̻�����֧���ɹ���ĵ�ַ
	 * @param p9_SAF
	 *            �ͻ���ַ
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
	public static String createHmac(String p0_Cmd, String p1_MerId,
			String p2_Order, String p3_Amt, String p4_Cur, String p5_Pid,
			String p6_Pcat, String p7_Pdesc, String p8_Url,
			String p9_SAF, String pa_MP, String pd_FrpId,
			String pr_NeedResponse, String keyValue) {
		StringBuffer sValue = new StringBuffer();
		sValue.append(p0_Cmd);
		sValue.append(p1_MerId);
		sValue.append(p2_Order);
		sValue.append(p3_Amt);
		sValue.append(p4_Cur);
		sValue.append(p5_Pid);
		sValue.append(p6_Pcat);
		sValue.append(p7_Pdesc);
		sValue.append(p8_Url);
		sValue.append(p9_SAF);
		sValue.append(pa_MP);
		sValue.append(pd_FrpId);
		sValue.append(pr_NeedResponse);
		String resultValue = DigestUtil.hmacSign(sValue.toString(), keyValue);
		return resultValue;
	}

	/**
	 * ����У��hmac����
	 * 
	 * @param hmac
	 *            ֧�����ط����ļ�����֤��
	 * @param p1_MerId
	 *            �̻����
	 * @param r0_Cmd
	 *            ҵ������
	 * @param r1_Code
	 *            ֧�����
	 * @param r2_TrxId
	 *            �ױ�֧��������ˮ��
	 * @param r3_Amt
	 *            ֧�����
	 * @param r4_Cur
	 *            ���ױ���
	 * @param r5_Pid
	 *            ��Ʒ����
	 * @param r6_Order
	 *            �̻�������
	 * @param r7_Uid
	 *            �ױ�֧����ԱID
	 * @param r8_MP
	 *            �̻���չ��Ϣ
	 * @param r9_BType
	 *            ���׽����������
	 * @param keyValue
	 *            ��Կ
	 * @return
	 */
	public static boolean verifyCallback(String hmac, String p1_MerId,
			String r0_Cmd, String r1_Code, String r2_TrxId, String r3_Amt,
			String r4_Cur, String r5_Pid, String r6_Order, String r7_Uid,
			String r8_MP, String r9_BType, String keyValue) {
		StringBuffer sValue = new StringBuffer();
		// �̻����
		sValue.append(p1_MerId);
		// ҵ������
		sValue.append(r0_Cmd);
		// ֧�����
		sValue.append(r1_Code);
		// �ױ�֧��������ˮ��
		sValue.append(r2_TrxId);
		// ֧�����
		sValue.append(r3_Amt);
		// ���ױ���
		sValue.append(r4_Cur);
		// ��Ʒ����
		sValue.append(r5_Pid);
		// �̻�������
		sValue.append(r6_Order);
		// �ױ�֧����ԱID
		sValue.append(r7_Uid);
		// �̻���չ��Ϣ
		sValue.append(r8_MP);
		// ���׽����������
		sValue.append(r9_BType);
		String sNewString = DigestUtil.hmacSign(sValue.toString(), keyValue);

		if (hmac.equals(sNewString)) {
			return true;
		}
		return false;
	}
}
