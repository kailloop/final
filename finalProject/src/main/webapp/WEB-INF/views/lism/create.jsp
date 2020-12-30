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
		height:1300px;
		text-align:center;
	}
	#page-title{
		position:relative;
		margin-right:auto;
		margin-left:auto;
		font-family: 'Dancing Script', cursive;
		font-size:102px;
		color:black;
	}
	#lism-title{
		position:relative;
		margin-left:auto;
		margin-right:auto;
		top:-10px;
		width:50%;
		height:60px;
		border:none;
		border:none;
		text-align:center;
	}
	#lism-title-date{
		position:relative;
		margin-left:auto;
		margin-right:auto;
		top:-10px;
		width:50%;
		height:60px;
		border:none;
		border:none;
		text-align:center;
	}
	.lism-input{
		position:relative;
		outline:none;
		width:100%;
		height:100%;
		border:none;
		border-bottom:3px gray solid;
		transition:0.5s;
		font-size:36px;
		background-color:transparent;
		font-family: 'Hi Melody', cursive;
	}
	.lism-name{
		position:relative;
		font-family: 'Hi Melody', cursive;
		font-size:42px;
		left:25%;
		top:30px;
		height:50px;
		color:black;
		transition:0.7s;
	}
	#focus-one{
		position:relative;
		width:40%;
		height:500px;
		border:1px lightgray solid;
		box-shadow:3px 3px 5px lightgray;
		overflow:hidden;
		z-index:1;
		transition:0.5s;
		user-select:none;
	}
	#focus-two{
		position:relative;
		width:40%;
		height:500px;
		left:60%;
		border:1px lightgray solid;
		box-shadow:3px 3px 5px lightgray;
		top:-500px;
		z-index:1;
		transition:0.5s;
		user-select:none;
	}
	
	#handle-container{
		position:relative;
		width:1000%;
		top:-6.5%;
		height:300px;
		left:23.5%;
		z-index:-1;
		border-radius:20px;
		/* overflow:hidden; */
	}
	.handle{
		position:relative;
		float:left;
		width:350px;
		height:100%;
		cursor:pointer;
		display:none;
		border-radius:20px;
	}
	.pickerImg{
		position:relative;
		width:100%;
		height:100%;
		cursor:pointer;
		border-radius:20px;
	}
	.slideFont{
		font-size:62px;
		color:black;
		cursor:pointer;
	}
	#angle-left{
		position:relative;
		top:180px;
	}
	#angle-right{
		position:relative;
		left:86%;
		top:180px;
		z-index:1;
	}
	
	#reservation-date{
		position:relative;
		width:20%;
	}
	#focus-three{
		position:relative;
		top:-790px;
		color:black;
		z-index:0;
		width:68px;
		height:68px;
		margin-left:auto;
		margin-right:auto;
		transition:0.5s;
		cursor:pointer;
	}
	#plus{
		position:relative;
		cursor:pointer;
		top:-36px;
	}
	#focus-one-back{
		width:100%;
		height:100%;
		position:absolute;
		left:-1.5%;
		top:0%;
		transform:scale(1.2);
		z-index:-1;
	}
	#picker-table{
		width:100%;
		height:100%;
		z-index:3;
	}
	.focus-title{
		position:relative;
		font-size:42px;
		color:black;
		font-family: 'Hi Melody', cursive;
		text-align:center;
		height:10px;
	}
	.focus-content{
		height:5px;
		font-size:24px;
		position:relative;
		color:black;
		font-family: 'Hi Melody', cursive;
		border-bottom:1px gray dotted;
	}
	.location-content{
		width:40%;
		font-family: 'Hi Melody', cursive;
		font-size:24px;
	}
	.focus-select{
		width:10%;
		font-size:42px;
		z-index:1;
	}
	.focus-select-minus{
		width:10%;
		font-size:42px;
		z-index:1;
		color:red;
	}
	.minus{
		z-index:3;
		color:red;
	}
	#btns{
		position:relative;
		top:-400px;
		width:400px;
		height:auto;
		margin-left:auto;
		margin-right:auto;
	}
	#createLism{
		width:120px;
		height:80px;
		font-size:32px;
		font-family: 'Hi Melody', cursive;
		color:#F26A8D;
		border:1px #F26A8D solid;
		background-color:white;
	}
	#backLism{
		float:right;
		width:120px;
		height:80px;
		font-size:32px;
		font-family: 'Hi Melody', cursive;
		color:#050099;
		border:1px #050099 solid;
		background-color:white;
	}
