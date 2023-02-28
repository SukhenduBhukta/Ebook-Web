package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO{

	private Connection conn;
	public CartDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addCart(Cart c) {
		boolean f=false;
		try {
			String sqlString="insert into cart(bid,uid,bname,author,price,tprice) values(?,?,?,?,?,?)";
			PreparedStatement psmt=conn.prepareStatement(sqlString);
			psmt.setInt(1, c.getBid());
			psmt.setInt(2, c.getUserId());
			psmt.setString(3, c.getBookName());
			psmt.setString(4, c.getAuthor());
			psmt.setDouble(5, c.getPrice());
			psmt.setDouble(6, c.getTprice());
			int i=psmt.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
}
