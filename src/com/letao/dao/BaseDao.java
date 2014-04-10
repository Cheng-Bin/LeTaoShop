package com.letao.dao;

import java.io.Serializable;
import java.util.Map;

import com.letao.model.PageModel;

public interface BaseDao<T> {

	//基本操作
	/**
	 * 保存数据
	 * 
	 * @param object
	 *            保存的对象
	 */
	public void save(Object object);

	/**
	 * 更新数据
	 * 
	 * @param object
	 */
	public void update(Object object);

	/**
	 * 保存或者更新数据
	 * 
	 * @param object
	 *            被保存或更新的对象
	 */
	public void saveOrUpdate(Object object);

	/**
	 * 根据id删除数据
	 * 
	 * @param ids
	 *            id数组
	 */
	public void delete(Serializable... ids);

	/**
	 * 加载实体对象
	 * 
	 * @param entityId
	 *            实体ID
	 * @return 实体数据类型
	 */
	public T get(Serializable entityId);

	/**
	 * 加载实体对象
	 * 
	 * @param entityId
	 *            实体ID
	 * @return 实体数据类型
	 */
	public T load(Serializable entityId);

	/**
	 * 使用hql语句操作
	 * 
	 * @param hql
	 *            hql语句
	 * @param queryParams
	 *            查询参数
	 * @return Object
	 */
	public Object uniqueResult(String hql, Object[] queryParams);

	// 分页操作
	/**
	 * 查询信息总数目
	 * 
	 * @return long
	 */
	public long getCount();

	public PageModel<T> find(int pageNo, int maxResult);

	// 搜索信息分页方法
	public PageModel<T> find(int pageNo, int maxResult, String where,
			Object[] queryParams);

	// 按指定条件排序分页方法
	public PageModel<T> find(int pageNo, int maxResult,
			Map<String, String> orderby);

	// 按指定条件分页和排序的分页方法
	public PageModel<T> find(String where, Object[] queryParams,
			Map<String, String> orderby, int pageNo, int maxResult);

}
