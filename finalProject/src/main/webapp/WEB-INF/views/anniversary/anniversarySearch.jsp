<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="기념일" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<style>
	#search{
		margin-left: auto; 
		margin-right: auto;
		text-align: center;
		margin-top: 150px;
		border-radius: 10px;
	}
	#search_input{
		border: red 2px solid;   
		width:450px;
        height: 37px;
        font-size: 15px;
		outline-style: none;
		margin-right: 10px;
	}
	.inventory{
		width:350px;
		height:250px;
		position:relative;
		box-shadow:3px 3px 3px #A6A6A6;
		border-radius:10px;
		overflow:hidden;
		display:inline-block;
		margin:20px auto;
		margin-left:50px;
		cursor:pointer;
	}
	.img{
		width: 100%;
		height: 100%;
	}
	.text{
		position:absolute;
		color:yellow;
		width: 100%;
		height: 100%;
		margin-top: 30px;
	}
	
	.allow{
		width:50px;
		height:250px;
		position:relative;
		overflow:hidden;
		display:inline-block;
		margin:20px auto;
		margin-left:50px;
		cursor:pointer;
		
	}
	

</style>

<div id="search">
	<!--검색  -->
	<div class="search_view">
		<input type="text" id="search_input">
		<button type="button" id="search_btn" class="btn btn-outline-danger" ><i class="fas fa-search"></i></button>
		
				<!-- 
		<hr style="margin-right: 100px; margin-left:100px; margin-top: 40px;"> -->
	</div>
	
		
		<!-- <div class="list_view"> -->
		

	
	<style>
		/* .slide {
		  position: relative;
		  padding-top: 100px;
		  overflow: hidden;
		  margin-left: auto;
		  margin-right: auto;
		} */
	</style>
	
	
	 	<div class="slideshow-container">
		<p><b style="color:red;"><i class="fas fa-fire-alt"></i>HOT</b> 키워드</p>	

        <div class="mySlides fade">
          <div class="numbertext">1 / 3</div>
          <img src="http://placehold.it/300x100" style="width:100%">
          <div class="text">Caption One</div>
        </div>
        
        <div class="mySlides fade">
          <div class="numbertext">2 / 3</div>
          <img src="http://placehold.it/300x100" style="width:100%">
          <div class="text">Caption Two</div>
        </div>
        
        <div class="mySlides fade">
          <div class="numbertext">3 / 3</div>
          <img src="http://placehold.it/300x100" style="width:100%">
          <div class="text">Caption Three</div>
        </div>
        
    </div>
    
    <br>
        
        <div style="text-align:center">
          <span class="dot"></span> 
          <span class="dot"></span> 
          <span class="dot"></span> 
        </div>
	</div>
	
	
	
		
</div>

		






		
</section>	
	
<!--슬라이더  -->
<script>
	var slideIndex = 0;
	showSlides();
	
	function showSlides() {
	var i;
	var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("dot");
	for (i = 0; i < slides.length; i++) {
	slides[i].style.display = "none";  
	}
	slideIndex++;
	if (slideIndex > slides.length) {slideIndex = 1}    
	for (i = 0; i < dots.length; i++) {
	dots[i].className = dots[i].className.replace(" active", "");
	}
	slides[slideIndex-1].style.display = "block";  
	dots[slideIndex-1].className += " active";
	setTimeout(showSlides, 2000); // Change image every 2 seconds
	}
</script>	
	
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>

