package com.letao.model.article;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="article")
public class Article implements Serializable {
	private static final long serialVersionUID = -1966273852503735408L;
	
	private int articleId;
	private String articleTitle;
	private String articleLabel;
	private String articleAddress;
	private String articleStatement;
	private String articleUrl;
	private String articleContent;
	private ArticleCategory category;
	private Date addTime;
	private String addAuthor;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getArticleLabel() {
		return articleLabel;
	}

	public void setArticleLabel(String articleLabel) {
		this.articleLabel = articleLabel;
	}

	public String getArticleAddress() {
		return articleAddress;
	}

	public void setArticleAddress(String articleAddress) {
		this.articleAddress = articleAddress;
	}

	public String getArticleStatement() {
		return articleStatement;
	}

	public void setArticleStatement(String articleStatement) {
		this.articleStatement = articleStatement;
	}

	public String getArticleUrl() {
		return articleUrl;
	}

	public void setArticleUrl(String articleUrl) {
		this.articleUrl = articleUrl;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	//一的一方为EAGER
	@ManyToOne(fetch=FetchType.EAGER, cascade={CascadeType.REFRESH, CascadeType.MERGE}, optional=false)  
	@JoinColumn( name = "articleParentId")  
	public ArticleCategory getCategory() {
		return category;
	}

	public void setCategory(ArticleCategory category) {
		this.category = category; 
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="addTime")
	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public String getAddAuthor() {
		return addAuthor;
	}

	public void setAddAuthor(String addAuthor) {
		this.addAuthor = addAuthor;
	}

	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", articleTitle="
				+ articleTitle + ", articleLabel=" + articleLabel
				+ ", articleAddress=" + articleAddress + ", articleStatement="
				+ articleStatement + ", articleUrl=" + articleUrl
				+ ", articleContent=" + articleContent + ", category="
				+ category + ", addTime=" + addTime + ", addAuthor="
				+ addAuthor + "]";
	}
	
	
}
