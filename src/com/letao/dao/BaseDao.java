package com.letao.dao;

import java.io.Serializable;
import java.util.Map;

import com.letao.model.PageModel;

public interface BaseDao<T> {

	//��������
	/**
	 * ��������
	 * 
	 * @param object
	 *            ����Ķ���
	 */
	public void save(Object object);

	/**
	 * ��������
	 * 
	 * @param object
	 */
	public void update(Object object);

	/**
	 * ������߸�������
	 * 
	 * @param object
	 *            ���������µĶ���
	 */
	public void saveOrUpdate(Object object);

	/**
	 * ����idɾ������
	 * 
	 * @param ids
	 *            id����
	 */
	public void delete(Serializable... ids);

	/**
	 * ����ʵ�����
	 * 
	 * @param entityId
	 *            ʵ��ID
	 * @return ʵ����������
	 */
	public T get(Serializable entityId);

	/**
	 * ����ʵ�����
	 * 
	 * @param entityId
	 *            ʵ��ID
	 * @return ʵ����������
	 */
	public T load(Serializable entityId);

	/**
	 * ʹ��hql������
	 * 
	 * @param hql
	 *            hql���
	 * @param queryParams
	 *            ��ѯ����
	 * @return Object
	 */
	public Object uniqueResult(String hql, Object[] queryParams);

	// ��ҳ����
	/**
	 * ��ѯ��Ϣ����Ŀ
	 * 
	 * @return long
	 */
	public long getCount();

	public PageModel<T> find(int pageNo, int maxResult);

	// ������Ϣ��ҳ����
	public PageModel<T> find(int pageNo, int maxResult, String where,
			Object[] queryParams);

	// ��ָ�����������ҳ����
	public PageModel<T> find(int pageNo, int maxResult,
			Map<String, String> orderby);

	// ��ָ��������ҳ������ķ�ҳ����
	public PageModel<T> find(String where, Object[] queryParams,
			Map<String, String> orderby, int pageNo, int maxResult);

}
