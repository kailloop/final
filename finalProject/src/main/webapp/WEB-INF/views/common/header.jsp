<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Taste.it - Free Bootstrap 4 Template by Colorlib</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- 폰트어썸 -->
	<script src="https://kit.fontawesome.com/d41f04266a.js" crossorigin="anonymous"></script>
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<!-- Material 폰트 -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${path }/resources/css/style.css">
<style>
	#login-title{
	text-align:center;
	font-size:64px;
	font-family:Dancing Script;
	color:black;
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
		top:240px;
		
	}
	#id-input{
		z-index:1;
		transition:all ease 0.5s;
		border:none;
		border-bottom:1px black solid;
	}
	

</style>
</head>
<style>
	.modal-content{
		/* background-color:purple; */
		background-image:url(/couplism/resources/images/login-logo.jpg);
		
	}
	.modal-body{
		border:none;
		border-radius:20px;
		text-align:center;
		overflow:hidden;
		height:650px;
	}
	.login-title{
	text-align:center;
	font-size:82px;
	font-family:Dancing Script;
	color:black;
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
		top:272px;
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
		top:354px;
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
	.enroll-btn{
		width:70px;
		height:50px;
		margin:0;
		margin-left:auto;
		margin-right:auto;
	}
</style>

<body>
	<div class="wrap">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-12 col-md d-flex align-items-center">
					<p class="mb-0 phone"><span class="mailus">Phone no:</span> <a href="#">+00 1234 567</a> or <span class="mailus">email us:</span> <a href="#">emailsample@email.com</a></p>
				</div>
				<div class="col-12 col-md d-flex justify-content-md-end">
					<p class="mb-0">Mon - Fri / 9:00-21:00, Sat - Sun / 10:00-20:00</p>
					<div class="social-media">
						<p class="mb-0 d-flex">
							<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook" aria-hidden="true"><i class="sr-only">Facebook</i></span></a>
							<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-twitter" aria-hidden="true"><i class="sr-only">Twitter</i></span></a>
							<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram" aria-hidden="true"><i class="sr-only">Instagram</i></span></a>
							<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-dribbble" aria-hidden="true"><i class="sr-only">Dribbble</i></span></a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Coupli<span>sm</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="" class="nav-link">About</a></li>
					<li class="nav-item"><a href="chef.html" class="nav-link">Location</a></li>
					<li class="nav-item"><a href="menu.html" class="nav-link">Notice</a></li>
					<li class="nav-item"><a href="${path }/gallery/galleryList.do" class="nav-link">Gallery</a></li>
					<li class="nav-item"><a href="blog.html" class="nav-link">Anniversary</a></li>
					<li class="nav-item"><a href="#" class="nav-link" data-toggle="modal" data-target="#loginModal">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	
	<!-- 로그인 Modal -->
	<div class="modal" id="loginModal" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
		        <div class="modal-body">
		          <!-- Default form login -->
	<form class="text-center p-5" action="#!">
	
		<i id="login-close" class="fas fa-times" aria-hidden="true"></i>
	
    <label class="login-title">Couplism</label>
    
    <br><br>
    <!-- ID -->
    <!-- Material input -->
	<!-- Medium input -->
	<div class="md-form">
	  <label id="id-placeholder" for="id-input">Please Enter your ID</label>
	  <input id="id-input" type="text" class="">
	</div>
	<br>
    <!-- Password -->
    <label id="pw-placeholder" for="pw-input">Please Enter your Password</label>
    <input id="pw-input" type="password" class="mb-6">
    <br>
    <div class="d-flex justify-content-around">
        <div>
            <!-- Forgot password -->
            <a href="">Forgot id?</a>&nbsp;&nbsp;&nbsp;
            <a href="">Forgot password?</a>
        </div>
        
    </div>

    <!-- Sign in button -->
    <button class="btn btn-dark btn-block my-4" type="submit">Login</button>

    <!-- Register -->
    <p>회원이 아니십니까?
        <a href="#" id="enrollMember" data-toggle="modal" data-target="#enrollModal">회원가입</a>
    </p>

    <!-- Social login -->
    <a href="#" class="mx-2" role="button"><button>1</button></a>
    <a href="#" class="mx-2" role="button"><button>2</button></a>
    <a href="#" class="mx-2" role="button"><button>3</button></a>
    <a href="#" class="mx-2" role="button"><button>4</button></a>

</form>
		        </div>        
			</div>
		</div>
	</div>

	<div class="modal" id="enrollModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body" style="text-align:center;">
					<br/>
					<form action="{path}/member/memberEnroll.do" method="post">
							<label class="login-title">Couplism Join</label>
					
						<div id="first-enroll">
							<label style="text-align:right; font-size:30px;"><i class="fas fa-user"></i></label>&nbsp;&nbsp;&nbsp; <input type="text" class="enroll-input"/ id="enroll-id" name="id"></br>
							<label style="text-align:right; font-size:30px;"><i class="fas fa-lock"></i></label>&nbsp;&nbsp;&nbsp; <input type="password" class="enroll-input" id="enroll-pw" name="password"/>
						</br></br></br>
						</div>
						<div id="second-enroll">							
							<label style="text-align:right; font-size:30px;"><i class="fas fa-user-circle"></i></label>&nbsp;&nbsp;&nbsp; <input type="text" class="enroll-input"/ name="nickname"></br>
							<label style="text-align:right; font-size:30px;"><i class="fas fa-heartbeat"></i></label>&nbsp;&nbsp;&nbsp; <input type="text" class="enroll-input" name="couple"/>
						</br></br></br>
						</div>
						<div id="third-enroll">
							<label id="icon-email" style="text-align:right; font-size:30px;"><i class="fas fa-envelope"></i></label>&nbsp;&nbsp;&nbsp; <input type="text" class="enroll-input"/ name="email">&nbsp;&nbsp;&nbsp;<br/>
							<label id="icon-phone" style="text-align:right; font-size:30px;"><i class="fas fa-phone-square-alt"></i></label>&nbsp;&nbsp;&nbsp; <input type="text" class="enroll-input" name="phone"/><br/>
							<label id="email-check" style="text-align:right; font-size:30px;"><i class="fas fa-envelope-open-text"></i></label>&nbsp;&nbsp;&nbsp; <input type="text" class="enroll-input" id="email-check"/>
						</div>
					
					</form>
				</div>
				<div class="modal-footer" style="text-align:center;">
					<button style="font-size:13px;" class="btn btn-outline-secondary enroll-btn" onclick="backLogin();" data-toggle="modal" data-target="#loginModal">Back</button>
					<button style="font-size:13px;" id="enroll-before" type="button" class="btn btn-outline-primary enroll-btn">이전</button>
					<button style="font-size:13px;" id="enroll-next" type="button" class="btn btn-outline-primary enroll-btn">다음</button>
				</div>
			</div>
		</div>
	</div>
<style>
	#icon-phone{
		margin-left:10px;
	}
	#icon-email{
		margin-left:20px;
	}
	#email-check{
		margin-left:2px;
	}
	#first-enroll{
		margin:0 auto;
		padding:0;
		width:100%;
		height:auto;
		transition:1s;
	}
	#second-enroll{
		top:222px;
		left:470px;
		position:absolute;
		margin:0 auto;
		padding: 0;
		width:100%;
		height:auto;
		transition:1s;
	}
	#third-enroll{
		top:222px;
		left:470px;
		position:absolute;
		margin:0 auto;
		padding: 0;
		width:100%;
		height:auto;
		transition:1s;
	}
