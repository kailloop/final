<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="갤러리" />
</jsp:include>

<link rel="stylesheet" href="${path }/resources/css/mypage.css" />


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
		/* cursor:pointer; */
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
		/* cursor:pointer; */
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
		
		<label class="main-label-eng">MY PAGE</label><br/>
		<label id="border-bottom">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	</div>
	

<section id="one" class="wrapper special container">
				<div class="inner">
					<header class="major">
						<h2>[MY PAGE]</h2>
					</header>
					<div class="features">
						<div class="feature">
							<i class="fa fa-diamond"></i>
							<h3>회원정보수정</h3>
							<p>고객님의 개인정보를 </p>
						</div>
						<div class="feature">
							<i class="fa fa-copy"></i>
							<h3>연인등록</h3>
							<p>Sed tempus feugiat adipiscing nisl cursus aliquam dolore.</p>
						</div>
						<div class="feature">
							<i class="fa fa-paper-plane-o"></i>
							<h3>쿠폰함</h3>
							<p>Sed tempus feugiat adipiscing nisl cursus aliquam dolore.</p>
						</div>
						<div class="feature">
							<i class="fa fa-save"></i>
							<h3>결제내역</h3>
							<p>Sed tempus feugiat adipiscing nisl cursus aliquam dolore.</p>
						</div>
						<div class="feature">
							<i class="fa fa-envelope-o"></i>
							<h3>예약내역</h3>
							<p>Sed tempus feugiat adipiscing nisl cursus aliquam dolore.</p>
						</div>
					</div>
				</div>
</section>

<script src="${path }/resources/js/jquery.min.js"></script>
<script src="${path }/resources/js/skel.min.js"></script>
<script src="${path }/resources/js/util.js"></script>
<script src="${path }/resources/js/main.js"></script>


