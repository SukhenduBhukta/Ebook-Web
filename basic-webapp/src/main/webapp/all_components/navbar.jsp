<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<div class="maincontainer">
	<div class="head">
		<div class="navbar">
			<ol class="first">
				<li>
					<div class="logo">
						<img src="./all_components/pic/logo.jpg" alt="">
					</div>

				</li>
				<li>
					<div class="search">

						<input type="text" placeholder="Search Account">
						<div class="mag">
							<i class="fa-solid fa-magnifying-glass"></i>
						</div>
					</div>
				</li>
			</ol>
			<ol class="second">
				<li class="nav active"><a href="index.jsp" class="nav-link"><i
						class="fa-solid fa-house"></i> Home</a></li>
				<li class="nav active"><a href="all_resent_book.jsp" class="nav-link"><i
						class="fa-solid fa-book"></i>Recent Book</a></li>
				<li class="nav active"><a href="all_new_book.jsp" class="nav-link"><i
						class="fa-solid fa-book-open-reader"></i> New Book</a></li>
				<li class="nav active"><a href="all_old_book.jsp" class="nav-link"><i
						class="fa-solid fa-clipboard"></i> Old Book</a></li>
			</ol>
			<ol class="third">
		
						<c:if test="${not empty userobj }">
						<li><a href="#setting"><i class="fa-solid fa-gears"></i>
						Setting</a></li>
				<li><a href="#massage"><i class="fa-solid fa-address-book"></i>
						Contact Us</a></li>
						<li><a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i>
						Cart</a></li>
						<li><a href="#">${userobj.name }</a></li>
						</c:if>
						<c:if test="${ empty userobj }">
						<li><a href="login.jsp"><button type="submit">Login</button></a></li>
						</c:if>
				
			</ol>
		</div>
	</div>
</div>