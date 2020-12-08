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
		height:3900px;
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
		height:3300px;
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
	#chungcheong{
		position:relative;
		width:0px;
		height:3px;
		background-color:gray;
		transition:1s;
		top:-1333px;
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
	#chungcheong-img{
		position:relative;
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
	    z-index:-1;
		width:0px;
		height:500px;
		transition:1s;
		left:-120px;
		top:-1580px;
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
	.chungcheong-eng{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:120px;
		color:white;
		font-weight:bolder;
		top:-180px;
		left:-450px;
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
	#chungcheong-label-two{
		font-family: 'Montserrat', sans-serif;
		position:relative;
		font-size:120px;
		color:white;
		font-weight:bolder;
		top:-120px;
		left:-35px;
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
	#chungcheong-label{
		transition:0.5s;
	}
	#chungcheong-label-two{
		transition:0.5s;
	}
	#chungcheong-label-han{
		font-size:80px;
		transition:0.5s;
		color:white;
		position:relative;
		top:-455px;
		width:500px;
		left:-75px;
		opacity:0;
		text-shadow:1px 3px 3px lightgray;
		font-family:Nanum Gothic Coding;
	}
	#location-modal-title{
		font-size:42px;
		font-weight:bolder;
		color:black;
		font-family:Nanum Gothic Coding;
	}
	#location-select-table{
		width:100%;
		height:auto;
		border:1px red solid;
		margin:0;
		padding:0;
		border-collapse: collapse;
	}
	.location-tr{
		position:relative;
		margin:0;
		padding:0;
		width:100%;
		height:60px;
		color:black;
		cursor:pointer;
	}
	.location-select-font{
		color:black;
		font-family:Nanum Gothic Coding;
		border:1px black solid;
		position:relative;
		width:50%;
		font-size:12px;
	}
