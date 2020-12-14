<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="logginedMember" value="${logginedMember }"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>연인과 함께 만들어가는 커플리즘</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- 폰트어썸 -->
	<script src="https://kit.fontawesome.com/d41f04266a.js" crossorigin="anonymous"></script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- Material 폰트 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Hi+Melody&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- 로그인 API -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${path }/resources/css/style.css">

	<!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
</head>
<style>
	#kakao-login-btn{
		width:235px;
	}
	.modal-content{
		/* background-color:purple; */
		/* background-image:url(/couplism/resources/images/login-logo.jpg); */
		
	}
	.modal-body{
		border:none;
		border-radius:20px;
		text-align:center;
		overflow:hidden;
		height:750px;
	}
	.login-title{
	text-align:center;
	font-size:82px;
	font-family:Dancing Script;
	color:black;
	transition:1s;
	}
	#login-close{
		position:absolute;
		margin:0;
		padding:0;
		top:30px;
		right:40px;
		cursor:pointer;
		width:auto;
		height:auto;
		font-size:38px;
		transition: all ease 1s;
	}
	#login-close:hover{
		transform:rotate(360deg);
	}
	#location-close{
		position:absolute;
		margin:0;
		padding:0;
		top:30px;
		right:40px;
		cursor:pointer;
		width:auto;
		height:auto;
		font-size:38px;
		transition: all ease 1s;
	}
	#location-close:hover{
		transform:rotate(360deg);
	}
	#id-placeholder{
		position:absolute;
		cursor:text;
		color:gray;
		font-size:20px;
		margin:0;
		padding:0;
		z-index:0;
		transition:all ease 0.5s;
		left:70px;
		top:232px;
	}
	#id-input{
		z-index:1;
		transition:all ease 0.5s;
		border:none;
		border-bottom:1px black solid;
		background-color:transparent;
		outline:none;
		width:370px;
		height:50px;
		font-size:20px;
	}
	#pw-input{
		z-index:1;
		transition:all ease 0.5s;
		border:none;
		border-bottom:1px black solid;
		background-color:transparent;
		outline:none;
		width:370px;
		height:50px;
		font-size:20px;
	}
	#pw-placeholder{
		position:absolute;
		cursor:text;
		color:gray;
		font-size:20px;
		margin:0;
		padding:0;
		z-index:0;
		transition:all ease 0.5s;
		left:70px;
		top:314px;
	}
	.dance-font{
		font-family:Dancing Script;
		font-size:26px;
		color:black;
		text-shadow:5px 10px 10px lightgray;
		font-weight:bold;
	}
	.enroll-input{
		width:370px;
		height:50px;
		border:none;
		background:transparent;
		border-bottom:1px black solid;
		outline:none;
		transition:all ease 1s;
		font-size:20px;
	}
	#clickLogin{
		position:absolute;
		margin:0;
		padding:0;
		font-size:15px;
		cursor:pointer;
		width:15px;
		height:15px;
		top:auto;
		bottom:auto;
		color:#F0F0F0;
		left:3px;
	}
	#myPage{
		position:relative;
		font-size:20px;
		cursor:pointer;
		margin-right:15px;
	}
	#login{
		position:relative;
		width:90px;
		height:22px;
		top:10px;
		right:20px;
		transition:1s;
		cursor:pointer;
		z-index:100;
		cursor:pointer;
	}
	#logout{
		position:relative;
		width:90px;
		height:22px;
		top:10px;
		right:20px;
		transition:1s;
		cursor:pointer;
		z-index:100;
		cursor:pointer;
	}
	#login-font{	
		position:absolute;
		font-size:15px;
		width:auto;
		height:auto;
		margin:0;
		padding:0;
		color:#F0F0F0;
		top:-7px;
		cursor:pointer;
		left:20px;
		font-family:Roboto;
	}
	#logout-font{
		position:absolute;
		font-size:15px;
		width:auto;
		height:auto;
		margin:0;
		padding:0;
		color:#F0F0F0;
		top:-7px;
		cursor:pointer;
		left:20px;
		font-family:Roboto;
	}
	.nav-color{
		color:black;
	}
	#nav-main{
		position:relative;
		transition:0.5s;
		left:0px;
		font-size:30px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	#nav-sub{
		position:relative;
		transition:1s;
		left:600px;
		font-size:30px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.nav-community{
		display:none;
	}
	.nav-travel{
		display:none;
	}
	.nav-anniversary{
		display:none;
	}
	#login-btn{
		position:relative;
		left:10%;
		width:80%;
	}
	.nav-item{
		font-size:32px;
	}
