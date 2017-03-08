package com.cuit.secims.mw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cuit.secims.mw.dao.IUserDao;
import com.cuit.secims.mw.pojo.User;

@Service
public class UserSV {
	
	@Autowired
	private IUserDao dao ;

	
	public List<User> getAll() {
		return this.dao.getAll();
	}
}
