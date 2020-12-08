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
		height:2100px;
	}
	#reservation-container{
		position:relative;
		width:100%;
		height:1200px;
		border:1px red solid;
		top:0px;
	}
	#day-btns{
		position:relative;
		height:200px;
		width:100%;
	}
	.day-btns{
		position:relative;
		width:10%;
		height:80px;
		margin-left:3.52%;
		top:60px;
		cursor:pointer;
		outline:none;
		background:white;
		border:1px linear-gradient(to right,#DD2D4A,#F26A8D) solid;
		color:#F26A8D;
		transition:1s;
		border-style: solid;
		border-image: linear-gradient(to right, #DD2D4A 0%, #F49CBB 100%);
		border-image-slice: 1;
		font-family:Nanum Gothic Coding;
		font-size:24px;
		border-image-radius:30px;
	}
	#reservation-content{
		position:relative;
		width:90%;
		border:1px purple solid;
		height:900px;
	}
	#reservation-add{
		position:relative;
		width:100%;
		border:1px yellow solid;
		height:100px;
	}
	#reservation-addspec{
		position:relative;
		left:90%;
		width:10%;
		border:1px red solid;
		height:100px;
	}
	#reservation-table{
		position:relative;
		width:100%;
		height:auto;
	}
	#reservation-table > tr{
		border:1px blue solid;
		height:50px;
		font-size:20px;
	}
	#reservation-table > tr > td{
		color:black;
		
	}
</style>
	<br/><br/><br/><br/><br/>
	<div id="reservation-container">
		<div id="day-btns">
			<button class="day-btns">월요일</button>
			<button class="day-btns">화요일</button>
			<button class="day-btns">수요일</button>
			<button class="day-btns">목요일</button>
			<button class="day-btns">금요일</button>
			<button class="day-btns">토요일</button>
			<button class="day-btns">일요일</button>
		</div>
		<div id="reservation-add">
			<div id="reservation-addspec">
				
			</div>
		</div>
		<div id="reservation-content">
			<table id="reservation-table">
				<tr>
					<th>시간</th>
					<th>가격</th>
					<th>인원 수</th>
					<th>날짜</th>
				</tr>
				<tr>
					<td>10:00 ~ 12:00</td>
					<td>12000</td>
					<td>8 명</td>
					<td>2020.12.22</td>
				</tr>
			</table>
		</div>
	</div>
<script>
	$(".day-btns").hover(function(e){
		$(e.target).css("background","linear-gradient(to right, #DD2D4A, #F49CBB)");
		$(e.target).css("color","white");
	},function(e){
		$(e.target).css("color","#F26A8D");
		$(e.target).css("background","white");
	});
</script>


	
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>