</style>

<body>
	<div class="wrap">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-12 col-md d-flex align-items-center">
					<p class="mb-0 phone"><span class="mailus">Phone no:</span> <a href="#">010-8902-0975</a> or <span class="mailus">email us:</span> <a href="#">kailloop@daum.net</a></p>
				</div>
				<c:if test="${logginedMember==null }">
					<div id="login" data-toggle="modal" data-target="#loginModal">
						<i id="clickLogin" class="fas fa-sign-in-alt"></i><label for="login" id="login-font">&nbsp;LOGIN</label>
					</div>
				</c:if>
				<c:if test="${logginedMember!=null }">
					<c:if test="${naverLogin==null }">
						<c:if test="${kakaoLogin==null }">
							<div id="logout" onclick="logout();">
								<i id="clickLogin" class="fas fa-sign-out-alt"></i><label for="logout" id="logout-font">&nbsp;LOGOUT</label>
							</div>
						</c:if>
					</c:if>
				</c:if>
				<c:if test="${logginedMember!=null }">
					<c:if test="${naverLogin!=null }">
						<div id="logout" onclick="logoutNaver();">
							<i id="clickLogin" class="fas fa-sign-out-alt"></i><label for="logout" id="logout-font">&nbsp;LOGOUT</label>
						</div>
					</c:if>
				</c:if>
				<c:if test="${logginedMember!=null }">
					<c:if test="${kakaoLogin!=null }">
						<div id="logout" onclick="logoutKakao();">
							<i id="clickLogin" class="fas fa-sign-out-alt"></i><label for="logout" id="logout-font">&nbsp;LOGOUT</label>
						</div>
					</c:if>
				</c:if>
				<%-- <button onclick="location.replace('${path}/enrollLocation')">여행지만들기</button> --%>
				
				<div id="mypage" class="circle">
				
				<c:if test="${logginedMember!=null }">
						<c:if test="${logginedMember.email eq 'admin@admin' }"> <!--관리자  -->
		                	<p id="myPage" class="mb-0"><i class="fas fa-user-circle" onclick="location.href='${path}/mypage/adminMypage.do?idvalue=<c:out value="${logginedMember.id }"/>'">   <small>관리자</small> 님</i></p>
		                </c:if>
						<c:if test="${naverLogin.email==null }"> <!--일반회원  -->
							<p id="myPage" class="mb-0"><i class="fas fa-user-circle" onclick="location.href='${path}/mypage/userMypage.do?idvalue=<c:out value="${logginedMember.id }"/>'">${logginedMember.nickname }님</i></p> 
						</c:if>
					
					
						<c:if test="${naverLogin.email!=null }"> <!--네이버회원  -->
							<p id="myPage" class="mb-0"><i class="fas fa-user-circle" onclick="location.href='${path}/mypage/userMypage.do?idvalue=<c:out value="${naverLogin.email }"/>'">${naverLogin.nickname }님</i></p> 
						</c:if>
						<c:if test="${kakaoLogin.email!=null }"> <!-- 카카오회원 -->
							<p id="myPage" class="mb-0"><i class="fas fa-user-circle" onclick="location.href='${path}/mypage/userMypage.do?idvalue=<c:out value="${kakaoLogin.email }"/>'">${kakaoLogin.nickname }님</i></p>
						</c:if>
					
	                
	                <%-- <p id="myPage" class="mb-0"><i class="fas fa-user-circle" onclick="location.href='${path}/mypage/partnerMypage.do'">   <small>파트너</small> 님</i></p> --%> 
				</c:if>
            	</div>
			</div>
		</div>
	</div>
	
	<nav class="navbar navbar-expand-xl navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container" style="background:white;
										overflow:hidden;">
			<a class="navbar-brand" href="/couplism/">Coupli<span>sm</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            	<span class="oi oi-menu"></span> Menu
         	</button>

			<div class="collapse navbar-collapse" id="ftco-nav" style="overflow:hidden;">
				<div id="nav-main">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a href="" class="nav-color nav-link" style="font-size:16px;">회사소개</a></li>
						<li class="nav-item"><a id="travel" class="nav-color nav-link" onclick="travel();" style="cursor:pointer;font-size:16px;">여행지</a></li>
						<li class="nav-item"><a class="nav-color nav-link" style="cursor:pointer;font-size:16px;" onclick="lism();">리즘</a></li>
						<li class="nav-item"><a id="anniversary" class="nav-link nav-color" style="cursor:pointer;font-size:16px;" href="${path }/anniversary/anniversarySearch.do">기념일</a></li>
						<li class="nav-item"><a id="community" class="nav-link nav-color" style="cursor:pointer;font-size:16px;">커뮤니티</a></li>
					</ul>
				</div>
				<div id="nav-sub">
					<ul class="navbar-nav ml-auto" style="font-size:16px;">
						<li class="nav-item nav-community"><a href="${path }/notice/noticeList" class="nav-link nav-color">공지사항</a></li>
						<li class="nav-item nav-community"><a href="${path }/faq/faqList.do" class="nav-link nav-color" >FAQ</a></li>
						<li class="nav-item nav-community"><a href="${path }/event/eventList.do" class="nav-link nav-color" >이벤트</a></li>
						<!-- <li class="nav-item nav-travel"><a href="" class="nav-link nav-color" >숙박시설</a></li>
						<li class="nav-item nav-travel"><a href="" class="nav-link nav-color" >명소</a></li>
						<li class="nav-item nav-travel"><a href="" class="nav-link nav-color" >식당</a></li>
						<li class="nav-item nav-travel"><a href="" class="nav-link nav-color" >액티비티</a></li> -->
						<%-- <li class="nav-item nav-anniversary"><a href="${path }/anniversary/myCalendar.do"  class="nav-link nav-color" >기념일 설정</a></li>
						<li class="nav-item nav-anniversary"><a href="${path }/anniversary/anniversarySearch.do" class="nav-link nav-color" >기념 여행지</a></li> --%>
						<li class="nav-item"><a class="nav-link nav-color nav-back" style="cursor:pointer;" >뒤로가기</a></li>
					</ul>
				</div>
			</div>
					
				
		</div>
	</nav>
	<!-- END nav -->
	
	<!-- 로그인 Modal -->
	<c:if test="${logginedMember==null }">
	<div class="modal" id="loginModal" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
		        <div class="modal-body">
		          <!-- Default form login -->
					<form action="${path }/member/memberLogin" method="post">						
						
						<i id="login-close" class="fas fa-times" aria-hidden="true"></i>
						
					    <label class="login-title">Couplism</label>
					    
					    <br><br>
					    <!-- ID -->
					    <!-- Material input -->
						<!-- Medium input -->
						<div class="md-form">
						  <label id="id-placeholder" for="id-input">Please Enter your ID</label>
						  <input id="id-input" name="id-input" type="text" class="">
						 
						</div>
						<br>
					    <!-- Password -->
					    <label id="pw-placeholder" for="pw-input">Please Enter your Password</label>
					    <input id="pw-input" name="pw-input" type="password" class="mb-6">
					    <br/><br/>
					    
					    
					    
						    
					    <div class="d-flex justify-content-around">
					        <div>
					            <a href="${path}/member/findId">Forgot id?</a>&nbsp;&nbsp;&nbsp;
					            <a href="">Forgot password?</a>
					        </div>
					        
					    </div>
					    <!-- Sign in button -->
					    <button id="login-btn" class="btn btn-dark btn-block my-4" type="submit">Login</button>
					    
					
					    
					    
					
					    <!-- Register -->
					    <p>회원이 아니십니까?
					        <a href="${path }/enrollMember.do" id="enrollMember">회원가입</a>
					    </p>
					
					    <!-- Social login -->
					    <div id="naverIdLogin"></div><br/>
					    <%-- <div id="kakaoLogin"><img src="${path }/resources/images/kakao.png" style="width:100%;height:100%;"></div> --%>
					    <a id="kakao-login-btn"></a>
					    <br/>
					
					</form>
		        </div>
			</div>
		</div>
	</div>
	</c:if>
