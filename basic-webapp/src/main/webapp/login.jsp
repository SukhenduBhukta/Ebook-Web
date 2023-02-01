<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <form action="" class="contain">
          <h2>Log-In</h2>
          <div class="inputbox">
            <input type="email" required="required" />
            <span>Email</span>
          </div>
          
          <div class="inputbox">
            <input type="number" required="required" />
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