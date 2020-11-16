<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="마이페이지" />
</jsp:include>


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

<style>
*, *:before, *:after {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
/* Type */
	em, i {
		font-style: italic;
	}
	p {
		margin: 0 0 2em 0;
		color:#5D5D5D;
	}
	h2, h3{
		font-weight: 300;
		line-height: 1em;
		margin: 0 0 1em 0;
		text-transform: uppercase;
	}
	h2 a, h3 a{
		color: inherit;
		text-decoration: none;
	}

	h2 {
		font-size: 1.6em;
		line-height: 1.5em;
	}

	h3 {
		font-size: 1.2em;
		line-height: 1.5em;
	}

	h2, h3{
		color: #555;
	}


/* Section/Article */

	section.special, article.special, header.special {
		text-align: center;
	}

/* Feature */

	.features {
		display: -moz-flex;
		display: -webkit-flex;
		display: -ms-flex;
		display: flex;
		-moz-flex-wrap: wrap;
		-webkit-flex-wrap: wrap;
		-ms-flex-wrap: wrap;
		flex-wrap: wrap;
		-moz-justify-content: center;
		-webkit-justify-content: center;
		-ms-justify-content: center;
		justify-content: center;
		margin-bottom: 2em;
	}

	.feature {
		padding: 2em 2em 0.1em 2em;
		border-style: solid;
		border-width: 1px;
		margin-left: -1px;
		margin-top: -1px;
		width: 33.33333%;
		cursor:pointer;
	}

		.feature .fa {
			font-size: 2.8em;
			margin-bottom: 0.7em;
			color:#F26A8D;
		}
		.feature .far {
			font-size: 2.8em;
			margin-bottom: 0.7em;
			color:#F26A8D;
		}
		.feature .fas {
			font-size: 2.8em;
			margin-bottom: 0.7em;
			color:#F26A8D;
		}

		@media screen and (max-width: 1280px) {
			.feature {
				padding: 2em 1.5em 0.1em 1.5em;
			}
		}

		@media screen and (max-width: 736px) {
			.feature {
				padding: 2em 1em 0.1em 1em;
				width: 50%;
			}
		}

		@media screen and (max-width: 480px) {
			.feature {
				padding: 2em 0.5em 0.1em 0.5em;
				width: 100%;
			}
		}

	.feature {
		border-color: #e3e3e3;
	}


/* Wrapper */

	.wrapper {
		padding: 6em 0 4em 0;
		position: relative;
	}
		.wrapper > .inner {
			margin: 0 auto;
			width: 65em;
		}
			.wrapper > .inner.narrow {
				width: 35em;
			}

		@media screen and (max-width: 1280px) {
			.wrapper {
				padding: 5em 0 3em 0;
			}
				.wrapper > .inner {
					width: 60em;
				}
		}

		@media screen and (max-width: 980px) {
			.wrapper {
				padding: 4em 2em 2em 2em;
			}
				.wrapper > .inner {
					width: 100%;
				}
		}

		@media screen and (max-width: 736px) {
			.wrapper {
				padding: 3em 1.5em 1em 1.5em;
			}
				.wrapper > .inner.narrow {
					width: 80%;
				}
		}

		@media screen and (max-width: 480px) {
			.wrapper {
				padding: 2em 1em 0.1em 1em;
			}
				.wrapper > .inner.narrow {
					width: 100%;
				}
		}
</style>

<section id="one" class="wrapper special container" style="background: white; margin-top:-90px;">
				<div class="inner">
					<header class="major">
						<h2>MY PAGE</h2>
					</header>
					<br><br><br>
					<div class="features" >
						<div class="feature" style="background: red;">	
							<i class="fas fa-users-cog"></i>
							<h3>회원관리</h3>
							<p>회원들의 정보를 관리할 수 있습니다.</p>
						</div>
						<div class="feature">
							<i class="fas fa-tasks"></i>
							<h3>여행지관리</h3>
							<p>여행지를 관리하실 수 있습니다.</p>
						</div>
						<div class="feature">
							<i class="fas fa-ticket-alt"></i>
							<h3>쿠폰관리</h3>
							<p>쿠폰을 발송하고<br>관리하실 수 있습니다.</p>
						</div>
					</div>
				</div>
</section>


<script src="${path }/resources/js/skel.min.js"></script>
<script src="${path }/resources/js/util.js"></script>
<script src="${path }/resources/js/main.js"></script>


