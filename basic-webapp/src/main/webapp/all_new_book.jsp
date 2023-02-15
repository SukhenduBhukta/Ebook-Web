<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebbok: All New Book</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
<%@include file="all_components/navbar.jsp"%>
<div class="maincontainer">

<div class="recent">
            <h2>New Book</h2>
            <div class="container">
            <%
            BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
            List<BookDtls> list=dao.getAllNewBook();
            for(BookDtls b:list){
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
                        <button class="buy">View</button>
                        <button class="mrp"><%=b.getPrice() %></button>
                    </div>
                    	<%
                    }else{
                    	%>
                    	<div class="btn">
                        <button class="addtocart">Cart</button>
                        <button class="buy">View</button>
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
            
        </div>
        <%@include file="all_components/footer.jsp"%>
</div>
</body>
</html>