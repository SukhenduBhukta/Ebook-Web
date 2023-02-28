<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<div class="maincontainer">
	<div class="head">
		<div class="navbar">
			<ol class="first">
				<li>
					<div class="logo">
						<img src="logo.jpg" alt="">
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
				<li class="nav active"><a href="home.jsp" class="nav-link"><i
						class="fa-solid fa-house"></i> Home</a></li>
				
			<ol class="third">


				<c:if test="${not empty userobj }">
				<li><a href="login.jsp">${userobj.name }</a></li>
				<li><button type="submit"  onclick="openPopup()">Logout</button></li>
				
				</c:if>
				<c:if test="${empty userobj }">
				<li><a href="../login.jsp"><button type="submit">Login</button></a></li>
				</c:if>
				
			</ol>
		</div>
	</div>
	<div class="container">
            <div class="popup" id="popup">
                <h2>Confrim Yourself</h2>
                <p>Are you want to Logout?</p>
                <div class="btnc">
                    <a href="../logout"><button class="yes" type="button"  onclick="closePopup()">Yes</button></a>
                <button class="cancel" type="button"  onclick="closePopup()">Cancel</button>
                </div>
            </div>
        </div>
</div>