</style>
	<br/><br/><br/><br/><br/><br/>
	<div id="title-line">
		<div id="seoul" data-toggle="modal" data-target="#locationModal">
			<div class="seoul-eng seoul">
				<label id="seoul-label" style="cursor:pointer;user-select: none;">Seoul</label>
				<label id="seoul-label-han" style="cursor:pointer;user-select:none;">서울특별시</label>
			</div>
		</div>
		<img id="seoul-img" class="seoul" data-toggle="modal" data-target="#locationModal" src="${path }/resources/images/seoul.jpg" alt="서울">
		<div id="kyungki" data-toggle="modal" data-target="#locationModal">
			<div class="kyungki-eng kyungki">
				<label id="kyungki-label" style="cursor:pointer;user-select:none;">Kyungki</label>
				<label id="kyungki-label-han" style="cursor:pointer;user-select:none;">경기도</label>
			</div>
		</div>
		<img id="kyungki-img" data-toggle="modal" data-target="#locationModal" class="kyungki" src="${path }/resources/images/Kyungki.jpg" alt="경기도">
		<div id="incheon" data-toggle="modal" data-target="#locationModal">
			<div class="incheon-eng incheon">
				<label id="incheon-label" style="cursor:pointer;user-select:none;">InCheon</label>
				<label id="incheon-label-han" style="cursor:pointer;user-select:none;">인천광역시</label>
			</div>
		</div>
		<img id="incheon-img" data-toggle="modal" data-target="#locationModal" class="incheon" src="${path }/resources/images/incheon.png" alt="인천">
		<div id="kangwon" data-toggle="modal" data-target="#locationModal">
			<div class="kangwon-eng kangwon">
				<label id="kangwon-label" style="cursor:pointer;user-select:none;">KangWon</label>
				<label id="kangwon-label-han" style="cursor:pointer;user-select:none;">강원도</label>
			</div>
		</div>
		<img id="kangwon-img" data-toggle="modal" data-target="#locationModal" class="jeju" src="${path }/resources/images/kangwon.jpg" alt="강원도">
		<div id="jeju" data-toggle="modal" data-target="#locationModal">
			<div class="jeju-eng jeju">
				<label id="jeju-label" style="cursor:pointer;user-select:none;">JejuDo</label>
				<label id="jeju-label-han" style="cursor:pointer;user-select:none;">제주도</label>
			</div>
		</div>
		<img id="jeju-img" data-toggle="modal" data-target="#locationModal" class="jeju" src="${path }/resources/images/jeju.jpg" alt="제주도">
		<div id="daejeon" data-toggle="modal" data-target="#locationModal">
			<div class="daejeon-eng daejeon">
				<label id="daejeon-label" style="cursor:pointer;user-select:none;">DaeJeon</label>
				<label id="daejeon-label-han" style="cursor:pointer;user-select:none;">대전광역시</label>
			</div>
		</div>
		<img id="daejeon-img" data-toggle="modal" data-target="#locationModal" class="daejeon" src="${path }/resources/images/daejeon.jpg" alt="대전광역시">
		<div id="busan" data-toggle="modal" data-target="#locationModal">
			<div class="busan-eng busan">
				<label id="busan-label" style="cursor:pointer;user-select:none;">Busan</label>
				<label id="busan-label-han" style="cursor:pointer;user-select:none;">부산광역시</label>
			</div>
		</div>
		<img id="busan-img" data-toggle="modal" data-target="#locationModal" class="busan" src="${path }/resources/images/busan.jpg" alt="부산광역시">
		<div id="daegu" data-toggle="modal" data-target="#locationModal">
			<div class="daegu-eng daegu">
				<label id="daegu-label" style="cursor:pointer;user-select:none;">DaeGu</label>
				<label id="daegu-label-han" style="cursor:pointer;user-select:none;">대구광역시</label>
			</div>
		</div>
		<img id="daegu-img" data-toggle="modal" data-target="#locationModal" class="daegu" src="${path }/resources/images/daegu.jpg" alt="대구광역시">
		<div id="jeolla" data-toggle="modal" data-target="#locationModal">
			<div class="jeolla-eng jeolla">
				<label id="jeolla-label" style="cursor:pointer;user-select:none;">JeolLa</label>
				<label id="jeolla-label-han" style="cursor:pointer;user-select:none;">전라북/남도</label>
			</div>
		</div>
		<img id="jeolla-img" data-toggle="modal" data-target="#locationModal" class="jeolla" src="${path }/resources/images/jeolla.jpg" alt="전라도">
		<div id="gyeongsang" data-toggle="modal" data-target="#locationModal">
			<div class="gyeongsang-eng gyeongsang">
				<label id="gyeongsang-label" style="cursor:pointer;user-select:none;">Gyeong</label>
				<label id="gyeongsang-label-two" style="cursor:pointer;user-select:none;">Sang</label>
				
				<label id="gyeongsang-label-han" style="cursor:pointer;user-select:none;">경상북/남도</label>
			</div>
		</div>
		<img id="gyeongsang-img" data-toggle="modal" data-target="#locationModal" class="gyeongsang" src="${path }/resources/images/gyeongsang.jpg" alt="경상도">
		<div id="chungcheong" data-toggle="modal" data-target="#locationModal">
			<div class="chungcheong-eng chungcheong">
				<label id="chungcheong-label" style="cursor:pointer;user-select:none;">Chung</label>
				<label id="chungcheong-label-two" style="cursor:pointer;user-select:none;">Cheong</label>
				
				<label id="chungcheong-label-han" style="cursor:pointer;user-select:none;">충청북/남도</label>
			</div>
		</div>
		<img id="chungcheong-img" data-toggle="modal" data-target="#locationModal" class="chungcheong" src="${path }/resources/images/chungcheong.jpg" alt="충청도">
	</div>
	<input type="hidden" name="location-first" id="location-first" value="">
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
		if(height>=2850){//경상가지
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
		if(height>=3520){//충청가지
			$("#chungcheong").css("width","100px");
			$("#chungcheong").css("left","-100px");
			setInterval(function(){//이미지
				$("#chungcheong-img").css("width","500px");
				$("#chungcheong-img").css("left","-620px");
				setInterval(function(){//글자
					$("#chungcheong").css("color","#F6F6F6");
					$("#chungcheong").css("opacity","1");
					$("#chungcheong-label").css("text-shadow","1px 3px 3px lightgray");	
				},1000);
			},1200)
		}
		
	});
	$(function(){
		let location="";
		$(".seoul").click(function(){
			location=$("#location-first").val("서울특별시");
			$("#location-first-demo").text("서울특별시");
			$(".tr-one").append("<td class='location-select-font'>서울 전체</td>");
			$(".tr-one").append("<td class='location-select-font'>도봉구/강북구/노원구</td>");
			$(".tr-two").append("<td class='location-select-font'>동대문구/중랑구/성북구</td>");
			$(".tr-two").append("<td class='location-select-font'>강동구/송파구</td>");
			$(".tr-three").append("<td class='location-select-font'>광진구/성동구</td>");
			$(".tr-three").append("<td class='location-select-font'>종로구/중구/용산구</td>");
			$(".tr-four").append("<td class='location-select-font'>은평구/서대문구/마포구</td>");
			$(".tr-four").append("<td class='location-select-font'>강남구/서초구</td>");
			$(".tr-five").append("<td class='location-select-font'>동작구/관악구/금천구</td>");
			$(".tr-five").append("<td class='location-select-font'>영등포구/구로구</td>");
			$(".tr-six").append("<td class='location-select-font'>양천구/강서구</td>");
			$(".tr-seven").css("height","0px");
			$(".tr-eight").css("height","0px");
		});
		$(".kyungki").click(function(){
			location=$("#location-first").val("경기도");
			$("#location-first-demo").text("경기도");
			$(".tr-one").append("<td class='location-select-font'>경기 전체</td>");
			$(".tr-one").append("<td class='location-select-font'>가평/청평/양평</td>");
			$(".tr-two").append("<td class='location-select-font'>수원/화성</td>");
			$(".tr-two").append("<td class='location-select-font'>고양/파주/김포</td>");
			$(".tr-three").append("<td class='location-select-font'>의정부/포천/동두천/연천</td>");
			$(".tr-three").append("<td class='location-select-font'>용인/동탄</td>");
			$(".tr-four").append("<td class='location-select-font'>오산/평택</td>");
			$(".tr-four").append("<td class='location-select-font'>남양주/구리/성남/분당</td>");
			$(".tr-five").append("<td class='location-select-font'>이천/광주/여주/하남</td>");
			$(".tr-five").append("<td class='location-select-font'>부천/광명/시흥/안산</td>");
			$(".tr-six").append("<td class='location-select-font'>안양/의왕/군포</td>");
			$(".tr-seven").css("height","0px");
			$(".tr-eight").css("height","0px");
		});
		$(".incheon").click(function(){
			location=$("#location-first").val("인천광역시");
			$("#location-first-demo").text("인천광역시");
			$(".tr-one").append("<td class='location-select-font'>인천 전체</td>");
			$(".tr-one").append("<td class='location-select-font'>송도/소래포구</td>");
			$(".tr-two").append("<td class='location-select-font'>인천국제공항/강화</td>");
			$(".tr-two").append("<td class='location-select-font'>을왕리/영종</td>");
			$(".tr-three").append("<td class='location-select-font'>구읍뱃터/월미도</td>");
			$(".tr-three").append("<td class='location-select-font'>주안/간석/인천시청</td>");
			$(".tr-four").append("<td class='location-select-font'>청라/계양/부평</td>");
			$(".tr-seven").css("height","0px");
			$(".tr-eight").css("height","0px");
		});
		$(".kangwon").click(function(){
			location=$("#location-first").val("강원도");
			$("#location-first-demo").text("강원도");
			$(".tr-one").append("<td class='location-select-font'>강원 전체</td>");
			$(".tr-one").append("<td class='location-select-font'>춘천/강촌</td>");
			$(".tr-two").append("<td class='location-select-font'>원주</td>");
			$(".tr-two").append("<td class='location-select-font'>경포대/사천/주문진/정동진</td>");
			$(".tr-three").append("<td class='location-select-font'>강릉역/교동/옥계</td>");
			$(".tr-three").append("<td class='location-select-font'>영월/정선</td>");
			$(".tr-four").append("<td class='location-select-font'>속초/양양/고성</td>");
			$(".tr-four").append("<td class='location-select-font'>동해/삼척/태백</td>");
			$(".tr-five").append("<td class='location-select-font'>평창</td>");
			$(".tr-five").append("<td class='location-select-font'>홍천/황성</td>");
			$(".tr-six").append("<td class='location-select-font'>화천/철원/인제/양구</td>");
			$(".tr-seven").css("height","0px");
			$(".tr-eight").css("height","0px");
		});
		$(".jeju").click(function(){
			location=$("#location-first").val("제주특별자치도");
			$("#location-first-demo").text("제주특별자치도");
			$(".tr-one").append("<td class='location-select-font'>제주시</td>");
			$(".tr-one").append("<td class='location-select-font'>서귀포시</td>");
			$(".tr-two").append("<td class='location-select-font'>하귀/애월/한림/협재</td>");
			$(".tr-seven").css("height","0px");
			$(".tr-eight").css("height","0px");
		});
		$(".daejeon").click(function(){
			location=$("#location-first").val("대전광역시");
			$("#location-first-demo").text("대전광역시");
			$(".tr-one").append("<td class='location-select-font'>유성구</td>");
			$(".tr-one").append("<td class='location-select-font'>중구(은행/대흥/선화/유천)</td>");
			$(".tr-two").append("<td class='location-select-font'>동구(용전/복합터미널)</td>");
			$(".tr-two").append("<td class='location-select-font'>서구(둔산/용문/월평)</td>");
			$(".tr-three").append("<td class='location-select-font'>대덕구(중리/신탄진)</td>");
			$(".tr-seven").css("height","0px");
			$(".tr-eight").css("height","0px");
		});
		$(".busan").click(function(){
			location=$("#location-first").val("부산광역시");
			$("#location-first-demo").text("부산광역시");
			$(".tr-one").append("<td class='location-select-font'>해운대/센텀시티/재송</td>");
			$(".tr-one").append("<td class='location-select-font'>송정/기장/정관</td>");
			$(".tr-two").append("<td class='location-select-font'>광안리/수영</td>");
			$(".tr-two").append("<td class='location-select-font'>경성대/대연/용호동/문현</td>");
			$(".tr-three").append("<td class='location-select-font'>서면/양정/초읍/부산시민공원</td>");
			$(".tr-three").append("<td class='location-select-font'>남포동/중앙동<br/>태종대/송도/영도</td>");
			$(".tr-four").append("<td class='location-select-font'>부산역/범일동/부산진역</td>");
			$(".tr-four").append("<td class='location-select-font'>연산/토곡</td>");
			$(".tr-five").append("<td class='location-select-font'>동래/사직/온천장/부산대/구서</td>");
			$(".tr-five").append("<td class='location-select-font'>사상(경전철)/엄궁/학장</td>");
			$(".tr-six").append("<td class='location-select-font'>덕천/만덕<br/>화명/구포(구포역/KTX역)</td>");
			$(".tr-six").append("<td class='location-select-font'>하단/명지/김해공항/다대포<br/>강서/신호/괴정/지사</td>");
			$(".tr-seven").css("height","0px");
			$(".tr-eight").css("height","0px");
		});
		$(".daegu").click(function(){
			location=$("#location-first").val("대구광역시");
			$("#location-first-demo").text("대구광역시");
			$(".tr-one").append("<td class='location-select-font'>동성로/서문시장<br/>대구시청/삼덕동/교동/종로</td>");
			$(".tr-one").append("<td class='location-select-font'>대구역/칠성시장/경북대/엑스코<br/>칠곡지구/태전동/금호지구</td>");
			$(".tr-two").append("<td class='location-select-font'>동대구역/고속버스터미널/신천동/신암동</td>");
			$(".tr-two").append("<td class='location-select-font'>대구공항/혁신도시/동촌유원지/팔공산</td>");
			$(".tr-three").append("<td class='location-select-font'>수성못/들안길/황금/두산/범어/시지<br/>라이온즈파크/월드컵경기장</td>");
			$(".tr-three").append("<td class='location-select-font'>북부정류장/이현공단/평리동<br/>내당동/비산동/원대동</td>");
			$(".tr-four").append("<td class='location-select-font'>두류공원/앞산공원/안지랑<br/>성당동/이천동/대명/봉덕</td>");
			$(".tr-four").append("<td class='location-select-font'>서부정류장/광장코아/본리/죽전/장기동</td>");
			$(".tr-five").append("<td class='location-select-font'>성서/계명대/성서공단/상인동<br/>달성군/가창/현풍/논공</td>");
			$(".tr-seven").css("height","0px");
			$(".tr-eight").css("height","0px");
		});
		$(".jeolla").click(function(){
			location=$("#location-first").val("전라도");
			$("#location-first-demo").text("전라도");
			$(".tr-one").append("<td class='location-select-font'>전주/완주</td>");
			$(".tr-one").append("<td class='location-select-font'>군산</td>");
			$(".tr-two").append("<td class='location-select-font'>익산</td>");
			$(".tr-two").append("<td class='location-select-font'>남원/임실/순창/무주/진안/장수</td>");
			$(".tr-three").append("<td class='location-select-font'>정읍/부안/김제/고창</td>");
			$(".tr-three").append("<td class='location-select-font'>여수</td>");
			$(".tr-four").append("<td class='location-select-font'>순천</td>");
			$(".tr-four").append("<td class='location-select-font'>광양</td>");
			$(".tr-five").append("<td class='location-select-font'>나주/함평/영광/장성</td>");
			$(".tr-five").append("<td class='location-select-font'>목포/무안/영암/신안</td>");
			$(".tr-six").append("<td class='location-select-font'>담양/곡성/화순/구례</td>");
			$(".tr-six").append("<td class='location-select-font'>해남/완도/진도/강진/장흥/보성/고흥</td>");
			$(".tr-seven").css("height","60px");
			$(".tr-eight").css("height","60px");
			$(".tr-seven").append("<td class='location-select-font'>광주(상무지구/금호지구/유스퀘어/서구)</td>");
			$(".tr-seven").append("<td class='location-select-font'>광주(첨단지구/하남지구/송정역/광산구)</td>");
			$(".tr-eight").append("<td class='location-select-font'>광주(충장로/대인시장/국립아시아문화전당/동구/남구)</td>");
			$(".tr-eight").append("<td class='location-select-font'>광주(광주역/기아챔피언스필드/전대사거리/북구)</td>");
			$(".modal-body").css("height","auto");
		});
		$(".gyeongsang").click(function(){
			location=$("#location-first").val("경상도");
			$("#location-first-demo").text("경상북도");
			$("#location-first-demo").css("cursor","pointer");
			$("#location-space").css("display","inline-block");
			$(".tr-one").append("<td class='location-select-font'>포항/남구(시청/시외버스터미널/구룡포/쌍사/문덕/오천)</td>");
			$(".tr-one").append("<td class='location-select-font'>포항/북구(영일대/죽도시장/여객터미널/송도)</td>");
			$(".tr-two").append("<td class='location-select-font'>경주(보문단지/황리단길/불국사/양남/감포/안강)</td>");
			$(".tr-two").append("<td class='location-select-font'>구미</td>");
			$(".tr-three").append("<td class='location-select-font'>경산(영남대/대구대/갓바위/하양/진량/자인)</td>");
			$(".tr-three").append("<td class='location-select-font'>안동(경북도청/하회마을)</td>");
			$(".tr-four").append("<td class='location-select-font'>영천/청도</td>");
			$(".tr-four").append("<td class='location-select-font'>김천/칠곡/성주</td>");
			$(".tr-five").append("<td class='location-select-font'>문경/상주/영주/예천/군위/의성/봉화</td>");
			$(".tr-five").append("<td class='location-select-font'>울진/영덕/청송</td>");
			$(".tr-six").append("<td class='location-select-font'>울릉도</td>");
			$(".tr-seven").css("height","0px");
			$(".tr-eight").css("height","0px");
			$("#location-second-demo").text("경상남도")
			$("#location-second-demo").css("cursor","pointer");
			$("#location-first-demo").click(function(){
				$('td').remove('.location-select-font');
				$(".tr-one").append("<td class='location-select-font'>포항/남구(시청/시외버스터미널/구룡포/쌍사/문덕/오천)</td>");
				$(".tr-one").append("<td class='location-select-font'>포항/북구(영일대/죽도시장/여객터미널/송도)</td>");
				$(".tr-two").append("<td class='location-select-font'>경주(보문단지/황리단길/불국사/양남/감포/안강)</td>");
				$(".tr-two").append("<td class='location-select-font'>구미</td>");
				$(".tr-three").append("<td class='location-select-font'>경산(영남대/대구대/갓바위/하양/진량/자인)</td>");
				$(".tr-three").append("<td class='location-select-font'>안동(경북도청/하회마을)</td>");
				$(".tr-four").append("<td class='location-select-font'>영천/청도</td>");
				$(".tr-four").append("<td class='location-select-font'>김천/칠곡/성주</td>");
				$(".tr-five").append("<td class='location-select-font'>문경/상주/영주/예천/군위/의성/봉화</td>");
				$(".tr-five").append("<td class='location-select-font'>울진/영덕/청송</td>");
				$(".tr-six").append("<td class='location-select-font'>울릉도</td>");
			});
			$("#location-second-demo").click(function(){
				$('td').remove('.location-select-font');
				$(".tr-one").append("<td class='location-select-font'>창원 상남동/용호동/중앙동/창원시청</td>");
				$(".tr-one").append("<td class='location-select-font'>창원 명서동/봉곡동/팔용동/북면온천/창원종합버스터미널</td>");
				$(".tr-two").append("<td class='location-select-font'>마산/진해</td>");
				$(".tr-two").append("<td class='location-select-font'>김해/장유</td>");
				$(".tr-three").append("<td class='location-select-font'>양산/밀양</td>");
				$(".tr-three").append("<td class='location-select-font'>진주</td>");
				$(".tr-four").append("<td class='location-select-font'>거제/통영/고성</td>");
				$(".tr-four").append("<td class='location-select-font'>사천/남해</td>");
				$(".tr-five").append("<td class='location-select-font'>하동/산청/함양</td>");
				$(".tr-five").append("<td class='location-select-font'>거창/함안/창녕/합천/의령</td>");
			});
		});
		
		
		$(".chungcheong").click(function(){
			location=$("#location-first").val("충청도");
			$("#location-first-demo").text("충청북도");
			$("#location-first-demo").css("cursor","pointer");
			$("#location-space").css("display","inline-block");
			$(".tr-one").append("<td class='location-select-font'>청주 흥덕구/서원구 (청주 터미널)</td>");
			$(".tr-one").append("<td class='location-select-font'>청주 상당구/청원구 (청주국제공항)</td>");
			$(".tr-two").append("<td class='location-select-font'>충주/수안보</td>");
			$(".tr-two").append("<td class='location-select-font'>제천/진천/음성/단양</td>");
			$(".tr-three").append("<td class='location-select-font'>보은/옥천/괴산/증평/영동</td>");
			$(".modal-body").css("height","auto");
			$(".tr-seven").css("height","0px");
			$(".tr-eight").css("height","0px");
			$("#location-second-demo").text("충청남도")
			$("#location-second-demo").css("cursor","pointer");
			$("#location-first-demo").click(function(){
				$('td').remove('.location-select-font');
				$(".tr-one").append("<td class='location-select-font'>청주 흥덕구/서원구 (청주 터미널)</td>");
				$(".tr-one").append("<td class='location-select-font'>청주 상당구/청원구 (청주국제공항)</td>");
				$(".tr-two").append("<td class='location-select-font'>충주/수안보</td>");
				$(".tr-two").append("<td class='location-select-font'>제천/진천/음성/단양</td>");
				$(".tr-three").append("<td class='location-select-font'>보은/옥천/괴산/증평/영동</td>");
				$(".modal-body").css("height","auto");
			});
			$("#location-second-demo").click(function(){
				$('td').remove('.location-select-font');
				$(".tr-one").append("<td class='location-select-font'>천안 서북구</td>");
				$(".tr-one").append("<td class='location-select-font'>천안 동남구</td>");
				$(".tr-two").append("<td class='location-select-font'>아산</td>");
				$(".tr-two").append("<td class='location-select-font'>공주/동학사/세종</td>");
				$(".tr-three").append("<td class='location-select-font'>계룡/금산/논산/청양</td>");
				$(".tr-three").append("<td class='location-select-font'>예산/홍성</td>");
				$(".tr-four").append("<td class='location-select-font'>태안/안면도/서산</td>");
				$(".tr-four").append("<td class='location-select-font'>당진</td>");
				$(".tr-five").append("<td class='location-select-font'>보령/대천해수욕장</td>");
				$(".tr-five").append("<td class='location-select-font'>서천/부여</td>");
				$(".modal-body").css("height","auto");
			});
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
		$(".chungcheong").hover(function(){
			$("#chungcheong-img").css("box-shadow","5px 10px 10px gray");
			$("#chungcheong-img").css("transform","scale(1.05)");
			$("#chungcheong-img").css("-webkit-filter","grayscale(0%)");
			$("#chungcheong-img").css("filter","none");
			$("#chungcheong-label").css("opacity","0");
			$("#chungcheong-label-two").css("opacity","0");
			$("#chungcheong-label-han").css("opacity","1");
		},function(){
			$("#chungcheong-img").css("box-shadow","3px 5px 5px gray");
			$("#chungcheong-img").css("transform","scale(1.0)");
			$("#chungcheong-img").css("-webkit-filter","grayscale(100%)");
			$("#chungcheong-img").css("filter","gray");
			$("#chungcheong-label").css("opacity","1");
			$("#chungcheong-label-two").css("opacity","1");
			$("#chungcheong-label-han").css("opacity","0");
		});

		
		
		
	});
</script>
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>
