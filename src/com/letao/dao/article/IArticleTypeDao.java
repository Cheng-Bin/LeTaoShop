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
	 * 添加文章类型
	 * 
	 * @param articleType ArticleType
	 */
	public void addArticleType(ArticleCategory articleType);

	/**
	 * 获取所有ArticleType
	 * 
	 */
	public PageModel<ArticleCategory> getArticleTypes();
	
	
	/**
	 * 通过ID查找文章类型
	 * @return
	 */
	public ArticleCategory getArticleTypeById(int id);
	
	
	/**
	 * 编辑新闻类型
	 * 
	 * @param category
	 */
	public void articleType_Edit(ArticleCategory category);
	
	
	/**
	 * 通过ID删除文章类型
	 * @param id
	 */
	public void deleteById(int id);
	
	
	/**
	 * 判断某种类型是否存在
	 * 
	 * @param articleName
	 * @return
	 */
	public boolean isAlready(String articleName);
	
	
}
