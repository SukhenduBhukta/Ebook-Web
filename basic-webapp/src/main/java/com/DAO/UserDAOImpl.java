package com.DAO;

import java.sql.*;

import com.entity.User;
public class UserDAOImpl implements UserDAO{
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User us) {
		boolean f=false;
		try {
			String sql="insert into user(name,email,phoneno,password) values(?,?,?,?)";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setString(1, us.getName());
			psmt.setString(2, us.getEmail());
			psmt.setString(3, us.getPhoneno());
			psmt.setString(4, us.getPassword());
			
			int i=psmt.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	
}
