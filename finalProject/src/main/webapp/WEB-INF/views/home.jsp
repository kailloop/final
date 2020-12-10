<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
	#logo{
		height:1100px;
		width:100%;
	    position: relative;
	    z-index: 0;
	    overflow: hidden;
	}
	video{
		position:relative;
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
	    left:-50px;
	    top:-50px;
		width:2010px;
		height:1200px;
		z-index:-1;
	}
	.main-label-eng{
		position:relative;
		font-size:75px;
		z-index:0;
		cursor:pointer;
		font-family: 'Montserrat', sans-serif;
		color:#F6F6F6;
		top:-870px;
		font-weight:lighter;
		transition:1s;
		opacity:0;
	}
	.main-label-han{
		position:relative;
		font-size:26px;
		z-index:0;
		cursor:pointer;
		font-family:Nanum Gothic Coding;
		color:#F6F6F6;
		top:-820px;
		transition:1s;
		opacity:0;
	}
	#border-bottom{
		font-size:20px;
		border-bottom:3px white solid;
		position:relative;
		z-index:0;
		cursor:pointer;
		font-family:Nanum Gothic Coding;
		color:#F6F6F6;
		top:-920px;
		transition:1s;
		opacity:0;
	}
	section{
		width:100%;
		height:1300px;
		background-color:white;
		z-index:0;
		position:relative;
		border:1px purple solid;
	}
	.img{
		position:relative;
		width:600px;
		height:800px;
		transition:1.75s;
	}
	.one{
		left:800px;
		top:200px;
		z-index:1;
	}
	.two{
		left:300px;
		top:950px;
		z-index:2;
	}
	
</style>
<script>
	$(function(){
		$(".main-label-han").css("top","-850px");
		$(".main-label-han").delay(1000).css("opacity","1");
	});
	setTimeout(function() {
		$(".main-label-eng").css("top","-900px");
		$(".main-label-eng").css("opacity","1");
		$("#border-bottom").css("top","-950px");
		$("#border-bottom").delay(1000).css("opacity","1");// 1초 후 실행
	}, 1000);
	$(window).scroll(function (){
		var height=$(document).scrollTop();
		console.log(height);
		if(height<400){
			$(".one").css("top","200px");
			$(".two").css("top","950px");
		}
		if(height>=400){
			$(".one").css("top","80px");
			$(".two").css("top","840px");
		}
		if(height>=900){
			$(".two").css("top","700px");
		}
		if(height>=1365){
			$(".two").css("top","580px");
		}
	});
</script>
	<div id="logo" style="text-align:center;">
		<video src="${path }/resources/videos/home-logo.mp4" loop="loop" autoplay="autoplay" muted="muted"></video>
		<label class="main-label-han">실시간으로 짜는 다양한 데이트</label><br/>
		<label class="main-label-eng">Make your lism</label><br/>
		<label id="border-bottom">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	</div>
	<section>
		<img class="img one" src="${path }/resources/images/mainimg2.jpg" alt="로고2">
		<img class="img two" src="${path }/resources/images/mainimg1.jpg" alt="로고3">
		
		
		
	</section>

	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>
