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
		height:1000px;
		width:100%;
	    position: relative;
	    z-index: 0;
	    overflow: hidden;
	}
	#logo img{
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
		width:100%;
		height:100%;
		z-index:-1;
	}
	.main-label-eng{
		position:relative;
		font-size:75px;
		z-index:0;
		cursor:pointer;
		font-family: 'Montserrat', sans-serif;
		color:#F6F6F6;
		top:-620px;
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
		top:-570px;
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
		top:-670px;
		transition:1s;
		opacity:0;
	}
	
	
</style>
<script>
	$(function(){
		$(".main-label-han").css("top","-600px");
		$(".main-label-han").delay(1000).css("opacity","1");
	});
	setTimeout(function() {
		$(".main-label-eng").css("top","-650px");
		$(".main-label-eng").css("opacity","1");
		$("#border-bottom").css("top","-700px");
		$("#border-bottom").delay(1000).css("opacity","1");// 1초 후 실행
	}, 1000);
</script>
	<div id="logo" style="text-align:center;">
		<img src="${path }/resources/images/home-logo.jpg" alt="로고1">
		<label class="main-label-han">실시간으로 짜는 다양한 데이트</label><br/>
		<label class="main-label-eng">Make your lism</label><br/>
		<label id="border-bottom">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	</div>
	
	
	
</body>
</html>
