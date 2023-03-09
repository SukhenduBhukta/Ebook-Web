<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>

<%@include file="all_components/navbar.jsp"%>
<div class="maincontainer2">
		<div class="wrapper">
			<form action="" method="post" class="contain" enctype="multipart/form-data">
				<h2>Edit Profile</h2>
				 <c:if test="${not empty sucMsg }">
					<p style="color:green;">${sucMsg }</p>
					<c:remove var="sucMsg" scope="session"/>
				</c:if>
				 <c:if test="${not empty faileMsg }">
					<p style="color:red;">${faileMsg }</p>
					<c:remove var="faileMsg" scope="session"/>
				</c:if>
				<div class="inputbox">
					<input type="file" name="pimg" required="required" /> <span>Upload Photo
						</span>
				</div>
				<div class="inputbox">
					<input type="text" name="name" required="required" /> <span>Name</span>
				</div>
				<div class="inputbox">
					<input type="email" name="email" required="required" /> <span>Email</span>
				</div>
				<div class="inputbox">
					<input type="number" name="phone" required="required" /> <span>Phone
						</span>
				</div>
				
				<div class="inputbox">
					<input type="password" name="password" required="required" /> <span>Password
						</span>
				</div>
					<div class="btn">
					<button type="submit">
						<span>Update</span>
					</button>
				</div>
			</form>
		</div>
		<%@include file="all_components/footer.jsp"%>
</body>
</html>