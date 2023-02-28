<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book:login</title>
<%@include file="all_components/navbar.jsp" %>
<%@include file="all_components/allCss.jsp" %>
</head>
<body>
<div class="maincontainer2">
      <div class="wrapper">
        <form action="login" method="post" class="contain">
          <h2>Log-In</h2>
          <c:if test="${not empty sucMsg }">
					<p style="color:green;">${sucMsg }</p>
					<c:remove var="sucMsg" scope="session"/>
				</c:if>
          <c:if test="${not empty faildMsg }">
					<p style="color:red;">${faildMsg }</p>
					<c:remove var="faildMsg" scope="session"/>
				</c:if>
				
          <div class="inputbox">
            <input type="email" name="email" required="required" />
            <span>Email</span>
          </div>
          
          <div class="inputbox">
            <input type="password" name="password" required="required" />
            <span>Password</span>
          </div>
          <p><a href="register.jsp">New User/Register</a></p>
          <div class="btn">
            <button><span>login</span></button>
          </div>
        </form>
      </div>
      <%@include file="./all_components/footer.jsp" %>
    </div>
    
</body>
</html>