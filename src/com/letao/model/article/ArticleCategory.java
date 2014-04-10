package com.letao.model.article;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * @description 文章类别表
 * 
 * @author ChengBin
 * @date
 */
@SuppressWarnings("serial")
@Entity
@Table(name="articleCategory")
public class ArticleCategory implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int categoryId;
	private String categoryName;
	private String categoryIntro;
	
	//Many端默认为LAZY
	@OneToMany(cascade={CascadeType.ALL}, fetch=FetchType.LAZY, 
				mappedBy="category", targetEntity=Article.class)
	private Set<Article> articles;

	
	public ArticleCategory() {}
	
	public ArticleCategory(int categoryId, String categoryName, String categoryIntro) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryIntro = categoryIntro;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryIntro() {
		return categoryIntro;
	}

	public void setCategoryIntro(String categoryIntro) {
		this.categoryIntro = categoryIntro;
	}

	@Override
	public String toString() {
		return "ArticleCategory [categoryId=" + categoryId + ", categoryName="
				+ categoryName + ", categoryIntro=" + categoryIntro + "]";
	}
	
	public Set<Article> getArticles() {
		return articles;
	}

	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}	

}
