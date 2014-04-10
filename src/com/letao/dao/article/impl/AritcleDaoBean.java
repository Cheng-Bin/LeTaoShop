package com.letao.dao.article.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.letao.dao.article.IArticleDao;
import com.letao.dao.impl.DaoSupport;
import com.letao.model.PageModel;
import com.letao.model.article.Article;

/**
 * 
 * @author ChengBin
 *
 */
@Repository(value="articleDaoBean")
public class AritcleDaoBean extends DaoSupport<Article> implements IArticleDao {

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public void addArticle(Article article) {
		save(article);
	}

	@Override
	public Article getArticleById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteById(int ids) {
		delete(ids);
	}

	@Override
	public PageModel<Article> getArticles() {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Transactional(propagation=Propagation.REQUIRED)
	public void updateOrSave(Article article) {
		saveOrUpdate(article);
	}

	

}
