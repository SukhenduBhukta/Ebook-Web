<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Home</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
 <div class="maincontainer3">
        <a href="add_book.jsp"><div class="card">
            <i class="fa-solid fa-circle-plus" style="color:rgb(71, 2, 98)"></i>
            <h2>Add Book</h2>
        </div></a>
        <a href="all_book.jsp">
            <div class="card">
                <i class="fa-solid fa-book" style="color:rgb(255, 0, 72)"></i>
                <h2>All Book</h2>
            </div>
        </a>
        <a href="order.jsp">
            <div class="card">
                <i class="fa-solid fa-cart-shopping" style="color:blue"></i>
                <h2>Order</h2>
            </div>
        </a>
       
    </div>
<%@include file="footer.jsp"%>
</body>
</html>