</style>
	<label id="page-title">Couplism</label>
	<form name="lismCreate" action="${path }/lism/createEnd" method="post" style="text-align:left;">
		<label class="lism-name">제목</label>
		<br/>
		<div id="lism-title">
			<input class="lism-input" maxlength="30" name="title" id="title" type="text" autocomplete="off">
		</div>
		<br/>
		<div id="lism-title-date" style="text-align:center;">
			<input class="lism-input" id="lism-date" name="lismDate"type="date" style="width:27.5%;" onchange="selectDate();">
		</div>
		<br/>
			<div id="focus-one" class="focus">
			<img id="focus-one-back" src="${path }/resources/lism/focus-one.jpg" alt="배경">
				<div id="focus-table">
					<table id="picker-table">
						<tr class="focus-title">
							<td colspan="3">Time Picker</td>
						</tr>
						<tr class="focus-content">
							<td id="location-name" class="location-content"><label>+버튼을 눌러주세요</label>
								<input type="hidden" id="tdName" name="locationNo">
								<input type="hidden" id="tdNo" name="locationNo">
							</td>
							<td id="location-time" class="location-content"><label>예약 시간</label>
								<input type="hidden" id="tdTime" name="reservationNo">
							</td>
							<td class="focus-select"><div class="plus" style="color:black;position:relative;margin-left:auto;margin-right:auto;cursor:pointer;"><i class="far fa-plus-square"></i></div></td>
							<!-- <td class="focus-select"><div class="minus" style="color:black;position:relative;margin-left:auto;margin-right:auto;cursor:pointer;"><i class="far fa-minus-square"></i></div></td> -->
						</tr>
					</table>
					<input type="hidden" id="lism-table" name="lismTable">
					<input type="hidden" id="creator" name="creator">
					
				</div>
			</div>
		<div id="focus-two" class="focus">
				<label id="angle-left" class="slideFont">〈</label>
				<label id="angle-right" class="slideFont">〉</label>
			<div id="handle-container">
				
			</div>
			
		</div>
		<div id="focus-three" style="text-align:center;font-size:72px;">
			<i id="plus"class="far fa-plus-square"></i>
		</div>
		<div id="btns">
			<input id="createLism" type="button" value="만들기">
			<input id="backLism" type="button" value="뒤로가기" onclick="location.replace('${path}/moveLism')">
		</div>
	</form>
	<script>
		$("#createLism").click(function(){
			var title=$("#title").val();
			var date=$("#lism-date").val();
			var creator=$("#id").val();
			$("#creator").val(creator);
			if(title==""){
				alert("Lism의 제목을 적어주세요");
				return;
			}
			if(date==""){
				alert("Lism의 해당 날짜를 정해주세요");
				return;
			}
			if(creator==""){
				alert("로그인 해주세요");
				return;
			}
			$("form[name=lismCreate]").submit();
		});
		$("#createLism").hover(function(){
			$("#createLism").css("color","white");
			$("#createLism").css("background-color","#F26A8D");
		},function(){
			$("#createLism").css("color","#F26A8D");
			$("#createLism").css("background-color","white");
		});
		$("#backLism").hover(function(){
			$("#backLism").css("color","white");
			$("#backLism").css("background-color","#050099");
		},function(){
			$("#backLism").css("color","#050099");
			$("#backLism").css("background-color","white");
		});
		
		var tdNo;
		$(document).on('click','.minus',function(e){
			remove(e);
		});
		function remove(e){
			console.log($(e.target).parent('.minus').children('input').val());
			tdNo=$(e.target).parent('.minus').children('input').val();
			$(e.target).parent().parent().parent().remove('tr');
			$("input").remove("#contentName"+(tdNo));
			$("input").remove("#contentTime"+(tdNo));
			$("input").remove("#contentNo"+(tdNo));
		}
		$(".focus-select-minus").click(function(){
			console.log("확인");
			
		});
		$("#minust").click(function(){
			console.log("확인");
		});
		var check=0;
		var table=0;
		$('.plus').click(function(){
			var name=$("#tdName").val();
			var time=$("#tdTime").val();
			var no=$("#tdNo").val();
			if(check==1){
				$("#picker-table").append("<tr class='focus-content'><td class='location-content'>"+name+"</td><td class='location-content'>"+time+"</td><td class='focus-select-minus'><div class='minus' style='color:red;position:relative;margin-left:auto;margin-right:auto;cursor:pointer;'><input type='hidden' class='picker-td' value='"+table+"'><i class='far fa-minus-square'></i></div></td></tr>");
				$("#picker-table").append("<input type='hidden' id='contentName"+table+"' name='contentName"+table+"'value='"+name+"'>");
				$("#picker-table").append("<input type='hidden' id='contentTime"+table+"' name='contentTime"+table+"'value='"+time+"'>");
				$("#picker-table").append("<input type='hidden' id='contentNo"+table+"' name='contentNo"+table+"'value='"+no+"'>");
				$("#lism-table").val(table);
				table++;
			}else{
				alert("여행지를 선택해주세요");
			}
		})
		$(".plus").hover(function(){
			$(".plus").css("transition","0.3s");
			$(".plus").css("color","lime");
		},function(){
			$(".plus").css("color","black");
		});
		$(function(){
			$("#angle-left").css("cursor","default");
		});
		var movement=0;
		var limit=0;
		var zero=0;
		$("#angle-left").click(function(e){
			if(movement<=zero){
				$("#angle-left").css("cursor","default");
				return;
			}else{
				$("#angle-right").css("cursor","pointer");
				$("#picker"+movement).parent().css("display","none");
				movement--;
				$("#picker"+movement).parent().css("display","inline-block");
				if(movement<=zero){
					$("#angle-left").css("cursor","default");
				}
			}
		});
		$("#angle-right").click(function(e){
			if(movement<limit){
				$("#angle-left").css("cursor","pointer");
				$("#picker"+movement).parent().css("display","none");
				movement++;
				$("#picker"+movement).parent().css("display","inline-block");
				console.log(limit);
				if(movement>=limit){
					$("#angle-right").css("cursor","default");
				}
			}else{
				alert("더 이상 예약하신 장소가 없습니다.");
				console.log(limit);
				$("#angle-right").css("cursor","default");
				return;
			}
		});
		$("#focus-three").click(function(e){
			console.log(movement);
			var name=$("#pickerName"+movement).val();
			var no=$("#pickerNo"+movement).val();
			var time=$("#reserTime"+movement).val();
			$("#location-name").children('label').text("장소 이름 : "+name)
			$("#location-time").children('label').text("예약시간 : "+time);
			$("#tdNo").val(no);
			$("#tdName").val(name);
			$("#tdTime").val(time);
			check=1;
		});
		$("#focus-three").hover(function(e){
			$("#focus-three").css("color","#F26A8D");
		},function(e){
			$("#focus-three").css("color","black");
		});
	</script>
	<script>
		function selectDate(){
			console.log()
			$.ajax({
				url:"${path}/lism/selectDate",
				data:{"lismDate":$("#lism-date").val(),
						"id":$("#id").val()},
				dataType:"html",
				success:data=>{
					var parseData = JSON.parse(data);
					console.log(parseData);
					limit=parseData.length-1;
					$.ajax({
						url:"${path}/lism/getReservationNo",
						data:{"lismDate":$("#lism-date").val(),
							"id":$("#id").val()},
						dataType:"html",
						success:data=>{
							$("input").remove('.reser');
							var reser = JSON.parse(data);
							console.log(reser);
							for(var r=0;r<reser.length;r++){
								console.log(reser[r]);
								console.log(reser[r].no);
								
								$("#handle-container").append("<input class='reser' type='hidden' id='reserNo"+r+"' value='"+reser[r].no+"'>");
								$("#handle-container").append("<input class='reser' type='hidden' id='reserTime"+r+"' value='"+reser[r].time+"'>");
							}
							/* $("#handle-container").append("<input type='hidden' id='reservationNo"+i+"' name='reservationNo"+i+"' value=''"); */
						}
					});
					for(var i=0;i<parseData.length;i++){
						var locationNo=parseData[i].locationNo;
						var locationName=parseData[i].locationName;
						console.log(locationName);
						var count=0;
						console.log("확인"+i);
						var img;
						$("div").remove(".handle");
						
						$.ajax({
							url:"${path}/lism/getLocationMain",
							data:{"parseData":locationNo},
							dataType:"html",
							success:data=>{
								img=data;
								var a="";
								var b="<input type='hidden' id='pickerName"+i+"' value='"+locationName+"'>";
								console.log(img);
								$("#handle-container").append("<div class='handle'><img id=picker"+count+" class='pickerImg' src='${path}/resources/upload/locationMain/"+img+"' alt='메인'><input type='hidden' id='pickerNo"+count+"' value='"+locationNo+"'><input type='hidden' id='pickerName"+count+"' value='"+locationName+"'></div>");
								
								count++;
								$("#picker0").parent().css("display","inline-block");
							}
						});
						
						
						console.log(parseData[i]);
					}
					
				}
			});
		}
		$(".pickerImg").click(function(e){
			console.log("보통");
		})
		$(".lism-input").focus(function(e){
			$(e.target).css("border-bottom","3px #F26A8D solid");
		});
		$(".lism-input").blur(function(e){
			$(e.target).css("border-bottom","3px gray solid");
		});
		
		
		$("#lism-title").children('input').focus(function(e){
			$(".lism-name").css("top","20px");
			$(".lism-name").css("font-size","16px");
			$(".lism-name").css("color","#F26A8D");
		});
		$("#lism-title").children('input').blur(function(e){
			var title=$("#title").val();
			$(e.target).css("border-bottom","3px #F26A8D solid");
			if(title==""){
				$(".lism-name").css("top","30px");
				$(".lism-name").css("font-size","42px");
				$(".lism-name").css("color","black");
				$(e.target).css("border-bottom","3px black solid");
				return;
			}
		});
	</script>
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>