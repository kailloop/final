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
		#creator{
			position:relative;
			color:black;
			font-size:32px;
			font-family: 'Hi Melody', cursive;
			height:auto;
			width:auto;
			text-align:right;
		}
		#lismTitle{
			font-size:62px;
			color:black;
			font-family: 'Hi Melody', cursive;
		}
		#value{
			position:relative;
			width:100%;
			height:700px;
			font-size:32px;
			color:black;
			user-select:none;
		}
		#line{
			position:relative;
			width:100%;
			height:1px;
			margin-left:auto;
			margin-right:auto;
			border-bottom:5px gray solid;
			border-radius:20px;
			top:50%;
			transition:1s;
		}
		.picker{
			position:relative;
			margin-left:auto;
			margin-right:auto;
			top:100%;
			width:1px;
			height:50px;
			border:2px gray solid;
			display:inline-block;
			transition:1s;
		}
		.pickerImg{
			position:relative;
			top:-340px;
			margin:20px auto;
			margin-left:auto;
			margin-right:auto;
			width:300px;
			height:300px;
			left:-20px;
			display:inline-block;
			transition:1s;
			cursor:pointer;
		}
		.picker-time{
			position:relative;
			left:0px;
			top:0px;
		}
		.pick-img{
			position:relative;
			width:100%;
			height:100%;
			top:-80px;
			border-radius:20px;
			transition:0.3s;
		}
		.pick-img:hover{
			transform:scale(1.05);
		}
		#like{
			position:relative;
			top:700px;
			width:200px;
			height:100px;
			margin-left:auto;
			margin-right:auto;
			text-align:center;
		}
		#like-icon{
			font-size:64px;
			color:#F26A8D;
			transition:0.15s;
		}
		#like-btn{
			position:relative;
			margin-left:auto;
			margin-right:auto;
			width:70%;
			height:100%;
			transition:0.15s;
			background-color:white;
			border:3px #F26A8D solid;
			outline:none;
			
		}
		#manage-btns{
			position:relative;
			left:81%;
			top:-220px;
			width:200px;
			height:70px;
		}
		#delete{
			width:40%;
			height:50%;
			font-size:16px;
			margin-right:10px;
			border-radius:20px;
		}
		#update{
			width:40%;
			height:50%;
			font-size:16px;
			border-radius:20px;
		}
		#like-count{
			position:relative;
			left:45px;
			top:8px;
			z-index:3;
			color:#F26A8D;
		}
	</style>
	</br></br></br></br></br>
	<label id="lismTitle"  name="lismTitle">${lism.lismTitle }</label>
	<input type="hidden" id="lismNo" name="lismNo" value=${lism.lismNo }>
	<br/>
	<div id="creator">
		<label id="lismCreator">제작자 ${lism.creator }&nbsp;님&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;</label>
	</div>
	<div id="value">
		<div id="line">
			<div id="pick1" class="pickerImg">
				<div class="picker">
				</div>
			</div>
			<div id="pick2" class="pickerImg">
				<div class="picker">
				</div>
			</div>
			<div id="pick3" class="pickerImg">
				<div class="picker">
				</div>
			</div>
			<div id="pick4" class="pickerImg">
				<div class="picker">
				</div>
			</div>
		</div>
		<c:if test="${logginedMember!=null }">
			<div id="like"><label id="like-count">${lism.likeCount }</label><button id="like-btn" type="button"><i id="like-icon" class="far fa-hand-point-up"></i></button></div>
		</c:if>
		<c:if test="${logginedMember!=null }">
			<c:if test="${logginedMember.id eq lism.creator }">
				<div id="manage-btns">
					<button id="update" class="btn btn-outline-info" type="button" onclick="updateLism();">수정</button>
					<button id="delete" class="btn btn-outline-danger" type="button" onclick="deleteLism();">삭제</button>
				</div>
			</c:if>
		</c:if>
	</div>
	<script>
		function updateLism(){
			location.replace('${path}/lism/update?lismNo='+${lism.lismNo});
		}
		function deleteLism(){
			location.replace('${path}/lism/delete?lismNo='+${lism.lismNo});
		}
		function change(){
			$.ajax({
				url:"${path}/lism/selectLike",
				data:{"id":$("#id").val(),
					"lismNo":$("#lismNo").val()},
				dataType:"html",
				success:data=>{
					console.log("추천수 : "+data);
					$("#like-count").text(data);
				}
			});
		};
		$("#like-btn").click(function(e){
			$.ajax({
				url:"${path}/lism/Like",
				data:{"id":$("#id").val(),
					"lismNo":$("#lismNo").val()},
				dataType:"html",
				success:data=>{
					alert(data);
					change();
				}
			});
		});
		$("#like-btn").hover(function(){
			$("#like-btn").css("border","none");
			$("#like-btn").css("background-color","#F26A8D");
			$("#like-icon").css("color","white");
			$("#like-count").css("color","white");
		},function(){
			$("#like-btn").css("border","3px #F26A8D solid");
			$("#like-btn").css("background-color","white");
			$("#like-icon").css("color","#F26A8D");
			$("#like-count").css("color","#F26A8D");
		});
	</script>
