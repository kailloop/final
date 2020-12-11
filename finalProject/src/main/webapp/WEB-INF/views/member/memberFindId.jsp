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
	#back-one{
		position:relative;
		border:1px red solid;
		top:-850px;
		width:100%;
		height:200px;
		background-color:white;
	}
	#back-two{
		position:relative;
		width:100%;
		height:800px;
		top:-800px;
		background:white
	}
	#background-img{
		width:100%;
		height:100%;
	}
	section{
		height:800px;
		overflow:hidden;
		
	}
	#first-div{
		margin:0;
		margin-left:auto;
		margin-right:auto;
		width:80%;
		height:100%;
	}
	#first-q{
		position:relative;
		width:60%;
		height:50%;
		border:1px lightgray solid;
		border-radius:30px;
		box-shadow:3px 5px 5px gray;
		top:35%;
		left:20%;
		transition:1s;
		background-color:white;
	}
	#second-q{
		position:relative;
		width:60%;
		height:50%;
		border:1px lightgray solid;
		border-radius:30px;
		box-shadow:3px 5px 5px gray;
		top:-15%;
		left:120%;
		transition:1s;
	}
	#first-q > img{
		width:50%;
		height:100%;
		border-radius:30px;
	}
	#second-q > img{
		width:50%;
		height:100%;
		border-radius:30px;
	}
	#first-q-label-one{
		color:black;
		position:relative;
		top:-40%;
		left:10%;
		font-size:32px;
		font-family:Nanum Gothic Coding;
	}
	#second-q-label-one{
		color:black;
		font-size:32px;
		font-family:Nanum Gothic Coding;
	}
	#first-q-div{
		position:relative;
		width:50%;
		height:100%;
		left:50%;
		top:-100%;
		border-radius:30px;
	}
	#second-q-div{
		position:relative;
		width:50%;
		height:100%;
		left:50%;
		top:-100%;
		border-radius:30px;
		text-align:center;
	}
	#first-q-div > table{
		width:100%;
		height:auto;
	}
	#second-q-div > table{
		width:100%;
		height:auto;
	}
	.q-title{
		color:#F26A8D;
		font-size:16px;
		font-family:Nanum Gothic Coding;
		font-weight:bolder;
		height:16px;
	}
	.q-value{
		height:50px;
		width:90%;
		border:none;
		outline:none;
		border:1px lightgray solid;
		transition:1s;
	}
	.email-btn{
		height:50px;
		width:44%;
		outline:none;
		border:none;
		background-color:#F26A8D;
		transition:0.5s;
		color:white;
	}
</style>
	<div id="first-div">
		<div id="first-q">
			<img src="${path }/resources/images/forgot-ID.jpg">
			<label id="first-q-label-one">Find Your ID</label>
			<div id="first-q-div">
			<form name="findIdFrm" action="${path }/member/findId" method="post">
				<table>
					<tr>
						<td><br/><br/><label class="q-title">핸드폰 번호</label></td>
					</tr>
					<tr>
						<td><input type="text" id="phone" name="phone" class="q-value" autocomplete="off" placeholder="000-0000-0000"></td>
					</tr>
					<tr>
						<td><label class="q-title">이메일</label></td>
					</tr>
					<tr>
						<td><input type="text" id="email" name="email" class="q-value" autocomplete="off" placeholder="hong@example.com"></td>
					</tr>
					<tr>
						<td>
						<input type="text" id="email-check" name="email-check" class="q-value" style="width:45%;" autocomplete="off" placeholder="">
						<input id="id-email-btn" class="email-btn" type="button" value="인증번호 받기">
						<input type="hidden" id="emailNum" name="emailNum">
						</td>
					</tr>
					<tr>
						<td><button id="find-btn" style="width:90%;" class="email-btn" type="button">다음</button></td>
					</tr>
				</table>
			</form>
			</div>
		</div>
		<div id="second-q">
			<img src="${path }/resources/images/complete.jpg">
			<div id="second-q-div">
			<br/><br/>
				<table>
					<tr>
						<td><label id="second-q-label-one">Searched My ID</label></td>
					</tr>
					<tr>
						<td><label id="success-name" class="q-title"></label><label class="q-title">님의 아이디는</label></td>
					</tr>
					<tr>
						<td><label id="success-id" class="q-title"></label><label class="q-title">입니다.</label></td>
					</tr>
					<tr>
						<td><button type="button" class="email-btn">로그인</button><button type="button" class="email-btn">비밀번호 찾기</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div id="back-one">
	</div>
	</section>
	<div id="back-two">
		<img id="background-img" src="${path }/resources/images/back-idpw.jpg">
	</div>
	
<script>
	var idEmail=0;
	$(function(){
		$("#find-btn").click(function(){
			var tel = /^\d{3}-\d{3,4}-\d{4}$/;
			if(!tel.test($("input[id='phone']").val())) {            
	            alert("핸드폰 번호를 -포함하여 알맞게 적어주세요.");
	            offset = $("input[id='phone']").offset();
				$('html, body').animate({scrollTop: offset.top},1000);
	            return;
			}
			if(idEmail<2){
				alert("이메일 인증을 해주세요.");
				return;
			}else{
				var phone=$("#phone").val();
				var email=$("#email").val();
				var allData={"phone":phone,"email":email};
				$.ajax({
					url:"${path }/member/findMemberId",
					data:allData,
					dataType:"html",
					success:data=>{
						console.log("${member.id}");
						if(data!=null){
							$("#first-q").css("left","-80%");
							$("#second-q").css("left","20%");
							$("#success-name").text("${member.nickname}");
							$("#success-id").text("${member.id}");
						}else{
							console.log("해당하는 아이디가없습니다.");
							idEmail=0;
							$("#email").val("");
							$("#phone").val("");
						}
						
					}
				});
				
				return;
			}
		});
		
		$(".q-value").focus(function(e){
			$(e.target).css("border","1px #F26A8D solid");
		});
		$(".q-value").blur(function(e){
			$(e.target).css("border","1px lightgray solid");
		});
		$(".email-btn").hover(function(e){
			$(e.target).css("border","1px #F26A8D solid");
			$(e.target).css("background-color","white");
			$(e.target).css("color","#F26A8D");
		},function(e){
			$(e.target).css("background-color","#F26A8D");
			$(e.target).css("border","none");
			$(e.target).css("color","white");
		});
		$("#id-email-btn").click(function(e){
			if(idEmail==0){//인증번호 발송
				alert("해당 이메일에 인증번호를 발송하였습니다. 인증번호를 입력하고 인증번호 확인 버튼을 눌러주세요.");
				$.ajax({
					url:"${path }/member/checkEmail",
					data:{"email":$("#email").val()},
					dataType:"html",
					success:data=>{
						$("#emailNum").val(data);
						console.log(data);
						$("#id-email-btn").val("인증번호 확인");
						idEmail=1;
					}
				});
			}else if(idEmail==1){//인증번호 확인
				if($("#email-check").val()==$("#emailNum").val()){//인증번호가 맞앗을때
					idEmail=2;
					alert("이메일 인증이 확인되었습니다.")
				}else{
					idEmail=1;
					console.log($("#email-check").val());
					console.log($("#emailNum").val());
					alert("이메일 인증 실패. 인증번호를 다시 확인해주세요.");
				}
			}	
		});
	});
</script>
	
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>