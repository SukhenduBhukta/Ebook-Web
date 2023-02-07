package com.user.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBconnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2055534062912073388L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phoneno=req.getParameter("phoneno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			//System.out.println(name+" "+email+" "+phoneno+" "+password+" "+check);
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhoneno(phoneno);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
			
			if(check!=null) {
				UserDAOImpl dao=new UserDAOImpl(DBconnect.getConn());
				boolean f=dao.userRegister(us);
				if(f) {
					//System.out.println("Successfully Register...");
					session.setAttribute("sucMsg", "Successfully Register...");
					resp.sendRedirect("login.jsp");
				}
				else {
					//System.out.println("Something wrong on server");
					session.setAttribute("faildMsg", "Something wrong on server...");
					resp.sendRedirect("register.jsp");
				}
			}
			else {
				//System.out.println("Please Check Agree term & condition");
				session.setAttribute("faildMsg", "Please Check Agree term & condition");
				resp.sendRedirect("register.jsp");
			}
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
