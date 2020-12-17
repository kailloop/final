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
		height:3200px;
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
		left:-5%;
		top:250px;
		opacity:0;
		transition:1s;
	}
	#explain-lism-two{
		position:relative;
		width:30%;
		height:500px;
		left:55%;
		top:-150px;
		opacity:0;
		transition:1s;
	}
	#explain-lism-three{
		position:relative;
		width:50%;
		height:400px;
		left:-5%;
		top:-400px;
		transition:1s;
		opacity:0;
	}
	#explain-lism-four{
		position:relative;
		width:40%;
		height:700px;
		left:65%;
		top:-700px;
		opacity:0;
		transition:1s;
	}
	#explain-lism-five{
		position:relative;
		width:40%;
		height:400px;
		left:0%;
		top:-1250px;
		transition:1s;
		opacity:0;
	}
	.picture{
		width:100%;
		height:100%;
	}
	.pic-title{
		font-family: 'Dancing Script', cursive;
		font-size:42px;
		font-weight:lighter;
		user-select:none;
		color:black;
	}
	#pic-first-title{
		position:relative;
		left:-28.5%;
		top:220px;
		color:black;
		opacity:0;
		transition:1s;
	}
	#pic-second-title{
		position:relative;
		left:30%;
		top:-180px;
		transition:1s;
		opacity:0;
	}
	#pic-third-title{
		position:relative;
		left:-30%;
		top:-400px;
		transition:1s;
		opacity:0;
	}
	#pic-four-title{
		position:relative;
		left:35%;
		top:-700px;
		transition:1s;
		opacity:0;
	}
	#pic-five-title{
		position:relative;
		left:-30%;
		top:-1250px;
		transition:1s;
		opacity:1;
	}
	.pic-content{
		font-family: 'Hi Melody', cursive;
		font-size:22px;
		color:gray;
		transition:1s;
		user-select:none;
	}
	#pic-first-content{
		position:relative;
		left:-28.5%;
		top:165px;
		opacity:0;
	}
	#pic-second-content{
		position:relative;
		left:30.5%;
		top:-230px;
		opacity:0;
	}
	#pic-third-content{
		position:relative;
		left:-28.5%;
		top:-420px;
		opacity:0;
	}
	#pic-four-content{
		position:relative;
		left:35%;
		top:-710px;
		opacity:0;
	}
	#pic-five-content{
		position:relative;
		left:-30%;
		top:-1250px;
		opacity:1;
	}
	#back-path{
		position:relative;
		width:120%;
		height:500px;
		top:2300px;
		left:-10%;
		filter: grayscale(80%);
	}
</style>
	<div id="my-container">
		<br/>
		<label id="my-container-title">Couplism</label>
		<div id="explain-lism-one">
			<img class="picture" src="${path }/resources/lism/lism-explain-one.jpg">
		</div>
		<label id="pic-first-title" class="pic-title">Restaurent</label><br/>
		<pre id="pic-first-content" class="pic-content">한식, 중식, 양식, 분식, 일식, 카페 등 예약한 
식당 및 디저트 관련 가게들을 보여드립니다.</pre>
		<div id="explain-lism-two">
			<img class="picture" src="${path }/resources/lism/lism-explain-two.jpg">
		</div>
		<label id="pic-second-title" class="pic-title">Attraction</label>
		<pre id="pic-second-content" class="pic-content">점 찍어 두었던 기억에 남을 만한 명소들을 보여드립니다.
애인, 가족 또는 친구들과 함께 하세요.</pre>
		<div id="explain-lism-three">
			<img class="picture" src="${path }/resources/lism/lism-explain-three.jpg">
		</div>
		<label id="pic-third-title" class="pic-title">Stay</label>
		<pre id="pic-third-content" class="pic-content">호텔, 펜션, 글램핑/캠핑, 게스트하우스 등
소중한 사람과 함께 묵을 곳을 예약한 장소를 간편하게 보여드립니다.</pre>
		<div id="explain-lism-four">
			<img class="picture" src="${path }/resources/lism/lism-explain-ford.jpg">
		</div>
		<label id="pic-four-title" class="pic-title">Activity</label>
		<pre id="pic-four-content" class="pic-content">스키/썰매, 낚시, 수상레저, 바이크 등
신나고 재미나게 노는 곳을 예약 해주세요.</pre>
		<div id="explain-lism-five">
			<img class="picture" src="${path }/resources/lism/lism-explain-five.jpg">
		</div>
		<label id="pic-five-title" class="pic-title">Store</label>
		<pre id="pic-five-content" class="pic-content">스키/썰매, 낚시, 수상레저, 바이크 등
신나고 재미나게 노는 곳을 예약 해주세요.</pre>
	</div>
	<div id="back-path">
		<img class="picture" src="${path }/resources/lism/lism-path.png">
	</div>
<script>
	$(window).scroll(function(){
		var height=$(document).scrollTop();
		console.log(height);
		if(height>=771){
			$("#explain-lism-one").css("opacity","1");
			$("#explain-lism-one").css("top","150px");
			$("#explain-lism-one").css("width","45%");
			$("#explain-lism-one").css("left","0%");
		}
		if(height>=840){
			$("#pic-first-title").css("opacity","1");
			$("#pic-first-title").css("top","140px");
			setTimeout(function(){
				$("#pic-first-content").css("opacity","1");
				$("#pic-first-content").css("top","125px");	
			},500);
		}
		if(height>=1055){
			$("#explain-lism-two").css("opacity","1");
			$("#explain-lism-two").css("top","-250px");
			$("#explain-lism-two").css("width","50%");
			$("#explain-lism-two").css("left","55%");
		}
		if(height>=1100){
			$("#pic-second-title").css("opacity","1");
			$("#pic-second-title").css("top","-260px");
			setTimeout(function(){
				$("#pic-second-content").css("opacity","1");
				$("#pic-second-content").css("top","-280px");	
			},500);
		}
		if(height>=1450){
			$("#explain-lism-three").css("opacity","1");
			$("#explain-lism-three").css("top","-450px");
		}
		if(height>=1550){
			$("#pic-third-title").css("opacity","1");
			$("#pic-third-title").css("top","-460px");
			setTimeout(function(){
				$("#pic-third-content").css("opacity","1");
				$("#pic-third-content").css("top","-475px");	
			},500);
		}
		if(height>=2000){
			$("#explain-lism-four").css("opacity","1");
			$("#explain-lism-four").css("top","-750px");
		}
		if(height>=2200){
			$("#pic-four-title").css("opacity","1");
			$("#pic-four-title").css("top","-750px");
			$("#explain-lism-five").css("opacity","1");
			$("#explain-lism-five").css("top","-1300px");
			setTimeout(function(){
				$("#pic-four-content").css("opacity","1");
				$("#pic-four-content").css("top","-760px");	
			},500);
		}
		if(height>=2350){
			$("#pic-five-title").css("opacity","1");
			$("#pic-five-title").css("top","-1300px");
			setTimeout(function(){
				$("#pic-five-content").css("opacity","1");
				$("#pic-five-content").css("top","-1300px");	
			},500);
		}
	});
</script>
<script>
	
</script>
	
	
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>