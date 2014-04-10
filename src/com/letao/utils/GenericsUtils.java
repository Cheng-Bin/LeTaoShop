package com.letao.utils;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

@SuppressWarnings("rawtypes")
public class GenericsUtils {

	/**
	 * 获取泛型的数据类型
	 * 
	 * @param clazz
	 * @return
	 */
	public static Class getGenericType(Class clazz) {
		Type genType = clazz.getGenericSuperclass();
		Type []types = ((ParameterizedType)genType).getActualTypeArguments();
		if (!(types[0] instanceof Class)) {
			return Object.class;
		}
		
		return (Class)types[0];
	}
	
	/**
	 * 获得对象的类名称
	 * 
	 * @param clazz
	 * @return
	 */
	public static String getGenericName(Class clazz) {
		return clazz.getSimpleName();
	}
}
