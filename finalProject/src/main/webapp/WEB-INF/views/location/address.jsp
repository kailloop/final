<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
	section{
		height:3200px;
	}
	#map{
		top:150px;
		width:50%;
		height:350px;
	}
	#title-line{
		margin:0;
		margin-left:auto;
		margin-right:auto;
		width:3px;
		height:1800px;
		background-color:gray;
		border-radius:20px;
	}
	#seoul{
		position:relative;
		width:0px;
		height:3px;
		background-color:gray;
		top:200px;
		left:0px;
		transition:1s;
	}
	#kyungki{
		position:relative;
		width:0px;
		height:3px;
		background-color:gray;
		top:0px;
		left:0px;
		transition:1s;
	}
	#incheon{
		position:relative;
		width:0px;
		height:3px;
		background-color:gray;
		transition:1s;
		top:0px;
		left:0px;
	}
	#kangwon{
		position:relative;
		width:0px;
		height:3px;
		background-color:gray;
		transition:1s;
		top:-350px;
		left:0px;
	}
	#seoul-img{
		position:relative;
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
	    z-index:-1;
		width:0px;
		height:400px;
		transition:1s;
		left:-400px;
		border-radius:50px;
		box-shadow:3px 5px 5px gray;
		cursor:pointer;
	}
	#kyungki-img{
		position:relative;
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
	    z-index:-1;
		width:0px;
		height:400px;
		transition:1s;
		left:240px;
		top:-195px;
		border-radius:50px;
		box-shadow:3px 5px 5px gray;
		cursor:pointer;
	}
	#incheon-img{
		position:relative;
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
	    z-index:-1;
		width:0px;
		height:400px;
		transition:1s;
		left:-200px;
		top:-195px;
		border-radius:50px;
		box-shadow:3px 5px 5px gray;
		cursor:pointer;
	}
	#kangwon-img{
		position:relative;
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
	    z-index:-1;
		width:0px;
		height:300px;
		transition:1s;
		left:330px;
		top:-520px;
		border-radius:50px;
		box-shadow:3px 5px 5px gray;
		cursor:pointer;
	}
	.seoul-eng{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:120px;
		color:white;
		font-weight:bolder;
		top:-120px;
		left:-480px;
		cursor:pointer;
		text-align:center;
	}
	.kyungki-eng{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:120px;
		color:white;
		font-weight:bolder;
		top:-120px;
		left:250px;
		cursor:pointer;
		text-align:center;
	}
	.incheon-eng{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:120px;
		color:white;
		font-weight:bolder;
		top:-100px;
		left:-560px;
		cursor:pointer;
		text-align:center;
	}
	.kangwon-eng{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:80px;
		color:white;
		font-weight:bolder;
		top:-100px;
		left:400px;
		cursor:pointer;
		text-align:center;
	}
	#seoul-label{
		transition:0.5s;
	}
	#seoul-label-han{
		font-size:80px;
		transition:0.5s;
		color:white;
		position:relative;
		top:-255px;
		width:500px;
		left:-100px;
		opacity:0;
	}
	#kyungki-label{
		transition:0.5s;
	}
	#kyungki-label-han{
		font-size:120px;
		transition:0.5s;
		color:white;
		position:relative;
		top:-235px;
		width:500px;
		left:0px;
		opacity:0;
	}
	#incheon-label{
		transition:1s;
	}
	#kangwon-label{
		transition:1s;
	}
</style>
	<br/><br/>
	<div id="title-line">
		<div id="seoul">
			<div class="seoul-eng seoul">
				<label id="seoul-label" style="cursor:pointer;user-select: none;">Seoul</label>
				<label id="seoul-label-han" style="cursor:pointer;user-select:none;">서울특별시</label>
			</div>
		</div>
		<img id="seoul-img" class="seoul" src="${path }/resources/images/seoul.jpg" alt="서울">
		<div id="kyungki">
			<div class="kyungki-eng kyungki">
				<label id="kyungki-label" style="cursor:pointer;user-select:none;">Kyungki</label>
				<label id="kyungki-label-han" style="cursor:pointer;user-select:none;">경기도</label>
			</div>
		</div>
		<img id="kyungki-img" class="kyungki" src="${path }/resources/images/Kyungki.jpg" alt="경기도">
		<div id="incheon">
			<div class="incheon-eng incheon">
				<label id="incheon-label" style="cursor:pointer;user-select:none;">InCheon</label>
			</div>
		</div>
		<img id="incheon-img" class="incheon" src="${path }/resources/images/incheon.png" alt="인천">
		<div id="kangwon">
			<div class="kangwon-eng kangwon">
				<label id="kangwon-label" style="cursor:pointer;user-select:none;">KangWon</label>
			</div>
		</div>
		<img id="kangwon-img" class="kangwon" src="${path }/resources/images/kangwon.jpg" alt="강원도">
	</div>
