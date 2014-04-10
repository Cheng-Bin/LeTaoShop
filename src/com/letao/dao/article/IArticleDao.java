package com.letao.dao.article;

import com.letao.dao.BaseDao;
import com.letao.model.PageModel;
import com.letao.model.article.Article;

public interface IArticleDao extends BaseDao<Article> {

	public void addArticle(Article article);
	
	public PageModel<Article> getArticles();
	
	public Article getArticleById(int id);
	
	public void deleteById(int ids);
	
	public void updateOrSave(Article article);
	
}
