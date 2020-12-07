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
		height:3400px;
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
		height:2800px;
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
	#jeju{
		position:relative;
		width:0px;
		height:3px;
		background-color:gray;
		transition:1s;
		top:-175px;
		left:0px;
	}
	#daejeon{
		position:relative;
		width:0px;
		height:3px;
		background-color:gray;
		transition:1s;
		top:-640px;
		left:0px;
	}
	#busan{
		position:relative;
		width:0px;
		height:3px;
		background-color:gray;
		transition:1s;
		top:-500px;
		left:0px;
	}
	#daegu{
		position:relative;
		width:0px;
		height:3px;
		background-color:gray;
		transition:1s;
		top:-1100px;
		left:0px;
	}
	#jeolla{
		position:relative;
		width:0px;
		height:3px;
		background-color:gray;
		transition:1s;
		top:-1025px;
		left:0px;
	}
	#gyeongsang{
		position:relative;
		width:0px;
		height:3px;
		background-color:gray;
		transition:1s;
		top:-1330px;
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
		-webkit-filter: grayscale(100%);
		filter: gray;
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
		-webkit-filter: grayscale(100%);
		filter: gray;
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
		-webkit-filter: grayscale(100%);
		filter: gray;
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
		-webkit-filter: grayscale(100%);
		filter: gray;
	}
	#jeju-img{
		position:relative;
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
	    z-index:-1;
		width:0px;
		height:400px;
		transition:1s;
		left:-170px;
		top:-375px;
		border-radius:50px;
		box-shadow:3px 5px 5px gray;
		cursor:pointer;
		-webkit-filter: grayscale(100%);
		filter: gray;
	}
	#daejeon-img{
		position:relative;
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
	    z-index:-1;
		width:0px;
		height:500px;
		transition:1s;
		left:120px;
		top:-820px;
		border-radius:50px;
		box-shadow:3px 5px 5px gray;
		cursor:pointer;
		-webkit-filter: grayscale(100%);
		filter: gray;
	}
	#busan-img{
		position:relative;
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
	    z-index:-1;
		width:0px;
		height:500px;
		transition:1s;
		left:-70px;
		top:-750px;
		border-radius:50px;
		box-shadow:3px 5px 5px gray;
		cursor:pointer;
		-webkit-filter: grayscale(100%);
		filter: gray;
	}
	#daegu-img{
		position:relative;
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
	    z-index:-1;
		width:0px;
		height:700px;
		transition:1s;
		left:200px;
		top:-1200px;
		border-radius:50px;
		box-shadow:3px 5px 5px gray;
		cursor:pointer;
		-webkit-filter: grayscale(100%);
		filter: gray;
	}
	#jeolla-img{
		position:relative;
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
	    z-index:-1;
		width:0px;
		height:500px;
		transition:1s;
		left:-150px;
		top:-1280px;
		border-radius:50px;
		box-shadow:3px 5px 5px gray;
		cursor:pointer;
		-webkit-filter: grayscale(100%);
		filter: gray;
	}
	#gyeongsang-img{
		position:relative;
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
	    z-index:-1;
		width:0px;
		height:500px;
		transition:1s;
		left:220px;
		top:-1500px;
		border-radius:50px;
		box-shadow:3px 5px 5px gray;
		cursor:pointer;
		-webkit-filter: grayscale(100%);
		filter: gray;
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
	.jeju-eng{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:120px;
		color:white;
		font-weight:bolder;
		top:-120px;
		left:-510px;
		cursor:pointer;
		text-align:center;
	}
	.daejeon-eng{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:120px;
		color:white;
		font-weight:bolder;
		top:-50px;
		left:235px;
		cursor:pointer;
		text-align:center;
	}
	.busan-eng{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:120px;
		color:white;
		font-weight:bolder;
		top:-120px;
		left:-540px;
		cursor:pointer;
		text-align:center;
	}
	.daegu-eng{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:120px;
		color:white;
		font-weight:bolder;
		top:140px;
		left:310px;
		cursor:pointer;
		text-align:center;
	}
	.jeolla-eng{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:120px;
		color:white;
		font-weight:bolder;
		top:-120px;
		left:-500px;
		cursor:pointer;
		text-align:center;
	}
	.gyeongsang-eng{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:120px;
		color:white;
		font-weight:bolder;
		top:-100px;
		left:310px;
		height:0px;
		cursor:pointer;
		text-align:center;
	}
	#gyeongsang-label-two{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:120px;
		color:white;
		font-weight:bolder;
		top:-120px;
		left:80px;
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
		font-family:Nanum Gothic Coding;
	}
	#kyungki-label{
		transition:0.5s;
	}
	#kyungki-label-han{
		font-size:80px;
		transition:0.5s;
		color:white;
		position:relative;
		top:-255px;
		width:500px;
		left:0px;
		opacity:0;
		text-shadow:1px 3px 3px lightgray;
		font-family:Nanum Gothic Coding;
	}
	#incheon-label{
		transition:0.5s;
	}
	#incheon-label-han{
		font-size:80px;
		transition:0.5s;
		color:white;
		position:relative;
		top:-255px;
		width:500px;
		left:0px;
		opacity:0;
		text-shadow:1px 3px 3px lightgray;
		font-family:Nanum Gothic Coding;
	}
	#kangwon-label{
		transition:1s;
	}
	#kangwon-label-han{
		font-size:80px;
		transition:0.5s;
		color:white;
		position:relative;
		top:-155px;
		width:500px;
		left:-70px;
		opacity:0;
		text-shadow:1px 3px 3px lightgray;
		font-family:Nanum Gothic Coding;
	}
	#jeju-label{
		transition:1s;
	}
	#jeju-label-han{
		font-size:80px;
		transition:0.5s;
		color:white;
		position:relative;
		top:-255px;
		width:500px;
		left:-50px;
		opacity:0;
		text-shadow:1px 3px 3px lightgray;
		font-family:Nanum Gothic Coding;
	}
	#daejeon-label{
		transition:0.5s;
	}
	#daejeon-label-han{
		font-size:80px;
		transition:0.5s;
		color:white;
		position:relative;
		top:-255px;
		width:500px;
		left:0px;
		opacity:0;
		text-shadow:1px 3px 3px lightgray;
		font-family:Nanum Gothic Coding;
	}
	#busan-label{
		transition:0.5s;
	}
	#busan-label-han{
		font-size:80px;
		transition:0.5s;
		color:white;
		position:relative;
		top:-255px;
		width:500px;
		left:-75px;
		opacity:0;
		text-shadow:1px 3px 3px lightgray;
		font-family:Nanum Gothic Coding;
	}
	#daegu-label{
		transition:0.5s;
	}
	#daegu-label-han{
		font-size:80px;
		transition:0.5s;
		color:white;
		position:relative;
		top:-250px;
		width:500px;
		left:-60px;
		opacity:0;
		text-shadow:1px 3px 3px lightgray;
		font-family:Nanum Gothic Coding;
	}
	#jeolla-label{
		transition:0.5s;
	}
	#jeolla-label-han{
		font-size:80px;
		transition:0.5s;
		color:white;
		position:relative;
		top:-275px;
		width:500px;
		left:-75px;
		opacity:0;
		text-shadow:1px 3px 3px lightgray;
		font-family:Nanum Gothic Coding;
	}
	#gyeongsang-label{
		transition:0.5s;
	}
	#gyeongsang-label-two{
		transition:0.5s;
	}
	#gyeongsang-label-han{
		font-size:80px;
		transition:0.5s;
		color:white;
		position:relative;
		top:-450px;
		width:500px;
		left:-30px;
		opacity:0;
		text-shadow:1px 3px 3px lightgray;
		font-family:Nanum Gothic Coding;
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
				<label id="incheon-label-han" style="cursor:pointer;user-select:none;">인천광역시</label>
			</div>
		</div>
		<img id="incheon-img" class="incheon" src="${path }/resources/images/incheon.png" alt="인천">
		<div id="kangwon">
			<div class="kangwon-eng kangwon">
				<label id="kangwon-label" style="cursor:pointer;user-select:none;">KangWon</label>
				<label id="kangwon-label-han" style="cursor:pointer;user-select:none;">강원도</label>
			</div>
		</div>
		<img id="kangwon-img" class="jeju" src="${path }/resources/images/kangwon.jpg" alt="강원도">
		<div id="jeju">
			<div class="jeju-eng jeju">
				<label id="jeju-label" style="cursor:pointer;user-select:none;">JejuDo</label>
				<label id="jeju-label-han" style="cursor:pointer;user-select:none;">제주도</label>
			</div>
		</div>
		<img id="jeju-img" class="jeju" src="${path }/resources/images/jeju.jpg" alt="제주도">
		<div id="daejeon">
			<div class="daejeon-eng daejeon">
				<label id="daejeon-label" style="cursor:pointer;user-select:none;">DaeJeon</label>
				<label id="daejeon-label-han" style="cursor:pointer;user-select:none;">대전광역시</label>
			</div>
		</div>
		<img id="daejeon-img" class="daejeon" src="${path }/resources/images/daejeon.jpg" alt="대전광역시">
		<div id="busan">
			<div class="busan-eng busan">
				<label id="busan-label" style="cursor:pointer;user-select:none;">Busan</label>
				<label id="busan-label-han" style="cursor:pointer;user-select:none;">부산광역시</label>
			</div>
		</div>
		<img id="busan-img" class="busan" src="${path }/resources/images/busan.jpg" alt="부산광역시">
		<div id="daegu">
			<div class="daegu-eng daegu">
				<label id="daegu-label" style="cursor:pointer;user-select:none;">DaeGu</label>
				<label id="daegu-label-han" style="cursor:pointer;user-select:none;">대구광역시</label>
			</div>
		</div>
		<img id="daegu-img" class="daegu" src="${path }/resources/images/daegu.jpg" alt="대구광역시">
		<div id="jeolla">
			<div class="jeolla-eng jeolla">
				<label id="jeolla-label" style="cursor:pointer;user-select:none;">JeolLa</label>
				<label id="jeolla-label-han" style="cursor:pointer;user-select:none;">전라북/남도</label>
			</div>
		</div>
		<img id="jeolla-img" class="jeolla" src="${path }/resources/images/jeolla.jpg" alt="전라도">
		<div id="gyeongsang">
			<div class="gyeongsang-eng gyeongsang">
				<label id="gyeongsang-label" style="cursor:pointer;user-select:none;">Gyeong</label>
				<label id="gyeongsang-label-two" style="cursor:pointer;user-select:none;">Sang</label>
				
				<label id="gyeongsang-label-han" style="cursor:pointer;user-select:none;">경상북/남도</label>
			</div>
		</div>
		<img id="gyeongsang-img" class="gyeongsang" src="${path }/resources/images/gyeongsang.jpg" alt="경상도">
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
		if(height>=830){//강원도가지
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
		if(height>=1450){//대전가지
			$("#daejeon").css("width","100px");
			setInterval(function(){//이미지
				$("#daejeon-img").css("width","700px");
				setInterval(function(){//글자
					$("#daejeon").css("color","#F6F6F6");
					$("#daejeon").css("opacity","1");
					$("#daejeon-label").css("text-shadow","1px 3px 3px lightgray");	
				},1000);
			},1200)
		}
		if(height>=1460){//제주도가지
			$("#jeju").css("width","100px");
			$("#jeju").css("left","-100px");
			setInterval(function(){//이미지
				$("#jeju-img").css("width","600px");
				$("#jeju-img").css("left","-720px");
				setInterval(function(){//글자
					$("#jeju").css("color","#F6F6F6");
					$("#jeju").css("opacity","1");
					$("#jeju-label").css("text-shadow","1px 3px 3px lightgray");	
				},1000);
			},1200)
		}
		if(height>=1950){//대구가지
			$("#daegu").css("width","150px");
			setInterval(function(){//이미지
				$("#daegu-img").css("width","600px");
				setInterval(function(){//글자
					$("#daegu").css("color","#F6F6F6");
					$("#daegu").css("opacity","1");
					$("#daegu-label").css("text-shadow","1px 3px 3px lightgray");	
				},1000);
			},1200)
		}
		if(height>=2050){//부산가지
			$("#busan").css("width","50px");
			$("#busan").css("left","-50px");
			setInterval(function(){//이미지
				$("#busan-img").css("width","700px");
				$("#busan-img").css("left","-780px");
				setInterval(function(){//글자
					$("#busan").css("color","#F6F6F6");
					$("#busan").css("opacity","1");
					$("#busan-label").css("text-shadow","1px 3px 3px lightgray");	
				},1000);
			},1200)
		}
		if(height>=2650){//전라도가지
			$("#jeolla").css("width","100px");
			$("#jeolla").css("left","-100px");
			setInterval(function(){//이미지
				$("#jeolla-img").css("width","600px");
				$("#jeolla-img").css("left","-730px");
				setInterval(function(){//글자
					$("#jeolla").css("color","#F6F6F6");
					$("#jeolla").css("opacity","1");
					$("#jeolla-label").css("text-shadow","1px 3px 3px lightgray");	
				},1000);
			},1200)
		}
		if(height>=2850){//대구가지
			$("#gyeongsang").css("width","200px");
			setInterval(function(){//이미지
				$("#gyeongsang-img").css("width","600px");
				setInterval(function(){//글자
					$("#gyeongsang").css("color","#F6F6F6");
					$("#gyeongsang").css("opacity","1");
					$("#gyeongsang-label").css("text-shadow","1px 3px 3px lightgray");	
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
			$("#seoul-img").css("-webkit-filter","grayscale(0%)");
			$("#seoul-img").css("filter","none");
			$("#seoul-label").css("opacity","0");
			$("#seoul-label-han").css("opacity","1");
		},function(){
			$("#seoul-img").css("box-shadow","3px 5px 5px gray");
			$("#seoul-img").css("transform","scale(1.0)");
			$("#seoul-img").css("-webkit-filter","grayscale(100%)");
			$("#seoul-img").css("filter","gray");
			$("#seoul-label").css("opacity","1");
			$("#seoul-label-han").css("opacity","0");
		});
		$(".kyungki").hover(function(){
			$("#kyungki-img").css("box-shadow","5px 10px 10px gray");
			$("#kyungki-img").css("transform","scale(1.05)");
			$("#kyungki-img").css("-webkit-filter","grayscale(0%)");
			$("#kyungki-img").css("filter","none");
			$("#kyungki-label").css("opacity","0");
			$("#kyungki-label-han").css("opacity","1");
		},function(){
			$("#kyungki-img").css("box-shadow","3px 5px 5px gray");
			$("#kyungki-img").css("transform","scale(1.0)");
			$("#kyungki-img").css("-webkit-filter","grayscale(100%)");
			$("#kyungki-img").css("filter","gray");
			$("#kyungki-label").css("opacity","1");
			$("#kyungki-label-han").css("opacity","0");
		});
		$(".incheon").hover(function(){
			$("#incheon-img").css("box-shadow","5px 10px 10px gray");
			$("#incheon-img").css("transform","scale(1.05)");
			$("#incheon-img").css("-webkit-filter","grayscale(0%)");
			$("#incheon-img").css("filter","none");
			$("#incheon-label").css("opacity","0");
			$("#incheon-label-han").css("opacity","1");
		},function(){
			$("#incheon-img").css("box-shadow","3px 5px 5px gray");
			$("#incheon-img").css("transform","scale(1.0)");
			$("#incheon-img").css("-webkit-filter","grayscale(100%)");
			$("#incheon-img").css("filter","gray");
			$("#incheon-label").css("opacity","1");
			$("#incheon-label-han").css("opacity","0");
		});
		$(".kangwon").hover(function(){
			$("#kangwon-img").css("box-shadow","5px 10px 10px gray");
			$("#kangwon-img").css("transform","scale(1.05)");
			$("#kangwon-img").css("-webkit-filter","grayscale(0%)");
			$("#kangwon-img").css("filter","none");
			$("#kangwon-label").css("opacity","0");
			$("#kangwon-label-han").css("opacity","1");
		},function(){
			$("#kangwon-img").css("box-shadow","3px 5px 5px gray");
			$("#kangwon-img").css("transform","scale(1.0)");
			$("#kangwon-img").css("-webkit-filter","grayscale(100%)");
			$("#kangwon-img").css("filter","gray");
			$("#kangwon-label").css("opacity","1");
			$("#kangwon-label-han").css("opacity","0");
		});
		$(".jeju").hover(function(){
			$("#jeju-img").css("box-shadow","5px 10px 10px gray");
			$("#jeju-img").css("transform","scale(1.05)");
			$("#jeju-img").css("-webkit-filter","grayscale(0%)");
			$("#jeju-img").css("filter","none");
			$("#jeju-label").css("opacity","0");
			$("#jeju-label-han").css("opacity","1");
		},function(){
			$("#jeju-img").css("box-shadow","3px 5px 5px gray");
			$("#jeju-img").css("transform","scale(1.0)");
			$("#jeju-img").css("-webkit-filter","grayscale(100%)");
			$("#jeju-img").css("filter","gray");
			$("#jeju-label").css("opacity","1");
			$("#jeju-label-han").css("opacity","0");
		});
		$(".daejeon").hover(function(){
			$("#daejeon-img").css("box-shadow","5px 10px 10px gray");
			$("#daejeon-img").css("transform","scale(1.05)");
			$("#daejeon-img").css("-webkit-filter","grayscale(0%)");
			$("#daejeon-img").css("filter","none");
			$("#daejeon-label").css("opacity","0");
			$("#daejeon-label-han").css("opacity","1");
		},function(){
			$("#daejeon-img").css("box-shadow","3px 5px 5px gray");
			$("#daejeon-img").css("transform","scale(1.0)");
			$("#daejeon-img").css("-webkit-filter","grayscale(100%)");
			$("#daejeon-img").css("filter","gray");
			$("#daejeon-label").css("opacity","1");
			$("#daejeon-label-han").css("opacity","0");
		});
		$(".busan").hover(function(){
			$("#busan-img").css("box-shadow","5px 10px 10px gray");
			$("#busan-img").css("transform","scale(1.05)");
			$("#busan-img").css("-webkit-filter","grayscale(0%)");
			$("#busan-img").css("filter","none");
			$("#busan-label").css("opacity","0");
			$("#busan-label-han").css("opacity","1");
		},function(){
			$("#busan-img").css("box-shadow","3px 5px 5px gray");
			$("#busan-img").css("transform","scale(1.0)");
			$("#busan-img").css("-webkit-filter","grayscale(100%)");
			$("#busan-img").css("filter","gray");
			$("#busan-label").css("opacity","1");
			$("#busan-label-han").css("opacity","0");
		});
		$(".daegu").hover(function(){
			$("#daegu-img").css("box-shadow","5px 10px 10px gray");
			$("#daegu-img").css("transform","scale(1.05)");
			$("#daegu-img").css("-webkit-filter","grayscale(0%)");
			$("#daegu-img").css("filter","none");
			$("#daegu-label").css("opacity","0");
			$("#daegu-label-han").css("opacity","1");
		},function(){
			$("#daegu-img").css("box-shadow","3px 5px 5px gray");
			$("#daegu-img").css("transform","scale(1.0)");
			$("#daegu-img").css("-webkit-filter","grayscale(100%)");
			$("#daegu-img").css("filter","gray");
			$("#daegu-label").css("opacity","1");
			$("#daegu-label-han").css("opacity","0");
		});
		$(".jeolla").hover(function(){
			$("#jeolla-img").css("box-shadow","5px 10px 10px gray");
			$("#jeolla-img").css("transform","scale(1.05)");
			$("#jeolla-img").css("-webkit-filter","grayscale(0%)");
			$("#jeolla-img").css("filter","none");
			$("#jeolla-label").css("opacity","0");
			$("#jeolla-label-han").css("opacity","1");
		},function(){
			$("#jeolla-img").css("box-shadow","3px 5px 5px gray");
			$("#jeolla-img").css("transform","scale(1.0)");
			$("#jeolla-img").css("-webkit-filter","grayscale(100%)");
			$("#jeolla-img").css("filter","gray");
			$("#jeolla-label").css("opacity","1");
			$("#jeolla-label-han").css("opacity","0");
		});
		$(".gyeongsang").hover(function(){
			$("#gyeongsang-img").css("box-shadow","5px 10px 10px gray");
			$("#gyeongsang-img").css("transform","scale(1.05)");
			$("#gyeongsang-img").css("-webkit-filter","grayscale(0%)");
			$("#gyeongsang-img").css("filter","none");
			$("#gyeongsang-label").css("opacity","0");
			$("#gyeongsang-label-two").css("opacity","0");
			$("#gyeongsang-label-han").css("opacity","1");
		},function(){
			$("#gyeongsang-img").css("box-shadow","3px 5px 5px gray");
			$("#gyeongsang-img").css("transform","scale(1.0)");
			$("#gyeongsang-img").css("-webkit-filter","grayscale(100%)");
			$("#gyeongsang-img").css("filter","gray");
			$("#gyeongsang-label").css("opacity","1");
			$("#gyeongsang-label-two").css("opacity","1");
			$("#gyeongsang-label-han").css("opacity","0");
		});
		
		
	});
</script>
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>
