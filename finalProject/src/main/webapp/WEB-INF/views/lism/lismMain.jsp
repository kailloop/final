<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<style>
	section{
		height:1000px;
		overflow:visible;
	}
	#my-container{
		position:relative;
		margin-left:auto;
		margin-right:auto;
		width:80%;
		height:100px;
		text-align:center;
	}
	#my-container-title{
		font-size:102px;
		color:black;
		font-family: 'Dancing Script', cursive;
		font-weight:lighter;
	}
	#explain-lism-one{
		position:relative;
		width:50%;
		height:400px;
		left:0%;
		top:250px;
		opacity:0;
		transition:1s;
	}
	#explain-lism-one > img{
		width:100%;
		height:100%;
	}
	#picture-one{
		width:100%;
		height:100%;
	}
	.pic-title{
		font-family: 'Dancing Script', cursive;
		font-size:42px;
		font-weight:lighter;
	}
	#pic-first-title{
		position:relative;
		left:-42.5%;
		top:170px;
		color:black;
		font-family: 'Dancing Script', cursive;
		opacity:0;
		transition:1s;
	}
	.pic-content{
		font-family: 'Hi Melody', cursive;
	}
</style>
	<div id="my-container">
		<br/>
		<label id="my-container-title">Couplism</label>
		<div id="explain-lism-one">
			<img id="picture-one" src="${path }/resources/lism/lism-explain-one.jpg">
		</div>
		<label id="pic-first-title" class="pic-title">Restaurent</label><br/>
		<label class="pic-content"></label>
		
	</div>
<script>
	$(window).scroll(function(){
		var height=$(document).scrollTop();
		console.log(height);
		if(height>=771){
			$("#explain-lism-one").css("opacity","1");
			$("#explain-lism-one").css("top","150px");
			$("#explain-lism-one").css("width","45%");
		}
		if(height>=840){
			$("#pic-first-title").css("opacity","1");
			$("#pic-first-title").css("top","140px");
		}
	});
</script>
	
	
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>