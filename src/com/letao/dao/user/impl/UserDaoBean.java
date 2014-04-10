package com.letao.dao.user.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.letao.dao.impl.DaoSupport;
import com.letao.dao.user.IUserDao;
import com.letao.model.user.User;

@Repository("userDaoBean")
@Transactional
public class UserDaoBean extends DaoSupport<User> implements IUserDao {

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public User login(String userName, String password) {
		if (userName != null && password != null) {
			String where = "where userName=? and password=?";
			Object[] queryParams = {userName,password};//设置参数对象数组
			List<User> list = find(-1, -1, where, queryParams).getList();
			if(list != null && list.size() > 0){//如果list集合不为空
				return list.get(0);//返回List中的第一个存储对象
			}
		}
		return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public boolean isUnique(String userName) {
		List list = getTemplate().find("from User where adminName = ?", userName);
		if(list != null && list.size() > 0){
			return false;
		}
		return true;
	}

}
