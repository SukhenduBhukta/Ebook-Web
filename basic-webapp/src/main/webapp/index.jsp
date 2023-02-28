<%@page import="com.entity.User"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_components/allCss.jsp"%>

</head>
<body>
<%
User u=(User)session.getAttribute("userobj");

%>
<%@include file="all_components/navbar.jsp"%>
<div class="maincontainer">
<div class="carusal">
            <h2>E-Book Management System</h2>
        </div>
        <!-- recent -->

        <div class="recent">
            <h2>Recent Book</h2>
            <div class="container">
            <%
            BookDAOImpl dao2=new BookDAOImpl(DBconnect.getConn());
            List<BookDtls> list2=dao2.getRecentBook();
            for(BookDtls b:list2){
            	%>
            	<div class="card">
                    <div class="img">
                        <img src="Book/<%=b.getPhotoName() %>" alt="">
                    </div>
                    <p><%=b.getBookname() %></p>
                    <p><%=b.getAuthor() %></p>
                    <p>Catagory: <%=b.getBookCategory() %></p>
                    <%
                    if(b.getBookCategory().equals("Old Book")){
                    	%>
                    	<div class="btn">
                        <a href="view_book.jsp?bid=<%=b.getBookId() %>"><button class="buy">View</button></a>
                        <button class="mrp"><%=b.getPrice() %></button>
                    </div>
                    	<%
                    }else{
                    	%>
                    	<div class="btn">
                        <%
                    if(u==null){
                    	%>
                    	<a href="login.jsp"><button class="addtocart">Cart</button></a>
                    	<%
                    }else{
                    	%>
                    	<a href="cartServlet?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"><button class="addtocart">Cart</button></a>
                    	<%
                    }
                    %>
                        <a href="view_book.jsp?bid=<%=b.getBookId() %>"><button class="buy">View</button></a>
                        <button class="mrp"><%=b.getPrice() %></button>
                    </div>
                    	<%
                    }
                    %>
                
                </div>
            
            	<%
            }
            %>
              </div>  
            <a href="all_resent_book.jsp"><button class="view">View All</button></a>
        </div>
        <!-- end recent -->
        
        <!-- Start new -->
        <div class="recent">
            <h2>New Book</h2>
            <div class="container">
            <%
            BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
            List<BookDtls> list=dao.getNewBook();
            for(BookDtls b:list){
            	%>
            	<div class="card">
                    <div class="img">
                        <img src="Book/<%=b.getPhotoName() %>" alt="">
                    </div>
                    <p><%=b.getBookname() %></p>
                    <p><%=b.getAuthor() %></p>
                    <p>Catagory: <%=b.getBookCategory() %></p>
                    <div class="btn">
                    <%
                    if(u==null){
                    	%>
                    	<a href="login.jsp"><button class="addtocart">Cart</button></a>
                    	<%
                    }else{
                    	%>
                    	<a href="cartServlet?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"><button class="addtocart">Cart</button></a>
                    	<%
                    }
                    %>

                        <a href="view_book.jsp?bid=<%=b.getBookId() %>"><button class="buy">View</button></a>
                        <button class="mrp"><%=b.getPrice() %></button>
                    </div>
                </div>
            	<%
            }
            %>
                
            </div>
            <a href="all_new_book.jsp"><button class="view">View All</button></a>
        </div>
        <!-- end new -->
        
        <!-- Start old -->
        <div class="recent">
            <h2>Old Book</h2>
            <div class="container">
                
                <%
                BookDAOImpl dao3=new BookDAOImpl(DBconnect.getConn());
                List<BookDtls> list3=dao3.getOldBook();
                for(BookDtls b:list3){
                	%>
                	<div class="card">
                    <div class="img">
                        <img src="Book/<%=b.getPhotoName() %>" alt="">
                    </div>
                    <p><%=b.getBookname() %></p>
                    <p><%=b.getAuthor() %></p>
                    <p>Catagory: <%=b.getBookCategory() %></p>
                    <div class="btn">
                        
                        <a href="view_book.jsp?bid=<%=b.getBookId() %>"><button class="buy">View</button></a>
                        <button class="mrp"><%=b.getPrice() %></button>
                    </div>
                </div>
                	<%
                }
                %>
                
                
            </div>
            <a href="all_old_book.jsp"><button class="view">View All</button></a>
        </div>
        <!-- end old -->
        <%@include file="all_components/footer.jsp"%>
        </div>

</body>
</html>