package com.letao.dao.article;

import com.letao.dao.BaseDao;
import com.letao.model.PageModel;
import com.letao.model.article.ArticleCategory;

/**
 * 
 * @author ChengBin
 *
 */
public interface IArticleTypeDao extends BaseDao<ArticleCategory>{

	/**
	 * �����������
	 * 
	 * @param articleType ArticleType
	 */
	public void addArticleType(ArticleCategory articleType);

	/**
	 * ��ȡ����ArticleType
	 * 
	 */
	public PageModel<ArticleCategory> getArticleTypes();
	
	
	/**
	 * ͨ��ID������������
	 * @return
	 */
	public ArticleCategory getArticleTypeById(int id);
	
	
	/**
	 * �༭��������
	 * 
	 * @param category
	 */
	public void articleType_Edit(ArticleCategory category);
	
	
	/**
	 * ͨ��IDɾ����������
	 * @param id
	 */
	public void deleteById(int id);
	
	
	/**
	 * �ж�ĳ�������Ƿ����
	 * 
	 * @param articleName
	 * @return
	 */
	public boolean isAlready(String articleName);
	
	
}
