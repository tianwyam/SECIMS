package com.cuit.secims.xp.dao.interfaces;

import com.cuit.secims.xp.domin.User;

public interface UserDao {
	public User findUserByName(String username);
}
