package com.letao.dao.user;

import com.letao.dao.BaseDao;
import com.letao.model.user.User;

public interface IUserDao extends BaseDao<User> {

	public User login(String userName, String password);
	public boolean isUnique(String userName);
	
}
