package com.letao.action.product;


import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.letao.action.BaseAction;
import com.letao.model.PageModel;
import com.letao.model.product.Favorite;
import com.letao.model.product.Product;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @description favorite Action
 * @author ChengBin
 * @date   2013-12-2下午1:31:20
 * @version 1.0
 */
@Namespace("/favorite")
@Scope("prototype")
@Controller("favoriteAction")
public class FavoriteAction extends BaseAction implements ModelDriven<Favorite> {
	private static final long serialVersionUID = 1L;
	
	@Action(value = "favorite_add", results = {@Result(name=SUCCESS, type="json") })
	public String favorite_add() {
		if (favorite == null) {
			exists = "1";
		}
		favorite.setCustomer(getCus_session());
		favoriteDaoBean.save(favorite);
		exists = "0";
		return SUCCESS;
	}
	
	/**
	 * 
	 * @description 根据用户查找分类
	 * 
	 * @author ChengBin
	 * @date   2013-12-3上午10:59:56
	 * @version 1.0
	 * @param
	 * @return String
	 *
	 */
	@Action(value = "favorite_list", results = { @Result(name = SUCCESS, location = "/WEB-INF/user/prodoct_fav.jsp") })
	public String favorite_list() {
		if (getCus_session() == null) {
			return INPUT;
		}
		int id = getCus_session().getCusId();
		String where = "where customerId = ?";
		Object[] params = new Object[]{id};
		pageModel = favoriteDaoBean.find(pageNo, pageSize, where, params);
		
		for (int i = 0; i < pageModel.getList().size(); i++) {
			Favorite favorite = pageModel.getList().get(i);
			int key = favorite.getId();
			Product value = productDaoBean.get(favorite.getProductId());
			map.put(key, value);
		}
		return SUCCESS;
	}
	
	@Action(value = "favorite_delete", results = { @Result(name = SUCCESS, location="favorite_list", type="redirectAction") }
	)
	public String favorite_delete() {
		if (favorite != null) {
			favoriteDaoBean.delete(favorite.getId());
		}
		return SUCCESS;
	}

	
	
	private Favorite favorite = new Favorite();
	private PageModel<Favorite> pageModel;
	private Map<Integer, Product> map = new HashMap<Integer, Product>();

	
	
	public Map<Integer, Product> getMap() {
		return map;
	}

	public void setMap(Map<Integer, Product> map) {
		this.map = map;
	}

	@Override
	public Favorite getModel() {
		return favorite;
	}

	public Favorite getFavorite() {
		return favorite;
	}

	public void setFavorite(Favorite favorite) {
		this.favorite = favorite;
	}
	
	private String exists;

	public String getExists() {
		return exists;
	}

	public void setExists(String exists) {
		this.exists = exists;
	}

	public PageModel<Favorite> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<Favorite> pageModel) {
		this.pageModel = pageModel;
	}
	
}
