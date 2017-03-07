package com.cuit.secims.xp.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cuit.secims.xp.dao.interfaces.UserDao;
import com.cuit.secims.xp.domin.User;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao{

	@Override
	public User findUserByName(String username) {
		// 继承SqlSessionDaoSupport,通过this.getSqlSession()得到sqlSession
		SqlSession sqlSession = this.getSqlSession();
		User user = sqlSession.selectOne("test.findUserByName", username);
		return user;
	}

}