<script>
	var count=${count};
	var click=0;
	$(document).on('click','.pick-img',function(e){
		console.log("확인");
		var click=$(e.target).next().next().val();
		var id="${lism.creator}";
		var date="${lism.setDate}";
		console.log(id);
		console.log(click);
		$.ajax({
			url:"${path}/lism/getReservationOne",
			data:{"id":id,
				"date":date,
				"time":click},
				dataType:"html",
				success:data=>{
					var reser=JSON.parse(data);
					console.log(reser.location_No);
					console.log("시간");
					console.log(reser.time);
					$("#lism-person").text(reser.people+"명");
					$("#lism-time").text(reser.time);
					$("#lism-price").text(reser.price+"원");
					$.ajax({
						url:"${path}/lism/getLocationOne",
						data:{"no":reser.location_No},
						dataType:"html",
						success:data=>{
							var loc=JSON.parse(data);
							console.log(loc);
							$("#lism-location-title").text(loc.locationTitle);
							$("#lism-phone").text(loc.locationPhone);
							$("#lism-address").text(loc.locationAddress);
							$("#lism-id").text(loc.locationCreator);
							$("#lism-location-content").children('div').remove();
							$("#lism-location-content").append("<div class='lism-contents'>"+loc.locationContent+"</div>");
						}
					});
					$.ajax({
						url:"${path}/lism/getLocationMain",
						data:{"parseData":reser.location_No},
						dataType:"html",
						success:data=>{
							$("#lism-img").children('img').remove();
							$("#lism-img").append("<img style='width:100%;height:100%;border-radius:15px;' src='${path}/resources/upload/locationMain/"+data+"'>");
						}
					});
				}
		});
		$("#lismModal").modal();
	});
	var num=0;
	$(function(){
		$.ajax({
			url:"${path}/lism/detailList",
			data:{"lismNo":$("#lismNo").val()},
			dataType:"html",
			success:data=>{
				console.log(data);
				var list = JSON.parse(data);
				console.log(list);
				console.log(count);
				if(count<4){
					for(var i=0;i<(4-count);i++){						
						$('#line > div').last().remove();
					}
				}
			if(count<=4){
				for(var i=0;i<count;i++){
					console.log(num);
					console.log(i);
					console.log(list[i].locationNo);
						$.ajax({
							url:"${path}/lism/getLocationMain",
							data:{"parseData":list[i].locationNo},
							dataType:"html",
							success:data=>{
								var time=list[num].setTime;
								var no=list[num].locationNo;
								console.log(data);
								
								$('#pick'+(num+1)).append("<img class='pick-img' src='${path}/resources/upload/locationMain/"+data+"' alt='메인'>");
								$('#pick'+(num+1)).append("<input type='hidden' class='locationNo' value='"+no+"'>");
								$("#pick"+(num+1)).append("<input type='hidden' claas='reserTime' value='"+time+"'>");
								$("#pick"+(num+1)).append("<label id='picker-time-1' class='picker-time'>"+time+"</label>");
								num++;
							}
						});
					}
				}//if문끝
			if(count>4){
				var four=4;
				for(var i=0;i<count;i++){
					console.log(num);
					console.log(i);
					console.log(list[i].locationNo);
						$.ajax({
							url:"${path}/lism/getLocationMain",
							data:{"parseData":list[i].locationNo},
							dataType:"html",
							success:data=>{
								var time=list[num].setTime;
								var no=list[num].locationNo;
								
								
								$('#pick'+(num+1)).append("<img class='pick-img' src='${path}/resources/upload/locationMain/"+data+"' alt='메인'>");
								$('#pick'+(num+1)).append("<input type='hidden' class='locationNo' value='"+no+"'>");
								$("#pick"+(num+1)).append("<input type='hidden' claas='reserTime' value='"+time+"'>");
								$("#pick"+(num+1)).append("<label id='picker-time-1' class='picker-time'>"+time+"</label>");
								num++;
							}
						});
					}
				}//if문끝
			}
		});
	});
</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>