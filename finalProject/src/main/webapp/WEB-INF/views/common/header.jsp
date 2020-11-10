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
	#clickLogin{
		position:relative;
		margin:0;
		padding:0;
		font-size:20px;
		cursor:pointer;
		width:25px;
		height:25px;
		top:-10px;
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
		overflow:hidden;
		cursor:pointer;
	}
	#login-font{	
		position:relative;
		font-size:20px;
		width:20px;
		height:20px;
		margin:0;
		padding:0;
		color:#F0F0F0;
		top:-10px;
		cursor:pointer;
	}
</style>

<body>
	<div class="wrap">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-12 col-md d-flex align-items-center">
					<p class="mb-0 phone"><span class="mailus">Phone no:</span> <a href="#">010-8902-0975</a> or <span class="mailus">email us:</span> <a href="#">kailloop@daum.net</a></p>
				</div>
				<div id="login" data-toggle="modal" data-target="#loginModal">
					<i id="clickLogin" class="fas fa-sign-in-alt"></i><label for="login" id="login-font">&nbsp;LOGIN</label>
				</div>
				
				<div id="mypage" class="circle">
					<p id="myPage" class="mb-0"><i class="fas fa-address-card" onclick="moveMyPage();"></i></p>
				</div>
				
			</div>
		</div>
	</div>
	
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Coupli<span>sm</span></a>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="" class="nav-link">About</a></li>
					<li class="nav-item"><a href="chef.html" class="nav-link">Location</a></li>
					<li class="nav-item"><a href="${path }/lism/lism.do" class="nav-link">lism</a></li>
					<li class="nav-item"><a href="${path }/gallery/galleryList.do" class="nav-link">Gallery</a></li>
					<li class="nav-item"><a href="blog.html" class="nav-link">Anniversary</a></li>
					<li class="nav-item"><a href="${path}/notice/noticeList" class="nav-link">Notice</a></li>
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
					        <a href="#" id="enrollMember">회원가입</a>
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

	


<script>
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
	
</script>