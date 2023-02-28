<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<form action="../add_book" method="post" class="contain" enctype="multipart/form-data">
				<h2>Book Add</h2>
				 <c:if test="${not empty sucMsg }">
					<p style="color:green;">${sucMsg }</p>
					<c:remove var="sucMsg" scope="session"/>
				</c:if>
				 <c:if test="${not empty faileMsg }">
					<p style="color:red;">${faileMsg }</p>
					<c:remove var="faileMsg" scope="session"/>
				</c:if>

				<div class="inputbox">
					<input type="text" name="bname" required="required" /> <span>Book
						Name</span>
				</div>
				<div class="inputbox">
					<input type="text" name="auth" required="required" /> <span>Author Name</span>
				</div>
				<div class="inputbox">
					<input type="number" name="price" required="required" /> <span>Price
						</span>
				</div>
				<div class="inputbox">
					<select name="category" required="required">
					<option selected>Select</option>
  <option value="New Book">New Book</option>

					</select> <span>Book Categories</span>
				</div>
				<div class="inputbox">
					<select name="status" required="required">
					<option selected>Select</option>
  <option value="Active">Active</option>
  <option value="Inactive">Inactive</option>

					</select> <span>Book Status</span>
				</div>
				<div class="inputbox">
					<input type="file" name="bimg" required="required" /> <span>Upload Photo
						</span>
				</div>
					<div class="btn">
					<button type="submit">
						<span>Add</span>
					</button>
				</div>
			</form>
		</div>
		<%@include file="footer.jsp"%>
</body>
</html>