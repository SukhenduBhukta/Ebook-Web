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
			
		
						<c:if test="${not empty userobj }">
						<ol class="third">
						<li><a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i>
						Cart</a></li>
						<li><img src="./all_components/pic/user.png" onclick="toggleMenu()"></li>
						</ol>
						<div class="sub-menu-wrap" id="subMenu">
                <div class="sub-menu">
                    <div class="user-info">
                        <img src="./all_components/pic/user.png" alt="">
                        <h3>${userobj.name }</h3>
                    </div>
                    <hr>
                    <a href="editprofile.jsp" class="sub-menu-link"><i class="fa-solid fa-user"></i><p>Edit Profile</p><span>></span></a>
                    <a href="oldsellbook.jsp" class="sub-menu-link"><i class="fa-solid fa-book"></i><p>Sell Old Book</p><span>></span></a>
                    <a href="order.jsp" class="sub-menu-link"><i class="fa-solid fa-bag-shopping"></i><p>Your Order</p><span>></span></a>
                    <a href="addAddress.jsp" class="sub-menu-link"><i class="fa-solid fa-location-dot"></i><p>Your Address</p><span>></span></a>
                    <a href="helpline.jsp" class="sub-menu-link"><i class="fa-solid fa-circle-info"></i><p>Help & Support</p><span>></span></a>
                    <a href="logout" class="sub-menu-link" onclick="openPopup()"><i class="fa-solid fa-right-from-bracket"></i><p>Logout</p><span>></span></a>
                </div>
            </div>
						</c:if>
						<c:if test="${ empty userobj }">
						<ol class="third">
						<li><a href="login.jsp"><button type="submit">Login</button></a></li>
						</ol>
						</c:if>
				
			
		</div>
	</div>
</div>
<script>
        let subMenu = document.getElementById("subMenu");

        function toggleMenu(){
            subMenu.classList.toggle("open-menu");
        }
    </script>