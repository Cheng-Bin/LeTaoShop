package com.letao.action.article;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.letao.action.BaseAction;
import com.letao.model.PageModel;
import com.letao.model.article.ArticleCategory;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author ChengBin
 *
 */
@SuppressWarnings("serial")
@Controller("articleCategoryAction")
@Scope("prototype")
@Namespace("/articleType")
public class ArticleCategoryAction extends BaseAction implements
		ModelDriven<ArticleCategory> {

	/**
	 * ��ȡ������������
	 * 
	 * @return
	 */
	@Action(value = "artcat_list", 
			results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/admin/category_list.jsp")})
	public String get_articleypes() {
		pageModel = articleTypeDaoBean.find(pageNo, pageSize);
		return SUCCESS;
	}

	/**
	 * ���URL
	 * @return
	 */
	@Action(value = "artcat_add", results = { @Result(name = SUCCESS, location = "/WEB-INF/admin/category_add.jsp") })
	public String artcat_add() {
		return SUCCESS;
	}

	/**
	 * �����������͵����ݿ�
	 * 
	 * @return
	 */
	@Action(value = "articleType_save",
	interceptorRefs = {
					@InterceptorRef(value="defaultStack"),
					@InterceptorRef(value="tokenSession", params={"includeMethods", "save"})
			},
	results = { 
			@Result(name = SUCCESS, type="redirectAction",  location = "artcat_list")})
	public String save() {
		//System.out.println(type.getCategoryName());
		//System.out.println(type.getCategoryIntro());
		articleTypeDaoBean.saveOrUpdate(type);
		return SUCCESS;
	}
	
	/**
	 * ����IDɾ������
	 * @return
	 */
	@Action(value="articleType_delete", results = { 
			@Result(name = SUCCESS, type="redirectAction",  location = "artcat_list")})
	public String articleDelete() {
		int id = type.getCategoryId();
		articleTypeDaoBean.deleteById(id);
		return SUCCESS;
	}
	
	/**
	 * ����ID������������
	 * @return
	 */
	@Action(value="articleType_edit", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/admin/category_edit.jsp"),
			@Result(name = INPUT, location = "/WEB-INF/admin/main.jsp")})
	public String articleTypeEdit() {
		type = articleTypeDaoBean.getArticleTypeById(type.getCategoryId());
		if (type == null) {
			return INPUT;
		}
		return SUCCESS;
	}
	
	
	@Action(value="articleType_already", results={
			@Result(type="json")
	})
	public String isAlready() {
		boolean flag = articleTypeDaoBean.isAlready(type.getCategoryName());
		if (flag) {
			exists = "1";
		} else {
			exists = "0";
		}
		return SUCCESS;
	}
	
	/**
	 * �ж��������������Ƿ��ظ�
	 * 
	 * @return
	 */
	@Action(value="articleType_repeat", results={
			@Result(type="json")
	})
	public String isAlreadyNotIncludeSelf() {
		int id = type.getCategoryId();
		String name = type.getCategoryName();
		exists = "0";
		
		boolean flag = articleTypeDaoBean.isAlready(name);
		if (!flag) {	//����������Ʋ�����
			exists = "0";
		} else {
			//������ʹ���
			pageModel = articleTypeDaoBean.getArticleTypes();
			int size = pageModel.getList().size();
			
			int i = 0;
			for (; i < size; i++) {
				type = pageModel.getList().get(i);
				//������ʱ������������ƴ��ڣ�����id��ͬ
				if (name.equals(type.getCategoryName()) && type.getCategoryId() != id) {
					exists = "1";
					break;
				}
			}
		}
	
		return SUCCESS;
	}

	
	
	private ArticleCategory type = new ArticleCategory();
	
	@Override
	public ArticleCategory getModel() {
		return type;
	}
	
	public ArticleCategory getType() {
		return type;
	}

	public void setType(ArticleCategory type) {
		this.type = type;
	}

	private PageModel<ArticleCategory> pageModel;

	public PageModel<ArticleCategory> getPageModel() {
		return pageModel;
	}
	
	
	private String exists;

	public String getExists() {
		return exists;
	}
	public void setExists(String exists) {
		this.exists = exists;
	}
}
