package com.letao.dao.product.impl;

import org.springframework.stereotype.Repository;

import com.letao.dao.impl.DaoSupport;
import com.letao.dao.product.IFavoriteDao;
import com.letao.model.product.Favorite;

@Repository(value="favoriteDaoBean")
public class FavoriteDaoBean extends DaoSupport<Favorite> implements IFavoriteDao {

}
