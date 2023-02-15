<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  --%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="maincontainer4">
				<c:if test="${not empty sucMsg }">
					<h3 style="color:green;">${sucMsg }</h3>
					<c:remove var="sucMsg" scope="session"/>
				</c:if>
				 <c:if test="${not empty faildMsg }">
					<h3 style="color:red;">${faildMsg }</h3>
					<c:remove var="faildMsg" scope="session"/>
				</c:if>
        <table>
            <thead>
            <tr>
            	<th>Id</th>
                <th>Image</th>
                <th>Book Name</th>
                <th>Author Name</th>
                <th>Price</th>
                <th>Book Category</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
            BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
            List<BookDtls> list=dao.getAllBooks();
            for(BookDtls b : list){
            	%>
            	<tr>
                <td><%=b.getBookId() %></td>
                <td><img src="../Book/<%=b.getPhotoName() %>" style="width:5rem; height:5rem" ></td>
                <td><%=b.getBookname() %></td>
                <td><%=b.getAuthor() %></td>
                <td><%=b.getPrice() %></td>
                <td><%=b.getBookCategory() %></td>
                <td><%=b.getStatus() %></td>
                <td><a href="edit_book.jsp?id=<%=b.getBookId() %>"><button type="submit" class="edit">Edit</button></a>
                    <a href="../delete?id=<%=b.getBookId() %>"><button type="submit" class="delete">Delete</button></a>
                </td>
            </tr>
            <%
            }
            %>
            
            
 
            </tbody>
        </table>

    </div>

<%@include file="footer.jsp"%>
</body>
</html>