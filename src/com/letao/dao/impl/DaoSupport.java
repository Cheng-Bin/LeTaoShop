package com.letao.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.letao.dao.BaseDao;
import com.letao.model.PageModel;
import com.letao.utils.GenericsUtils;
/**
 * 
 * @author ChengBin
 *
 *
 */
@SuppressWarnings("unchecked")
@Transactional
public class DaoSupport<T> implements BaseDao<T> {
	
	// ���͵�����
	protected Class<T> entityClass = GenericsUtils.getGenericType(this
				.getClass());
	
	
	// Hibernateģ��
	@Autowired
	protected HibernateTemplate template;

	public HibernateTemplate getTemplate() {
		return template;
	}

	@Override
	public void save(Object object) {
		getTemplate().save(object);
	}

	@Override
	public void update(Object object) {
		getTemplate().update(object);
	}

	@Override
	public void saveOrUpdate(Object object) {
		getTemplate().saveOrUpdate(object);
	}

	@Override
	public void delete(Serializable... ids) {
		for (Serializable id : ids) {
			T t = (T) getTemplate().load(this.entityClass, id);
			getTemplate().delete(t);
		}
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public T get(Serializable entityId) {
		return (T) getTemplate().get(this.entityClass, entityId);
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public T load(Serializable entityId) {
		return (T) getTemplate().load(this.entityClass, entityId);
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public Object uniqueResult(final String hql, final Object[] queryParams) {
		return getTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				setQueryParams(query, queryParams);
				return query.uniqueResult();
			}
		});
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public long getCount() {
		String hql = "select count(*) from "
				+ GenericsUtils.getGenericName(this.entityClass);
		return (Long) uniqueResult(hql, null);
	}

	@Override
	public PageModel<T> find(int pageNo, int maxResult) {
		return find(null, null, null, pageNo, maxResult);
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public PageModel<T> find(int pageNo, int maxResult, String where,
			Object[] queryParams) {
		return find(where, queryParams, null, pageNo, maxResult);
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public PageModel<T> find(int pageNo, int maxResult,
			Map<String, String> orderby) {
		return find(null, null, orderby, pageNo, maxResult);
	}

	/**
	 * ��ҳ��ѯ
	 * @param where ��ѯ����
	 * @param queryParams hql����ֵ
	 * @param orderby ����
	 * @param pageNo �ڼ�ҳ
	 * @param maxResult ���ؼ�¼����
	 * return PageModel
	 */
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public PageModel<T> find(final String where, final Object[] queryParams,
			final Map<String, String> orderby, final int pageNo,
			final int maxResult) {
		// ʵ������ҳ����
		final PageModel<T> pageModel = new PageModel<T>();
		pageModel.setPageNo(pageNo);// ���õ�ǰҳ��
		pageModel.setPageSize(maxResult);// ����ÿҳ��ʾ��¼��
		
		getTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				//ƴ��hql
				String hql = new StringBuilder().append("from ")
						.append(GenericsUtils.getGenericName(entityClass))
						.append(" ").append(where == null ? "" : where)
						.append(createOrderby(orderby)).toString();
				System.out.println(hql);
				Query query = session.createQuery(hql);// ִ�в�ѯ
				if (queryParams != null) {
					setQueryParams(query, queryParams);// Ϊ������ֵ
				}
				List<T> list = null;// ����List����
				if (maxResult < 0 && pageNo < 0) {
					list = query.list();// ����ѯ���ת��ΪList����
				} else {
					list = query
							.setFirstResult(getFirstPageResult(pageNo, maxResult)) // ���÷�ҳ��ʼλ��
							.setMaxResults(maxResult).list();

					// �����ѯ�ܼ�¼����hql���
					hql = new StringBuffer().append("select count(*) from ")// ���hql���
							.append(GenericsUtils.getGenericName(entityClass))// ��Ӷ�������
							.append(" ")// ��ӿո�
							.append(where == null ? "" : where)// ���whereΪnull����ӿո�,��֮���where
							.toString();// ת��Ϊ�ַ���

					query = session.createQuery(hql);// ִ�в�ѯ
					setQueryParams(query, queryParams);// ����hql����
					int totalRecords = ((Long) query.uniqueResult()).intValue();// ����ת��
					pageModel.setTotalRecords(totalRecords);// �����ܼ�¼��
				}
				pageModel.setList(list);// ����ѯ��list�������ʵ�������

				return null;
			}
		});

		return pageModel;
	}

	/**
	 * ΪSQLռλ����ֵ
	 * 
	 * @param query
	 * @param queryParams
	 */
	private void setQueryParams(Query query, Object[] queryParams) {	
		if (queryParams != null && queryParams.length > 0) {
			for (int i = 0; i < queryParams.length; i++) {
				query.setParameter(i, queryParams[i]);
			}
		}
	}

	/**
	 * ��������sql���
	 * 
	 * @param orderby
	 * @return
	 */
	private String createOrderby(Map<String, String> orderby) {
		StringBuffer sb = new StringBuffer("");
		if (orderby != null && orderby.size() > 0) {
			sb.append(" order by ");
			for (String key : orderby.keySet()) {
				sb.append(key).append(" ").append(orderby.get(key)).append(",");
			}
			sb.deleteCharAt(sb.length() - 1);
		}

		return sb.toString();
	}

	/**
	 * ��õ�ǰҳ�ĵ�һ����¼
	 * 
	 * @param pageNo
	 * @param maxResult
	 * @return
	 */
	private int getFirstPageResult(int pageNo, int maxResult) {
		int firstResult = (pageNo-1) * maxResult;
		return firstResult < 0 ? 0 : firstResult;
	}
	
	/**
	 * ��ȡSession����
	 * @return
	 */
	protected Session getSession(){
		return (!this.template.isAllowCreate() ?
		    SessionFactoryUtils.getSession(this.template.getSessionFactory(), false) :
				SessionFactoryUtils.getSession(
						this.template.getSessionFactory(),
						this.template.getEntityInterceptor(),
						this.template.getJdbcExceptionTranslator()));
	}

}