<%-- <c:if test="${kakaoLogin==null }"> --%>
<script>
    // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('dc4be6609b0d77bafef6497d03397d47');
    Kakao.isInitialized();
	
    // SDK 초기화 여부를 판단합니다.
    console.log(Kakao.isInitialized(),Kakao.isInitialized());
    
    Kakao.Auth.createLoginButton({
    	container: '#kakao-login-btn',
    	success: function(response){
    		Kakao.API.request({
    			url:'/v2/user/me',
    			success:function(response){
    				var id=response.id;
    				var email=response.kakao_account.email;
    				var name=response.properties.nickname;
    				var birthday=response.kakao_account.birthday;
    				var age=response.kakao_account.age_range;
    				
    				console.log("id : "+id);
    				console.log("email : "+email);
    				console.log("name : "+name);
    				console.log("birthday : "+birthday);
    				console.log("age : "+age);
    				
    				window.location.replace("http://localhost:9090/couplism/member/kakaoLoginEnd?email="+email+"&name="+name+"&birthday="+birthday+"&age="+age);
    			},
    			fail:function(error){
    				console.log("request fail",error);
    			}
    		});
    	},
    	fail:function(error){
    		console.log("fail",error);
    	}
    });
</script>
<%-- </c:if> --%>
	<div id="locationModal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false" style="overflow:hidden;">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<i id="location-close" class="fas fa-times" aria-hidden="true"></i>
					<label id="location-modal-title">지역 선택</label>
					<label class="location-label">찾아보고자 하시는 지역을 선택해주세요</label><br/>
					<label id="location-first-demo"></label><label id="location-space" style="display:none;">&nbsp;&nbsp;</label><label id="location-second-demo"></label>
					<br/>
					<table id="location-select-table">
						<tr class="location-tr tr-one">
						</tr>
						<tr class="location-tr tr-two">							
						</tr>
						<tr class="location-tr tr-three">
						</tr>
						<tr class="location-tr tr-four">
						</tr>
						<tr class="location-tr tr-five">
						</tr>
						<tr class="location-tr tr-six">
						</tr>
						<tr class="location-tr tr-seven">
						</tr>
						<tr class="location-tr tr-eight">
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "oSbOyaRHkoBb4q1c1aSI",
			callbackUrl: "http://localhost:9090/couplism/member/naverLogin",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 50} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
