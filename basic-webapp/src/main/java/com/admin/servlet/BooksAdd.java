package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBconnect;
import com.entity.BookDtls;
@WebServlet("/add_book")
@MultipartConfig
public class BooksAdd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName=req.getParameter("bname");
			String author=req.getParameter("auth");
			String price=req.getParameter("price");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			BookDtls b=new BookDtls(bookName,author,price,category,status,fileName,"admin@gmail.com");
			BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
			
			
			
			  boolean f=dao.addBooks(b);
			  HttpSession session=req.getSession(); 
			  
			  if(f) {
			  
				  String path=getServletContext().getRealPath("")+"Book";
//					File file=new File(path);
					
					part.write(path + File.separator + fileName);
			  
			  session.setAttribute("sucMsg", "Book added Successfully...");
			 resp.sendRedirect("admin/add_book.jsp"); 
			 } 
			  else {
			  session.setAttribute("faileMsg", "Something wrong on Server...");
			 resp.sendRedirect("admin/add_book.jsp"); }
			 
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
