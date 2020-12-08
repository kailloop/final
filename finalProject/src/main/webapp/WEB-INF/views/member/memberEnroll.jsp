<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
	#type-select{
		width:1400px;
		height:140px;
		position:relative;
		z-index:1;
		margin:0;
		margin-left:auto;
		margin-right:auto;
		padding:0;
		color:lightgray;
		font-family:Nanum Gothic Coding;
		font-weight:bolder;
		font-size:64px;
	}
	#type-select table{
		margin-left:auto;
		margin-right:auto;
	}
	.enrollUser{
		position:relative;
		margin-left:auto;
		margin-right:auto;
		cursor:pointer;
		color:#F26A8D;
		width:200px;
		max-width:200px;
	}
	.enrollPartner{
		position:relative;
		margin-left:auto;
		margin-right:auto;
		cursor:pointer;
		width:200px;
		max-width:200px;
	}
	td > label{
		cursor:pointer;
	}
	#enroll-select{
		position:relative;
		top:0px;
		left:21%;
		border-bottom:3px pink solid;
		width:24.5%;
		transition:1s;
	}
	#enrollContainer{
		position:relative;
		width:100%;
		height:1200px;
		top:50px;
		border-radius:100px;
	}
	section{
		height:2100px;
		background-color:#F8F8F8;
	}
	body{
		background-color:#F8F8F8;
	}
	#user{
		position:relative;
		width:100%;
		height:100%;
		top:0px;
		left:0px;
	}
	.enroll-title{
		background:linear-gradient(to right, #DD2D4A, #F49CBB);
		-webkit-background-clip: text;
  		-webkit-text-fill-color: transparent;
		font-size:102px;
		font-weight:bolder;
		font-family: 'Montserrat', sans-serif;
	}
	#user table{
		position:relative;
		width:185px;
		height:auto;
		margin-right:auto;
		margin-left:auto;
	}
	.enroll-title-param{
		width:20%;
		font-family:Nanum Gothic Coding;
		font-size: 16px;
		text-align:left;
		background:linear-gradient(to right, #DD2D4A, #F49CBB);
		-webkit-background-clip: text;
  		-webkit-text-fill-color: transparent;
  		font-weight:bold;
	}
	.enroll-title-value{
		margin:0;
		padding:0;
		outline:none;
		width:400px;
	}
	.enroll-input{
		border:1px lightgray solid;
		width:400px;
		border-radius:5px;
		height:50px;
		background:white;
		transition:1s;
	}
	.enroll-birthday{
		display:inline-block;
		position:relative;
		height:50px;
		border:1px lightgray solid;
		width:130px;
		background:white;
		transition:1s;
		outline:none;
	}
	#check-id{
		position:relative;
		left:165px;
		top:-37px;
		font-size:24px;
		opacity:0;
		color:black;
		transition:0.5s;
	}
	#check-pw{
		position:relative;
		left:165px;
		top:-37px;
		font-size:24px;
		opacity:0;
		color:black;
		transition:0.5s;
	}
</style>
<script>
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                //document.getElementById("sample6_extraAddress").value = extraAddr;
	            } else {
	                //document.getElementById("sample6_extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("sample6_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();
	}
