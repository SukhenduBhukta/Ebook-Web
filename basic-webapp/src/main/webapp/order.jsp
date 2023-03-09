<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Order</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
<%@include file="all_components/navbar.jsp"%>
<div class="maincontainer5">
				<c:if test="${not empty sucMsg }">
					<h3 style="color:green;">${sucMsg }</h3>
					<c:remove var="sucMsg" scope="session"/>
				</c:if>
				 <c:if test="${not empty faildMsg }">
					<h3 style="color:red;">${faildMsg }</h3>
					<c:remove var="faildMsg" scope="session"/>
				</c:if>
        <table>
            <thead>
            <tr>
            	<th>Order Id</th>
                <th>Name</th>
                <th>Book Name</th>
                <th>Author Name</th>
                <th>Price</th>
                <th>Payment Type</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            	<tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><a href=""><button type="submit" class="edit">Cancel</button></a>
                </td>
            </tr>
            
            
 
            </tbody>
        </table>

    </div>

<%@include file="all_components/footer.jsp"%>
</body>
</html>