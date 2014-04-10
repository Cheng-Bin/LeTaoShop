package com.letao.model;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @description 订单状态
 * @author ChengBin
 * @date   2013-11-28下午12:13:29
 * @version 1.0
 */
public enum OrderState {
	NOPAY{
		@Override
		public String getName() {
			return "等待买家付款";
		}
		@Override
		public String next() {
			return NOT.getName();
		}
	},
	NOT{
		@Override
		public String getName() {
			return "等待卖家发货";
		}

		@Override
		public String next() {
			return WAIT.getName();
		}
		
	},
	DELIVERED {
		@Override
		public String getName() {
			return "已发货";
		}

		@Override
		public String next() {
			return WAIT.getName();
		}
	},
	WAIT{
		public String getName() {
			return "等待买家确认收货";
		}
		@Override
		public String next() {
			return FINISH.getName();
		}
	},
	FINISH{
		@Override
		public String getName() {
			return "交易完成";
		}

		@Override
		public String next() {
			return null;
		}
	},
	CANCLE{
		@Override
		public String getName() {
			return "已取消";
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