</script>



<script>
	function lism(){
		location.replace('${path}/moveLism');
	}
	function travel(){
		location.replace('${path}/moveLocation');
	}
	function logout(){
		if(Kakao.Auth.getAccessToken()){
			console.log('카카오 인증 액세스 토큰이 존재합니다.',Kakao.Auth.getAccessToken());
			Kakao.Auth.logout(() => {
				console.log('로그아웃 되었습니다',Kakao.Auth.getAccessToken());
				this.setState({
					isLogin:false
				})
			});
		}
		location.replace('${path}/member/memberLogout');
	}
	function logoutNaver(){
		var popup = window.open("https://nid.naver.com/nidlogin.logout", "네이버팝업", "width=700px,height=800px");
		
		location.replace('${path}/member/memberLogout');
	}
	function logoutKakao(){
		Kakao.Auth.logout(function() {
			console.log(Kakao.Auth.getAccessToken());
		});
		Kakao.API.request({
		  url: '/v1/user/unlink',
		  success: function(response) {
		    console.log(response);
		  },
		  fail: function(error) {
		    console.log(error);
		  },
		});
		location.replace("${path}/member/memberLogout");
	}
	function login(){
		console.log("작동");
		var id=$("#id-input").val();
		var pw=$("#pw-input").val();
		location.replace('/member/memberLogin?id-input='+id+',pw-input='+pw);
	}
