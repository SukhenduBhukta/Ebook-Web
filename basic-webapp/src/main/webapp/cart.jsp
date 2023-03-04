<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Cart</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
<%@include file="all_components/navbar.jsp"%>
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<div class="maincontainer4">
        <div class="item">
            <h2>Your Selected Items</h2>
            <c:if test="${not empty sucMsg }">
            <p style="color:green;">${sucMsg }</p>
            <c:remove var="sucMsg" scope="session"/>
            </c:if>
            <c:if test="${not empty faildMsg }">
					<p style="color:red;">${faildMsg }</p>
					<c:remove var="faildMsg" scope="session"/>
				</c:if>
<table>
  <tr>
    <th>Book Name</th>
    <th>Author</th>
    <th>Price</th>
    <th>Action</th>
  </tr>
  <%
  User u=(User)session.getAttribute("userobj");
  CartDAOImpl dao=new CartDAOImpl(DBconnect.getConn());
  List<Cart> list=dao.getBookByUser(u.getId());
  double total=0.0;
  for(Cart c: list){
	  total=c.getTprice();
	  %>
	  <tr>
    <td><%=c.getBookName() %></td>
    <td><%=c.getAuthor() %></td>
    <td><%=c.getPrice() %></td>
    <td><a href="removeBook?bid=<%=c.getBid() %>&&uid=<%=c.getUserId() %>"><button type="submit">Remove</button></a></td>
  </tr>
	  <%
  }
  
  %>
  <tr>
    <td style="font-weight:500;">Total</td>
    <td></td>
    <td><%=total %></td>
    <td></td>
  </tr>
  
 
</table>
        </div>
        <form action="" class="fill">
            <h2>Your Details for Order</h2>
            <div class="inputsec">
                <input type="text" placeholder="Name">
                <input type="email" placeholder="Email">
            </div>
            <div class="inputsec">
                <input type="number" placeholder="Phone Number">
                <input type="text" placeholder="Address">
            </div>
            <div class="inputsec">
                <input type="text" placeholder="Landmark">
                <input type="text" placeholder="City">
            </div>
            <div class="inputsec">
                <select name="option" id="">
                    <option value="null">Select</option>
                    <option value="null">COD</option>
                    <option value="null">Online</option>
                </select>
            </div>
            <div class="btn">
                <button class="order">Order Now</button>
                <button class="continue">Continue Shopping</button>
            </div>
        </form>
    </div>
    <%@include file="all_components/footer.jsp"%>
</body>
</html>