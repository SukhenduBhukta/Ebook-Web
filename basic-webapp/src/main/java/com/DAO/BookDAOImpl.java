package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO {
	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDtls b) {
		boolean f=false;
		try {
			String sql="insert into book_dtls(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setString(1, b.getBookname());
			psmt.setString(2, b.getAuthor());
			psmt.setString(3, b.getPrice());
			psmt.setString(4, b.getBookCategory());
			psmt.setString(5, b.getStatus());
			psmt.setString(6, b.getPhotoName());
			psmt.setString(7, b.getEmail());
			
			int i=psmt.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<BookDtls> getAllBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls";
			PreparedStatement psmt=conn.prepareStatement(sql);
			
			ResultSet rs=psmt.executeQuery();
			while (rs.next()) {
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
;				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public BookDtls getBookById(int id) {
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookId=?";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setInt(1, id);
			
			ResultSet rs=psmt.executeQuery();
			while(rs.next()) {
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public boolean updateEditBooks(BookDtls b) {
		boolean f=false;
		try {
			String sql="update book_dtls set bookname=?, author=?,price=?,status=? where BookId=?";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setString(1, b.getBookname());
			psmt.setString(2, b.getAuthor());
			psmt.setString(3, b.getPrice());
			psmt.setString(4, b.getStatus());
			psmt.setInt(5, b.getBookId());
			
			int i=psmt.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteBook(int id) {
		boolean f=false;
		try {
			String sql="delete from book_dtls where bookId=?";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setInt(1, id);
			int i=psmt.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<BookDtls> getNewBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="Select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setString(1, "New Book");
			psmt.setString(2, "Active");
			ResultSet rs=psmt.executeQuery();
			int i=0;
			while (rs.next() && i<4) {
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public List<BookDtls> getRecentBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="Select * from book_dtls where status=? order by bookId DESC";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setString(1, "Active");
			ResultSet rs=psmt.executeQuery();
			int i=0;
			while (rs.next() && i<4) {
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public List<BookDtls> getOldBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="Select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setString(1, "Old Book");
			psmt.setString(2, "Active");
			ResultSet rs=psmt.executeQuery();
			int i=0;
			while (rs.next() && i<4) {
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public List<BookDtls> getAllRecentBook() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			
			String sql="select * from book_dtls where status=? order by bookId DESC";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setString(1, "Active");
			ResultSet rs = psmt.executeQuery();
			while(rs.next()){
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public List<BookDtls> getAllNewBook() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setString(1, "New Book");
			psmt.setString(2, "Active");
			ResultSet rs = psmt.executeQuery();
			while(rs.next()){
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public List<BookDtls> getAllOldBook() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setString(1, "Old Book");
			psmt.setString(2, "Active");
			ResultSet rs = psmt.executeQuery();
			while(rs.next()){
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	

}
