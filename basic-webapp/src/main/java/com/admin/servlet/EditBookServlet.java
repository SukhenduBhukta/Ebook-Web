package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBconnect;
import com.entity.BookDtls;

@WebServlet("/edit_book")
public class EditBookServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName=req.getParameter("bname");
			String author=req.getParameter("auth");
			String price=req.getParameter("price");
			String status=req.getParameter("status");
			
			BookDtls b=new BookDtls();
			b.setBookId(id);
			b.setBookname(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
			boolean f=dao.updateEditBooks(b);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("sucMsg", "Book updated Successfully...");
				resp.sendRedirect("admin/all_book.jsp");
			}
			else {
				session.setAttribute("faildMsg", "Something wrong on Server...");
				resp.sendRedirect("admin/all_book.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