</script>


<script>
	let nav=0;
	//1=여행지, 2=커뮤니티
	//3=기념일

	/* $("#anniversary").click(function(){
		$("#nav-main").css("transition","0.5s");
		$("#nav-sub").css("transition","1s");
		$("#nav-main").css("left","-600px");
		$("#nav-sub").css("left","-400px");
		$(".nav-anniversary").css("display","inline");
		nav=3;
	}); */
	$("#community").click(function(){
		$("#nav-main").css("transition","0.5s");
		$("#nav-sub").css("transition","1s");
		$("#nav-main").css("left","-600px");
		$("#nav-sub").css("left","-400px");
		$(".nav-community").css("display","inline");
		nav=2;
	});
	$(".nav-back").click(function(){
		$("#nav-main").css("transition","1s");
		$("#nav-sub").css("transition","0.7s");
		$("#nav-main").css("left","0px");
		$("#nav-sub").css("left","600px");
		if(nav==1){//여행지
			$(".nav-travel").css("display","none");
			nav=0;
			return;
			
		}else if(nav==2){//커뮤니티
			$(".nav-community").css("display","none");
			nav=0;
			return;
		}else if(nav==3){//기념일
			$(".nav-anniversary").css("display","none");
			nav=0;
			return;
		}
	});
	$("#login").hover(function(){
		$("#login-font").text("로그인");
		$("#login-font").css("font-family","Montserrat");
		$("#login-font").css("left","25px");
	},function(){
		$("#login-font").text("LOGIN");
		$("#login-font").css("font-family","Roboto");
		$("#login-font").css("left","25px");
	});
	$("#logout").hover(function(){
		$("#logout-font").text("로그아웃");
		$("#logout-font").css("font-family","Montserrat");
		$("#logout-font").css("left","25px");
	},function(){
		$("#logout-font").text("LOGOUT");
		$("#logout-font").css("font-family","Roboto");
		$("#logout-font").css("left","25px");
	});
	$("#login-close").click(function(){
		$("#loginModal").modal("hide");
	});
	$("#location-close").click(function(){
		$("#locationModal").modal("hide");
		$('td').remove('.location-select-font');
		$("#location-space").css("display","none");
		$("#location-second-demo").text("");
	});
	
	$("#id-input").focus(function(){
		$("#id-input").css("border-bottom","1px blue solid");
		$("#id-placeholder").css("color","blue");
		$("#id-placeholder").css("top","197px");
		$("#id-placeholder").css("font-size","12px");
	});
	$("#id-input").blur(function(){
		var id=$("#id-input").val();
		if(id==""){
			$("#id-input").css("border-bottom","1px black solid");
			$("#id-placeholder").css("color","gray");
			$("#id-placeholder").css("top","232px");
			$("#id-placeholder").css("font-size","20px");
		}
	});
	$("#pw-input").focus(function(){
		$("#pw-input").css("border-bottom","1px blue solid");
		$("#pw-placeholder").css("color","blue");
		$("#pw-placeholder").css("top","287px");
		$("#pw-placeholder").css("font-size","12px");
	});
	$("#pw-input").blur(function(){
		var pw=$("#pw-input").val();
		if(pw==""){
		$("#pw-input").css("border-bottom","1px black solid");
		$("#pw-placeholder").css("color","gray");
		$("#pw-placeholder").css("top","314px");
		$("#pw-placeholder").css("font-size","20px");
		}
	});
	
</script>