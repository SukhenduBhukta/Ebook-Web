<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Address</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>

<%@include file="all_components/navbar.jsp"%>
<div class="maincontainer2">
		<div class="wrapper">
			<form action="" method="post" class="contain" enctype="multipart/form-data">
				<h2>Add Address</h2>
				 <c:if test="${not empty sucMsg }">
					<p style="color:green;">${sucMsg }</p>
					<c:remove var="sucMsg" scope="session"/>
				</c:if>
				 <c:if test="${not empty faileMsg }">
					<p style="color:red;">${faileMsg }</p>
					<c:remove var="faileMsg" scope="session"/>
				</c:if>
				
				<div class="inputbox">
					<input type="text" name="address" required="required" /> <span>Address</span>
				</div>
				<div class="inputbox">
					<input type="text" name="landmark" required="required" /> <span>Landmark</span>
				</div>
				<div class="inputbox">
					<input type="text" name="city" required="required" /> <span>City
						</span>
				</div>
				
				<div class="inputbox">
					<input type="text" name="state" required="required" /> <span>State
						</span>
				</div>
				<div class="inputbox">
					<input type="number" name="state" required="required" /> <span>PIN
						</span>
				</div>
					<div class="btn">
					<button type="submit">
						<span>Add Address</span>
					</button>
				</div>
			</form>
		</div>
		<%@include file="all_components/footer.jsp"%>
</body>
</html>