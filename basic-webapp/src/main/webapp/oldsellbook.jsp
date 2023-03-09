<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Books</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>

<%@include file="all_components/navbar.jsp"%>
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<div class="maincontainer2">
		<div class="wrapper">
			<form action="add_old_book" method="post" class="contain" enctype="multipart/form-data">
				<h2>Book Add</h2>
				 <c:if test="${not empty sucMsg }">
					<p style="color:green;">${sucMsg }</p>
					<c:remove var="sucMsg" scope="session"/>
				</c:if>
				 <c:if test="${not empty faileMsg }">
					<p style="color:red;">${faileMsg }</p>
					<c:remove var="faileMsg" scope="session"/>
				</c:if>
				<input type="hidden" name="uemail" value="${userobj.email }">
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
					<input type="file" name="bimg" required="required" /> <span>Upload Photo
						</span>
				</div>
					<div class="btn">
					<button type="submit">
						<span>Sell</span>
					</button>
				</div>
			</form>
		</div>
		<%@include file="all_components/footer.jsp"%>
</body>
</html>