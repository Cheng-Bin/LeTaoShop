package com.letao.utils;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

@SuppressWarnings("rawtypes")
public class GenericsUtils {

	/**
	 * ��ȡ���͵���������
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
	 * ��ö����������
	 * 
	 * @param clazz
	 * @return
	 */
	public static String getGenericName(Class clazz) {
		return clazz.getSimpleName();
	}
}
