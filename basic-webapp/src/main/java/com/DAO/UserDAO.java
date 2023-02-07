package com.DAO;

import com.entity.*;

public interface UserDAO {
	public boolean userRegister(User us);
	public User login(String email, String password);
}
