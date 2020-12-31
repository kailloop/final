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
			height:1000px;
			overflow:hidden;
		}
		#first-card{
			position:relative;
			width:600px;
			height:400px;
			border:2px lightgray solid;
			box-shadow:1px 3px 3px lightgray;
			left:460px;
			top:300px;
			text-align:center;
			z-index:0;
			transition:1s;
		}
		#first-line{
			position:relative;
			width:600px;
			height:1px;
			top:100px;
			left:1060px;
			transition:1s;
			border:2px #F29661 solid;
			z-index:-1;
		}
		.update-title{
			position:relative;
			font-size:42px;
			left:0px;
			font-family:Dancing Script;
			color:black;
		}
		#first-table{
			position:relative;
			font-size:24px;
			font-family: 'Hi Melody', cursive;
			color:black;
			top:-10px;
			width:90%;
			height:45%;
			z-index:1;
		}
		.table-title{
			width:20%;
			height:20px;
		}
		.table-input{
			width:70%;
			height:20px;
		}
		.update-input{
			width:100%;
			height:100%;
			border:2px black solid;
			transition:0.2s;
			outline:none;
		}
		.status{
			position:relative;
			width:30%;
			height:80%;
			top:10%;
			outline:none;
			border:2px #47C83E solid;
			color:#47C83E;
			background-color:white;
			transition:0.2s;
			cursor:pointer;
			user-select:none;
		}
		#back{
			position:relative;
			width:100px;
			height:40px;
			top:70px;
			left:-180px;
		}
		#next{
			position:relative;
			width:100px;
			height:40px;
			top:70px;
			left:180px;
		}
		#second-card{
			position:relative;
			width:800px;
			height:600px;
			top:-200px;
			left:1800px;
			transition:1s;
			border:2px lightgray solid;
			box-shadow:3px 3px 5px lightgray;
			text-align:center;
			z-index:0;
		}
		#second-table{
			position:relative;
			width:100%;
			min-height:10px;
			height:auto;
			z-index:1;
		}
		#second-table > tr {
			height:30px;
		}
		.contents{
			width:28%;
		}
		.active{
			width:9%;
		}
		.active-minus{
			width:9%;
			color:red;
			font-size:24px;
		}
		.active-minus > i{
			cursor:pointer;
		}
		#complete{
			position:relative;
			cursor:pointer;
			left:320px;
			top:200px;
		}
	</style>
	<form action="${path }/lism/updateEnd" method="post">
	<input type="hidden" name="lismNo" value="${lism.lismNo }">
	<div id="first-card">
		<label class="update-title">Lism</label>
		<table id="first-table">
			<tr>
				<td class="table-title">Title</td>
				<td class="table-input"><input class="update-input" type="text" id="lismTitle" name="lismTitle" value="${lism.lismTitle }"></td>
			</tr>
			<tr>
				<td class="table-title">Date</td>
				<td class="table-input"><input class="update-input" type="date" id="setDate" name="setDate" value="${lism.setDate }"></td>
			</tr>
			<tr>
				<td class="table-title">Open</td>
				<td class="table-input">
					<button id="y" class="status" type="button">공개</button>
					<button id="n" class="status" type="button">비공개</button>
					<input type="hidden" id="openStatus" name="openStatus" value="${lism.openStatus }">
				</td>
			</tr>
		</table>
		<button id="back" type="button" class="btn btn-outline-danger">뒤로가기</button>
		<button id="next" type="button" class="btn btn-outline-primary">다음</button>
	</div>
	<div id="first-line"></div>
	<div id="second-card">
		<label class="update-title">Lism Pickers</label>
		<table id="second-table" class="table table-hover">
			<thead>
				<tr>
					<th class="contents">장소명</th>
					<th class="contents">주소</th>
					<th class="active">예약시간</th>					
					<th class="active">삭제</th>
				</tr>
			</thead>
			<tbody id="second-table-body">
			</tbody>
		</table>
		<button id="complete" type='submit' class="btn btn-outline-primary">수정완료</button>
	</div>
	</form>
	<script>
		var count=${count};
		$(function(){
			console.log(${lism.lismNo});
			console.log(count);
			$.ajax({
				url:"${path}/lism/detailList",
				data:{"lismNo":${lism.lismNo}},
				datatType:"html",
				success:data=>{
					console.log(data);
					var list=JSON.parse(data);
					var num=0;
					for(var i=0;i<count;i++){
						console.log(i);
						
						$.ajax({
							url:"${path}/lism/getLocationOne",
							data:{"no":list[i].locationNo},
							dataType:"html",
							success:data=>{
								var loc=JSON.parse(data);
								console.log(loc);
								$("#second-table-body").append("<tr id='picker"+num+"'><td class='contents'>"+list[num].name+"</td><td class='contents'>"+loc.locationAddress+"</td><td class='active'>"+list[num].setTime+"</td><td class='active-minus'><i class='far fa-minus-square' ></i><input type='hidden' id='location'"+num+" value='"+list[num].locationNo+"'><input type='hidden' id='lism"+num+"' value='"+list[num].lismNo+"'></td></tr>");
								num++;
								
							}
						});
						
					}
				}
			});
		});
		$(document).on('click','.fa-minus-square',function(e){
			var lismNo=$(e.target).next().next('input').val();
			$.ajax({
				url:"${path}/lism/deletePickerOne",
				data:{"lismNo":$(e.target).next().next('input').val(),
					"locationNo":$(e.target).next('input').val()},
				dataType:"html",
				success:data=>{
					
				}
			});
			$(e.target).parent().parent('tr').remove();
		});
		
		$("#next").click(function(){
			$("#first-card").css("left","-700px");
			$("#first-line").css("left","-100px");
			$("#first-line").css("width","460px");
			$("#second-card").css("left","360px");
		});
		$("#back").click(function(){
			location.replace('${path}/lism/detail?lismNo='+${lism.lismNo});
		});
		$("#y").click(function(){
			var val=$("#openStatus").val();
			if(val=='Y'){
				alert("이미 공개하셨습니다");
				return;
			}
			$("#y").css("background-color","#47C83E");
			$("#y").css("color","white");
			$("#y").css("border","none");
			$("#n").css("background-color","white");
			$("#n").css("color","#47C83E");
			$("#n").css("border","2px #47C83E solid");
			$("#openStatus").val('Y');
		});
		$("#n").click(function(){
			var val=$("#openStatus").val();
			if(val=='N'){
				alert("이미 비공개하셨습니다");
				return;
			}
			$("#n").css("background-color","#47C83E");
			$("#n").css("color","white");
			$("#n").css("border","none");
			$("#y").css("background-color","white");
			$("#y").css("color","#47C83E");
			$("#y").css("border","2px #47C83E solid");
			$("#openStatus").val('N');
		});
		$(function(){
			var val=$("#openStatus").val();
			console.log(val);
			if(val=='Y'){
				$("#y").css("background-color","#47C83E");
				$("#y").css("color","white");
				$("#y").css("border","none");
			}
			if(val=='N'){
				$("#n").css("background-color","#47C83E");
				$("#n").css("color","white");
				$("#n").css("border","none");
			}
		});
		$(".update-input").focus(function(e){
			$(e.target).css("border","2px #F26A8D solid");
		});
		$(".update-input").blur(function(e){
			$(e.target).css("border","2px black solid");
		});
	</script>
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>