package com.letao.action.article;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;
import com.letao.action.BaseAction;
import com.letao.model.PageModel;
import com.letao.model.article.Article;
import com.letao.model.article.ArticleCategory;
import com.letao.model.user.User;
import com.letao.utils.DateUtils;
import com.letao.utils.FileUpload;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author ChengBin
 * 
 * @version 1.0  2013-11-20
 *
 */
@SuppressWarnings("serial")
@Controller("articleAction")
@Namespace("/article")
public class ArticleAction extends BaseAction implements ModelDriven<Article> {

	/**
	 * 
	 * @description 获取文章列表
	 * @author ChengBin
	 * @date   2013-11-26下午6:23:40
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value = "article_list", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/admin/article_list.jsp") }
	)
	public String articleList() {
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("articleId", "desc");
		pageModel = articleDaoBean.find(pageNo, pageSize, orderby);
		return SUCCESS;
	}

	/**
	 * 
	 * @description 添加文章page
	 * @author ChengBin
	 * @date   2013-11-26下午6:23:57
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value = "article_add", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/article_add.jsp")})
	public String articleAdd() {
		List<ArticleCategory> types = articleTypeDaoBean.getArticleTypes().getList();
		for (ArticleCategory type : types) {
			map.put(type.getCategoryId(), type.getCategoryName());
		}
		return SUCCESS;
	}
	
	/**
	 * 
	 * @description 保存文章
	 * @author ChengBin
	 * @date   2013-11-26下午6:24:05
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value="article_save", 
		results = {
			@Result(name=SUCCESS, location="article_list", type="redirectAction")}
	)
	public String article_save() {
		String dir = "";
		if (file != null) {
			try {
				dir = FileUpload.upload(file, "pic");
			} catch (IOException e) {
				return INPUT;
			}
		}
	
		Object obj = session.get("user");
		if (obj instanceof User) {
			article.setAddAuthor(((User) obj).getUserName());
		}
		article.setAddTime(DateUtils.getCurrentDate());
		article.setArticleUrl(dir);
		
		System.out.println("iididid="+article.getCategory().getCategoryId());
		articleDaoBean.updateOrSave(article);
		
		
		return SUCCESS;
	}
	
	
	/**
	 * 
	 * @description 根据ID删除文章
	 * @author ChengBin
	 * @date   2013-11-26下午6:24:37
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value="article_delete", results={
		@Result(name = SUCCESS, type="redirectAction", location = "article_list")
	})
	public String article_delete() {
		articleDaoBean.deleteById(article.getArticleId());
		return SUCCESS;
	}
	
	/**
	 * 
	 * @description 批量删除文章
	 * @author ChengBin
	 * @date   2013-11-26下午6:24:55
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value="article_dels", results={
			@Result(name = SUCCESS, type="redirectAction", location = "article_list")
		}
	)
	public String article_des() {
		if (ids != null && ids.length != 0) {
			for (int i = 0; i < ids.length; i++) {
				articleDaoBean.deleteById(ids[i]);
			}
		}
		return SUCCESS;
	}
	
	
	/**
	 * 
	 * @description 根据ID查找
	 * @author ChengBin
	 * @date   2013-11-26下午6:25:12
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value="article_edit", results={
			@Result(name = SUCCESS, location = "/WEB-INF/admin/article_edit.jsp"),
			@Result(name = ERROR, type="redirectAction", location="article_list")
		})
	public String getArticleById() {
		if (article == null) {
			return ERROR;
		}
		article = articleDaoBean.get(article.getArticleId());
		List<ArticleCategory> types = articleTypeDaoBean.getArticleTypes().getList();
		map.clear();
		for (ArticleCategory type : types) {
			map.put(type.getCategoryId(), type.getCategoryName());
		}
		return SUCCESS;
	}
	
	
	//前台
	@Action(value = "article", results = { @Result(name = SUCCESS, location = "/WEB-INF/pages/article_list.jsp") })
	public String article() {
		pageModel = articleDaoBean.find(pageNo, pageSize);
		return SUCCESS;
	}
	
	@Action(value = "article_content", 
			results = { 
				@Result(name = SUCCESS, location = "/WEB-INF/pages/article_content.jsp"),
				@Result(name = ERROR, type="redirectAction", location="article")})
	public String article_info() {
		if (article == null) {
			return ERROR;
		}
		article = articleDaoBean.get(article.getArticleId());
		pageModel = articleDaoBean.find(pageNo, 20);
		return SUCCESS;
	}
	
	//model
	private Article article = new Article();
	@Override
	public Article getModel() {
		return article;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}

	//pageModel
	private PageModel<Article> pageModel;
	public PageModel<Article> getPageModel() {
		return pageModel;
	}
	public void setPageModel(PageModel<Article> pageModel) {
		this.pageModel = pageModel;
	}

	//分类
	private Map<Integer, String> map = new HashMap<Integer, String>();
	public Map<Integer, String> getMap() {
		return map;
	}
	public void setMap(Map<Integer, String> map) {
		this.map = map;
	}
	
	//文件
	private File file;
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	
	//id
	private int []ids;
	public int[] getIds() {
		return ids;
	}
	public void setIds(int[] ids) {
		this.ids = ids;
	}
	
}