</style>


<script>
	let secondLeft="left";
	let secondRight="right";
	let now=0;
	$("#enroll-next").click(function(){
		if(now==0){//첫번쨰에서 두번쨰로 갈때
			$("#first-enroll").css("opacity","0");
			$("#second-enroll").css("opacity","1");
			$("#second-enroll").css("top","221px");
			$("#second-enroll").css("left","0px");
			now=1;
			return;
		}
		if(now==1){//두번쨰에서 세번쨰로 갈때
			//두번쨰
			$("#second-enroll").css("opacity","0");
			$("#second-enroll").css("top","221px");
			$("#second-enroll").css("left","-470px");
			//세번쨰
			$("#third-enroll").css("opacity","1");
			$("#third-enroll").css("top","221px");
			$("#third-enroll").css("left","0px");
			now=2;
			return;
		}
	});
	$("#enroll-before").click(function(){
		if(now==1){//두번쨰에서 첫번쨰로 이동할때
			$("#second-enroll").css("opacity","0");
			$("#second-enroll").css("top","221px");
			$("#second-enroll").css("left","470px");
			$("#first-enroll").css("opacity","1");
			$("#first-enroll").css("top","221px");
			$("#first-enroll").css("left","0px");
			now=0;
			return;
		}
		if(now==2){//세번쨰에서 두번째로 이동할때
			$("#third-enroll").css("opacity","0");
			$("#third-enroll").css("top","221px");
			$("#third-enroll").css("left","470px");
			$("#second-enroll").css("opacity","1");
			$("#second-enroll").css("top","221px");
			$("#second-enroll").css("left","0px");
			now=1;
			return;
		}
	});
	function backLogin(){
		$("#enrollModal").modal("hide");
		$(".modal-body").css("height","650px");
	};
	$("#enrollMember").click(function(){
		$("#loginModal").modal("hide");
		$(".modal-body").css("height","450px");
	});
	
	$("#login-close").click(function(){
		$("#loginModal").modal("hide");
	});
	
	$("#id-input").focus(function(){
		$("#id-input").css("border-bottom","1px blue solid");
		$("#id-placeholder").css("color","blue");
		$("#id-placeholder").css("top","242px");
		$("#id-placeholder").css("font-size","12px");
	});
	$("#id-input").blur(function(){
		var id=$("#id-input").val();
		if(id==""){
			$("#id-input").css("border-bottom","1px black solid");
			$("#id-placeholder").css("color","gray");
			$("#id-placeholder").css("top","272px");
			$("#id-placeholder").css("font-size","20px");
		}
	});
	$("#pw-input").focus(function(){
		$("#pw-input").css("border-bottom","1px blue solid");
		$("#pw-placeholder").css("color","blue");
		$("#pw-placeholder").css("top","322px");
		$("#pw-placeholder").css("font-size","12px");
	});
	$("#pw-input").blur(function(){
		var pw=$("#pw-input").val();
		if(pw==""){
		$("#pw-input").css("border-bottom","1px black solid");
		$("#pw-placeholder").css("color","gray");
		$("#pw-placeholder").css("top","354px");
		$("#pw-placeholder").css("font-size","20px");
		}
	});
	$(".enroll-input").focus(function(e){
		$(e.target).css("border-bottom","1px #66ff33 solid");
	});
	$(".enroll-input").blur(function(e){
		$(e.target).css("border-bottom","1px black solid");
	});
	
</script>