package com.letao.model;


/**
 * 
 * @description ֧����ʽ
 * @author ChengBin
 * @date   2013-11-28����12:13:55
 * @version 1.0
 */
public enum PaymentWay {
	NET_BANK{
		@Override
		public String getName() {
			return "��������֧��";
		}
	},
	ALIPAY{
		@Override
		public String getName() {
			return "֧����";
		}
	},
	FINISH_PAY{
		@Override
		public String getName() {
			return "��������";
		}
	},
	POSTOFFICE_PAY{
		@Override
		public String getName() {
			return "�ʾֻ��";
		}
	};
	public abstract String getName();
}
