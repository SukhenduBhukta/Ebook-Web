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
<title>EBook: Book Details</title>
<%@include file="all_components/allCss.jsp"%>

</head>
<body>
<%@include file="all_components/navbar.jsp"%>
<div class="maincontainer3">
<%
int bid=Integer.parseInt(request.getParameter("bid"));
BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
BookDtls b=dao.getBookById(bid);

%>
        <div class="container">
           <div class="left">
            <div class="img">
                <img src="Book/<%=b.getPhotoName() %>" alt="">
            </div>
            <p>Book name: <span><%=b.getBookname() %></span></p>
            <p>Author Name: <span><%=b.getAuthor() %></span></p>
            <p>Catagory: <span><%=b.getBookCategory() %></span></p>
           </div>
           <div class="right">
            <p><%=b.getBookname() %></p>
            <%
            if("Old Book".equals(b.getBookCategory())){
            	%>
            	<h2 style="color: #99344a; font-size: 2rem;">Contact to Seller</h2>
            	<h2 style="color: #ff0099;">Email: <%=b.getEmail() %></h2>
            	<%
            }
            %>
            
            
            <div class="icon">
                <div class="ico1">
                    <i class="fa-solid fa-money-bill-wave"></i>
                    <p>Cash on Delevery</p>
                </div>
                <div class="ico1">
                    <i class="fa-solid fa-rotate-left"></i>
                    <p>Return Available</p>
                </div>
                <div class="ico1">
                    <i class="fa-solid fa-truck"></i>
                    <p>Free Delivery</p>
                </div>
            </div>
            <div class="btn">
            <%
            if("Old Book".equals(b.getBookCategory())){
            	%>
            	<a href=""><button type="submit"><i class="fa-solid fa-cart-shopping"></i> Continue Shoping</button></a>
            	<%
            }else{
            	%>
            	<a href=""><button type="submit"><i class="fa-solid fa-cart-shopping"></i> Add Cart</button></a>
            	<%
            }
            %>
                
                <p>₹<%=b.getPrice() %></p>
            </div>
           </div>
        </div>
        
    </div>
    <%@include file="all_components/footer.jsp"%>
    
</body>
</html>