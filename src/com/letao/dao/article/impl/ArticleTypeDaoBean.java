package com.letao.dao.article.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.letao.dao.article.IArticleTypeDao;
import com.letao.dao.impl.DaoSupport;
import com.letao.model.PageModel;
import com.letao.model.article.ArticleCategory;

@Repository("articleTypeDaoBean")
@Transactional
public class ArticleTypeDaoBean extends DaoSupport<ArticleCategory> implements IArticleTypeDao {

	/**
	 * �����������
	 * 
	 * @param type
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public void addArticleType(ArticleCategory type) {
		save(type);
	}

	/**
	 * ��ȡ��ѯ��������
	 */
	@Override
	public PageModel<ArticleCategory> getArticleTypes() {
		return find(-1, -1);
	}

	
	/**
	 * 
	 * ����IDɾ������
	 * 
	 */
	@Override
	public void deleteById(int id) {
		delete(id);
	}

	
	/**
	 * �ж����������Ƿ��Ѿ�����
	 * 
	 */
	@Override
	public boolean isAlready(String articleName) {
		List<?> list = getTemplate().find(" from ArticleCategory where categoryName = ?", articleName);
		System.out.println(list.size()+"");
		if(list != null && list.size() > 0){
			return true;
		}
		return false;
	}

	
	/**
	 * ͨ��id������������
	 * 
	 */
	@Override
	public ArticleCategory getArticleTypeById(int id) {
		ArticleCategory category = get(id);
		System.out.println(category.getCategoryName());
		return category;
	}

	/**
	 * �޸���������
	 */
	@Override
	public void articleType_Edit(ArticleCategory category) {
		update(category);
	}
		
	
	
}
