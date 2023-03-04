package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBconnect;
@WebServlet("/removeBook")
public class RemoveBookCart extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			CartDAOImpl dao=new CartDAOImpl(DBconnect.getConn());
			boolean f=dao.deleteBook(bid,uid);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("sucMsg", "Book removed");
				resp.sendRedirect("cart.jsp");
			}
			else {
				session.setAttribute("faildMsg", "Something went wrong");
				resp.sendRedirect("cart.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
