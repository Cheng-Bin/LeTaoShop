package com.letao.model;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @description ����״̬
 * @author ChengBin
 * @date   2013-11-28����12:13:29
 * @version 1.0
 */
public enum OrderState {
	NOPAY{
		@Override
		public String getName() {
			return "�ȴ���Ҹ���";
		}
		@Override
		public String next() {
			return NOT.getName();
		}
	},
	NOT{
		@Override
		public String getName() {
			return "�ȴ����ҷ���";
		}

		@Override
		public String next() {
			return WAIT.getName();
		}
		
	},
	DELIVERED {
		@Override
		public String getName() {
			return "�ѷ���";
		}

		@Override
		public String next() {
			return WAIT.getName();
		}
	},
	WAIT{
		public String getName() {
			return "�ȴ����ȷ���ջ�";
		}
		@Override
		public String next() {
			return FINISH.getName();
		}
	},
	FINISH{
		@Override
		public String getName() {
			return "�������";
		}

		@Override
		public String next() {
			return null;
		}
	},
	CANCLE{
		@Override
		public String getName() {
			return "��ȡ��";
		}

		@Override
		public String next() {
			return null;
		}
	};
	
	public abstract String next();
	public abstract String getName();
	public static List<String> getValues(){
		List<String> list = new ArrayList<String>();
		for (OrderState orderState : OrderState.values()) {
			list.add(orderState.getName());
		}
		return list;
	}
}
