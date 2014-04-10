package com.letao.action.product;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.letao.action.BaseAction;
import com.letao.model.PageModel;
import com.letao.model.product.Comment;
import com.opensymphony.xwork2.ModelDriven;

@Namespace("/comment")
@Scope("prototype")
@Controller("commentAction")
public class CommentAction extends BaseAction  implements ModelDriven<Comment>  {
	private static final long serialVersionUID = 1L;
	
	
	@Action(value="add", results={
		@Result(name=SUCCESS, type="redirectAction",
				params={"actionName","product_info",
				"namespace","/product", 
				"id", "${productId.id}"}),
		@Result(name=INPUT, location="/WEB-INF/pages/login.jsp")
	})
	public String addComment() {
		if (getCus_session() == null) {
			return INPUT;
		} 
		System.out.println("id="+comment.getProductId().getId());
		comment.setCustomerId(getCus_session().getCusId());
		commentDaoBean.save(comment);
		return SUCCESS;
	}
	
	@Action(value="list", results={
		@Result(name=SUCCESS, location="/WEB-INF/admin/comment_pro.jsp")	
	})
	public String comment_list() {
		pageModel = commentDaoBean.find(pageNo, pageSize);
		return SUCCESS;
	}
	
	@Action(value="comment_delete", results={
			@Result(name=SUCCESS, location="list", type="redirectAction")	
		})
	public String comment_delete() {
		commentDaoBean.delete(comment.getId());
		return SUCCESS;
	}
	
	private Comment comment = new Comment();
	private PageModel<Comment> pageModel;
	
	@Override
	public Comment getModel() {
		return comment;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public PageModel<Comment> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<Comment> pageModel) {
		this.pageModel = pageModel;
	}

}
