<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="maincontainer2">
		<div class="wrapper">
			<%
				int id=Integer.parseInt(request.getParameter("id"));
				BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
				BookDtls b=dao.getBookById(id);
			%>
		
			<form action="../edit_book" method="post" class="contain" >
				<input type="hidden" name="id" value="<%=b.getBookId()%>">
				<h2>Edit Add</h2>
				 

				<div class="inputbox">
					<input type="text" name="bname" required="required" value="<%=b.getBookname() %>" /> <span>Book
						Name</span>
				</div>
				<div class="inputbox">
					<input type="text" name="auth" required="required" value="<%=b.getAuthor() %>"  /> <span>Author Name</span>
				</div>
				<div class="inputbox">
					<input type="number" name="price" required="required" value="<%=b.getPrice() %>"  /> <span>Price
						</span>
				</div>
				
				<div class="inputbox">
					<select name="status" required="required">
					<%
					if("Active".equals(b.getStatus())){
					%>
					<option value="Active">Active</option>
					<option value="Inactive">Inactive</option>
					<%
					}
					else{
					%>
					<option value="Inactive">Inactive</option>
					<option value="Active">Active</option>
					<%	
					}
					%>
					</select> <span>Book Status</span>
				</div>
				
					<div class="btn">
					<button type="submit">
						<span>Update</span>
					</button>
				</div>
			</form>
		</div>
		<%@include file="footer.jsp"%>
</body>
</html>