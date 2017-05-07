package com.cuit.secims.xp.dao;

import com.cuit.secims.xp.entity.Email;

public interface EmailDao {
	
	public int addEmailInfo(Email email);
	
	public Email getEmailInfo();
	
	public int updateEmailInfo(Email email);
	
}
