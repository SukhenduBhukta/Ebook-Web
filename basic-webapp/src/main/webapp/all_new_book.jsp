<%@page import="com.entity.User"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebbok: All New Book</title>
<%@include file="all_components/allCss.jsp"%>
<style type="text/css">
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
<%
User u=(User)session.getAttribute("userobj");
%>
<c:if test="${not empty addCart }">
<div id="toast">${addCart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
<c:remove var="addCart" scope="session"></c:remove>
</c:if>

<%@include file="all_components/navbar.jsp"%>
<div class="maincontainer">

<div class="recent">
            <h2>New Book</h2>
            <div class="container">
            <%
            BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
            List<BookDtls> list=dao.getAllNewBook();
            for(BookDtls b:list){
            	%>
            	<div class="card">
                    <div class="img">
                        <img src="Book/<%=b.getPhotoName() %>" alt="">
                    </div>
                    <p><%=b.getBookname() %></p>
                    <p><%=b.getAuthor() %></p>
                    <p>Catagory: <%=b.getBookCategory() %></p>
                    <%
                    if(b.getBookCategory().equals("Old Book")){
                    	%>
                    	<div class="btn">
                        <button class="buy">View</button>
                        <button class="mrp"><%=b.getPrice() %></button>
                    </div>
                    	<%
                    }else{
                    	%>
                    	<div class="btn">
                        <%
                    if(u==null){
                    	%>
                    	<a href="login.jsp"><button class="addtocart">Cart</button></a>
                    	<%
                    }else{
                    	%>
                    	<a href="cartServlet?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"><button class="addtocart">Cart</button></a>
                    	<%
                    }
                    %>
                        <a href="view_book.jsp?bid=<%=b.getBookId() %>"><button class="buy">View</button></a>
                        <button class="mrp"><%=b.getPrice() %></button>
                    </div>
                    	<%
                    }
                    %>
                
                </div>
            
            	<%
            }
            %>
              </div>  
            
        </div>
        <%@include file="all_components/footer.jsp"%>
</div>
<script>
        let subMenu = document.getElementById("subMenu");

        function toggleMenu(){
            subMenu.classList.toggle("open-menu");
        }
    </script>
</body>
</html>