<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book:login</title>
<%@include file="all_components/navbar.jsp"%>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
	<div class="maincontainer2">
		<div class="wrapper">
			<form action="register" method="post" class="contain">
				<h2>Registration Form</h2>
				<c:if test="${not empty sucMsg }">
					<p style="color:red;">${sucMsg }</p>
					<c:remove var="sucMsg" scope="session"/>
				</c:if>
				<c:if test="${not empty faildMsg }">
					<p style="color:red;">${faildMsg }</p>
					<c:remove var="faildMsg" scope="session"/>
				</c:if>

				<div class="inputbox">
					<input type="text" name="name" required="required" /> <span>First
						Name</span>
				</div>
				<div class="inputbox">
					<input type="email" name="email" required="required" /> <span>Email</span>
				</div>
				<div class="inputbox">
					<input type="number" name="phoneno" required="required" /> <span>Phone
						Number</span>
				</div>
				<div class="inputbox">
					<input type="password" name="password" required="required" /> <span>Password</span>
				</div>
				<div class="inputbox">
					<input type="checkbox" name="check" /> <span>Agree term &
						condition</span>
				</div>
				<p>
					<a href="login.jsp">Already a User</a>
				</p>
				<div class="btn">
					<button type="submit">
						<span>Register</span>
					</button>
				</div>
			</form>
		</div>
		<%@include file="./all_components/footer.jsp"%>
	</div>

</body>
</html>