<script>
	$(window).scroll(function (){
		var height=$(document).scrollTop();
		console.log(height);
		if(height>=300){//가지
			$("#seoul").css("width","100px");
			$("#seoul").css("left","-100px");
			setInterval(function(){//이미지
				$("#seoul-img").css("width","600px");
				$("#seoul-img").css("left","-730px");
				$("#seoul").css("color","#F6F6F6");
				$("#seoul").css("opacity","1");
				$("#seoul-label").css("text-shadow","1px 3px 3px lightgray");
			},1200)
		}
		if(height>=508){//가지
			$("#kyungki").css("width","200px");
			setInterval(function(){//이미지
				$("#kyungki-img").css("width","500px");
				setInterval(function(){//글자
					$("#kyungki").css("color","#F6F6F6");
					$("#kyungki").css("opacity","1");
					$("#kyungki-label").css("text-shadow","1px 3px 3px lightgray");	
				},1000);
			},1200)
		}
		if(height>=830){//인천가지
			$("#incheon").css("width","200px");
			$("#incheon").css("left","-200px");
			setInterval(function(){//이미지
				$("#incheon-img").css("width","600px");
				$("#incheon-img").css("left","-820px");
				setInterval(function(){//글자
					$("#incheon").css("color","#F6F6F6");
					$("#incheon").css("opacity","1");
					$("#incheon-label").css("text-shadow","1px 3px 3px lightgray");	
				},1000);
			},1200)
		}
		if(height>=830){//인천가지
			$("#kangwon").css("width","300px");
			setInterval(function(){//이미지
				$("#kangwon-img").css("width","500px");
				setInterval(function(){//글자
					$("#kangwon").css("color","#F6F6F6");
					$("#kangwon").css("opacity","1");
					$("#kangwon-label").css("text-shadow","1px 3px 3px lightgray");	
				},1000);
			},1200)
		}
	});
	$(function(){
		$(".seoul").click(function(){
			console.log("확인");
		});
		$(".kyungki").click(function(){
			console.log("경기도");
		});
		$(".seoul").hover(function(){
			$("#seoul-img").css("box-shadow","5px 10px 10px gray");
			$("#seoul-img").css("transform","scale(1.05)");
			$("#seoul-label").css("opacity","0");
			$("#seoul-label-han").css("opacity","1");
		},function(){
			$("#seoul-img").css("box-shadow","3px 5px 5px gray");
			$("#seoul-img").css("transform","scale(1.0)");
			$("#seoul-label").css("opacity","1");
			$("#seoul-label-han").css("opacity","0");
		});
		$(".kyungki").hover(function(){
			$("#kyungki-img").css("box-shadow","5px 10px 10px gray");
			$("#kyungki-img").css("transform","scale(1.05)");
			$("#kyungki-label").css("opacity","0");
			$("#kyungki-label-han").css("opacity","1");
		},function(){
			$("#kyungki-img").css("box-shadow","3px 5px 5px gray");
			$("#kyungki-img").css("transform","scale(1.0)");
			$("#kyungki-label").css("opacity","1");
			$("#kyungki-label-han").css("opacity","0");
		});
		$(".incheon").hover(function(){
			$("#incheon-img").css("box-shadow","5px 10px 10px gray");
			$("#incheon-img").css("transform","scale(1.05)");
		},function(){
			$("#incheon-img").css("box-shadow","3px 5px 5px gray");
			$("#incheon-img").css("transform","scale(1.0)");
		});
		$(".kangwon").hover(function(){
			$("#kangwon-img").css("box-shadow","5px 10px 10px gray");
			$("#kangwon-img").css("transform","scale(1.05)");
		},function(){
			$("#kangwon-img").css("box-shadow","3px 5px 5px gray");
			$("#kangwon-img").css("transform","scale(1.0)");
		});
		
	});
</script>
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>
