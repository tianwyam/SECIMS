package com.cuit.secims.mw.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cuit.secims.mw.pojo.User;

@Repository
public interface IUserDao {

	public List<User> getAll() ;
}
