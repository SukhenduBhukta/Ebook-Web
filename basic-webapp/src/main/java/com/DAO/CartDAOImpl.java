package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;
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

	public List<Cart> getBookByUser(int userId) {
		List<Cart> list=new ArrayList<Cart>();
		Cart c=null;
		double totalPrice=0;
		try {
			String sql="select * from cart where uid=? order by cid DESC";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setInt(1, userId);
			ResultSet rs=psmt.executeQuery();
			while(rs.next()) {
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				totalPrice+=rs.getDouble(7);
				c.setTprice(totalPrice);
				list.add(c);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteBook(int bid, int uid) {
		boolean f=false;
		try {
			String sql="delete from cart where bid=? and uid=?";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setInt(1, bid);
			psmt.setInt(2, uid);
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
