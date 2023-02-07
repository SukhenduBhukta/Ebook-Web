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

	public User login(String email, String password) {
		User us=null;
		
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setString(1,email);
			psmt.setString(2, password);
			ResultSet rs=psmt.executeQuery();
			while(rs.next()) {
				us=new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhoneno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return us;
	}
	
	
	
}