</script>
		<div id="type-select">
			<table style="width:60%;">
				<tr style="text-align:center; cursor:pointer;">
					<td class="enrollUser" style="width:47.5%;">
						<label style="font-size:100%;">일반 회원</label>
					</td>
					<td style="width:5%;">
						<label>ㅣ</label>
					</td>
					<td class="enrollPartner" style="width:47.5%;">
						<label style="font-size:100%;">제휴 회원</label>
					</td>
				</tr>
			</table>
			<div id="enroll-select"></div>
		</div>
		<div id="enrollContainer" style="text-align:center">
			<div id="user">
				<label class="enroll-title">COUPLISM</label>
				<form name="memberEnrollFrm" action="${path }/member/memberEnrollEnd" method="post">
				<table>
					<!-- 아이디 -->
					<tr>
						<td class="enroll-title-param"><label for="id">아이디</label></td>
					<tr>
						<td class="enroll-title-value"><input class="enroll-input" type="text" id="id" name="id" maxlength="30" autocomplete="off"><i id="check-id" class="fas fa-check"></i></td>
					</tr>
					<!-- 비밀번호 -->
					<tr>
						<td class="enroll-title-param"><label for="password">비밀번호</label></td>
					</tr>
					<tr>
						<td class="enroll-title-value"><input class="enroll-input" type="password" id="password" name="password" autocomplete="off"></td>
					</tr>
					<!-- 비밀번호 확인 -->
					<tr>
						<td class="enroll-title-param"><label for="pwck">비밀번호 확인</label></td>
					</tr>
					<tr>
						<td class="enroll-title-value">
							<input class="enroll-input" type="password" id="pwck" name="pwck">
							<i id="check-pw" class="fas fa-check"></i>
						</td>
					</tr>
					<!-- 닉네임 -->
					<tr>
						<td class="enroll-title-param"><label for="nickname">닉네임</label></td>
					</tr>
					<tr>
						<td class="enroll-title-value"><input class="enroll-input" type="text" id="nickname" name="nickname" autocomplete="off"></td>
					</tr>
					<!-- 성별 -->
					<tr>
						<td class="enroll-title-param">
							<label for="gender">성별</label>
						</td>
					</tr>
					<tr>
						<td class="enroll-title-value">
							<select id="gender" name="gender" class="enroll-input" style="text-align:center;">
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
						</td>
					</tr>
					<!-- 핸드폰 번호 -->
					<tr>
						<td class="enroll-title-param"><label for="phone">핸드폰 번호</label></td>
					</tr>
					<tr>
						<td class="enroll-title-value">
							<input class="enroll-input" type="text" id="phone" name="phone" placeholder="010-1111-2222" autocomplete="off">
						</td>
					</tr>
					<!-- 생년월일 -->
					<tr>
						<td class="enroll-title-param"><label for="year">생년월일</label></td>
					</tr>
					<tr>
						<td class="enroll-title-value">
							<input class="enroll-birthday" type="text" id="year" placeholder="년(4자)" pattern="[0-9]{4}" title="1920~2015 안으로 입력해주세요" maxlength="4" name="year">
							<select class="enroll-birthday" id="month" name="month" form="userForm">
								<option value="월">월</option>
							    <option value="01">1</option>
							    <option value="02">2</option>
							    <option value="03">3</option>
							    <option value="04">4</option>
							    <option value="05">5</option>
							    <option value="06">6</option>
							    <option value="07">7</option>
							    <option value="08">8</option>
							    <option value="09">9</option>
							    <option value="10">10</option>
							    <option value="11">11</option>
							    <option value="12">12</option>
							</select>
							<input class="enroll-birthday" name="day" id="day" type="text" pattern="[0-9]{2}" maxlength="2" placeholder="일" required>
							<input type="hidden" name="birthday" id="birthday">
							<br/>
							<br/>
						</td>
					</tr>
					<!-- 주거지 및 커플아이디 숨김 -->
					<tr>
						<td class="enroll-title-param"><label for="sample6_address">주소</label>
					</tr>
					<tr>
						<td class="enroll-title-value">
							<input type="text" class="enroll-input" id="sample6_address" style="margin-top:5px;" placeholder="주소">
							<input type="text" class="enroll-input" id="sample6_detailAddress" style="margin-top:5px;" placeholder="상세주소">
							<input type="button" style="transition:0.2s; position:relative; padding:0; margin:0;  left:270px;top:-110px;width:120px; border:none; height:50px; background-color:#F26A8D;color:white; margin-top:5px; border-radius:5px; outline:none;"
							 onclick="sample6_execDaumPostcode()" style="margin-top:5px;" value="우편번호 찾기">
							 <input type="hidden" class="enroll-input" id="location" name="location">
							 <input type="hidden" id="couple" name="couple" value="">
							<br/>
							<br/>
						</td>
					</tr>
					<!-- 이메일 -->
					<tr>
						<td class="enroll-title-param"><label for="email">이메일</label></td>
					</tr>
					<tr>
						<td class="enroll-title-value">
							<input class="enroll-input" style="" type="text" id="email" name="email" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td class="enroll-title-value">
							<input class="enroll-input" style="width:286px;" type="text" id="emailcheck" name="emailcheck" autocomplete="off" >
							<input id="check-email" type="button" style="transition:0.2s; position:relative; padding:0; margin:0; margin-top:5px; top:-2px;width:110px; border:none; height:50px; background-color:#F26A8D;color:white; border-radius:5px; outline:none;"
							 value="인증번호 받기">
							 <input type="hidden" id="emailNum" name="emailNum">
							 <br/>
							 <br/>
						</td>
					</tr>
					<tr>
						<td class="enroll-title-value">
							<input id="enroll-join" type="button" style="transition:0.2s; position:relative; padding:0; margin:0; top:-2px;width:100%; border:none; height:50px; background-color:#F26A8D;color:white; border-radius:5px; outline:none;"
							 value="가입하기"> 
						</td>
					</tr>
				</table>
				</form>
				</div>
			</div>
		</div>
		
		
	
	</section>
	<script>
	var id="";
	var pw="";
	var tel = /^\d{3}-\d{3,4}-\d{4}$/;
	var birth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	var password = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	var email=0;
	$(function(){
		$("#pwck").keyup(function(){
			if($("#pwck").val()==""){
				$("#check-pw").css("color","black");
				$("#check-pw").css("opacity","0");
				return;
			}
			if($("#pwck").val()==$("#password").val()){
				$("#check-pw").css("color","#41FF3A");
				$("#check-pw").css("opacity","1");
				return;
			}
			if($("#pwck").val()!=$("#password").val()){
				$("#check-pw").css("color","red");
				$("#check-pw").css("opacity","1");
				return;
			}
		});
		$("#id").keyup(function(){
			if($("#id").val()==""){
				$("#check-id").css("color","black");
				$("#check-id").css("opacity","0");
			}else{
				$.ajax({
					url:"${path }/member/duplicateId",
					data:{"id":$("#id").val()},
					dataType:"html",
					success:data=>{
						if(data=="exist"){
							$("#check-id").css("color","red");
							$("#check-id").css("opacity","1");
						}else{
							$("#check-id").css("color","#41FF3A");
							$("#check-id").css("opacity","1");
						}
						
					}
				});	
			}
		});
		$("#check-email").click(function(){
			if(email==0){//인증번호 발송
				alert("해당 이메일에 인증번호를 발송하였습니다. 인증번호를 입력하고 인증번호 확인 버튼을 눌러주세요.");
				$.ajax({
					url:"${path }/member/checkEmail",
					data:{"email":$("#email").val()},
					dataType:"html",
					success:data=>{
						$("#emailNum").val(data);
						console.log(data);
						$("#check-email").val("인증번호 확인");
						email=1;
					}
				});
			}else if(email==1){//인증번호 확인
				if($("#emailcheck").val()==$("#emailNum").val()){//인증번호가 맞앗을때
					email=2;
					alert("이메일 인증이 확인되었습니다.")
				}else{
					email=1;
					alert("이메일 인증 실패. 인증번호를 다시 확인해주세요.");
				}
			}
		});
		$("#enroll-join").click(function(){//가입하기 버튼
			if(email==2){
				var address="";
				var birthday="";
				var offset;				
				address+=$("#sample6_address").val();//주소 셋팅
				address+=" ";
				address+=$("#sample6_detailAddress").val();
				$("#location").val(address);
				console.log($("#address").val());
				birthday+=$("#year").val();
				birthday+=$("#month").val();
				birthday+=$("#day").val();
				$("#birthday").val(birthday);
				if($("input[id='id']").val()==""){
					alert("아이디를 적어주세요");
					offset = $("input[id='id']").offset();
					$('html, body').animate({scrollTop: offset.top},1000);
					return;
				}
				if($("#pwck").val()!=$("#password").val()){
					alert("비밀번호 확인에 다른 비밀번호가 들어가있습니다. 확인하여 다시 적어주세요.");
					$("#pwck").val("");
					$("#password").val("");
					return;
				}
				if(!password.test($("input[id='password']").val())){
					alert("특수문자 / 문자 / 숫자 포함 형태의 8~15자리 비밀번호를 입력해주세요");
					offset = $("input[id='password']").offset();
					$('html, body').animate({scrollTop: offset.top},1000);
					return;
				}
				if($("#nickname").val()==""){
					alert("닉네임을 적어주세요");
					offset = $("#nickname").offset();
					$('html, body').animate({scrollTop: offset.top},1000);
					return;
				}
				if(!birth.test($("input[id='birthday']").val())){
					alert("생년월일을 정확히 기입해주세요.");
					offset = $("input[id='birthday']").offset();
					$('html, body').animate({scrollTop: offset.top},1000);
					return;
				}
				if(!tel.test($("input[id='phone']").val())) {            
		            //경고
		            alert("핸드폰 번호를 -포함하여 알맞게 적어주세요.");
		            offset = $("input[id='phone']").offset();
					$('html, body').animate({scrollTop: offset.top},1000);
		            return;
				}
				
				$("form[name=memberEnrollFrm]").submit();
			}else{
				alert("이메일 인증을 해주시기 바랍니다.");
				offset = $("input[id='email']").offset();
				$('html, body').animate({scrollTop: offset.top},1000);
				return;
			}
		});
		$(".enroll-title-value > input[type=button]").hover(function(e){
			$(e.target).css("border","1px #F26A8D solid");
			$(e.target).css("background-color","white");
			$(e.target).css("color","#F26A8D");
		},function(e){
			$(e.target).css("border","none");
			$(e.target).css("background-color","#F26A8D");
			$(e.target).css("color","white");
		});
		$(".enroll-title-value > input").click(function(e){
			$(e.target).css("border","1px #F26A8D solid");
		});
		$(".enroll-title-value > input").blur(function(e){
			$(e.target).css("border","1px lightgray solid");
		});
		$(".enrollPartner").click(function(){
			$(".enrollPartner").css("color","#F26A8D");
			$(".enrollUser").css("color","lightgray");
			$("#enroll-select").css("left","55%");
		});
		$(".enrollUser").click(function(){
			$(".enrollPartner").css("color","lightgray");
			$(".enrollUser").css("color","#F26A8D");
			$("#enroll-select").css("left","21%");
		});	
	});
	</script>
	<footer>
		
	</footer>
	
	
</body>
</html>