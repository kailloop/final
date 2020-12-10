<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="" name="title"/>
</jsp:include>
<style>
#content {
	position: relative;
	margin-top: 500px;
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
		<section id="content">
			<form action="${path }/location/createEnd" method="post" enctype="multipart/form-data">
				<input type="hidden" name="locationCreator" value="${logginedMember.id}">
				<table>
					<tbody>
						<tr><td>제목</td><td><input type="text" name="locationTitle"></td></tr>
						<tr><td>타입</td><td><input type="text" name="locationType"></td></tr>
						<tr><td>지역</td><td><input type="text" name="locationAddress"></td></tr>
						<tr><td>메인 이미지</td><td><input type="file" name="mainFile"></td></tr>
						<tr><td>세부 이미지</td><td>
								<div id="div-container-file">
									<div class="input-group mb-3">
									  <div class="input-group-prepend">
									    <span class="input-group-text" id="inputGroupFileAddon01">파일</span>
									  </div>
									  <div class="custom-file">
									    <input name="locationFile" onchange="changeFile(event);" type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
									    <label class="custom-file-label" for="inputGroupFile01">여기를 클릭하여 파일을 선택하세요.</label>
									  </div>
									  <button id="addInputFile" style="width:80px;" type="button">+</button>
									</div>
								</div></td></tr>
						<tr><td>전화번호</td><td><input type="text" name="locationPhone"></td></tr>
						<tr><td></td><td><div id="reservation-container">
		<div id="day-btns">
			<button type="button" class="day-btns">월요일</button>
			<button type="button" class="day-btns">화요일</button>
			<button type="button" class="day-btns">수요일</button>
			<button type="button" class="day-btns">목요일</button>
			<button type="button" class="day-btns">금요일</button>
			<button type="button" class="day-btns">토요일</button>
			<button type="button" class="day-btns">일요일</button>
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
	</div></td></tr>
	<tr><td>내용</td><td><textarea name="locationContent" class="form-control" style="resize: none;"rows="30"></textarea></td></tr>
<script>
	$(".day-btns").hover(function(e){
		$(e.target).css("background","linear-gradient(to right, #DD2D4A, #F49CBB)");
		$(e.target).css("color","white");
	},function(e){
		$(e.target).css("color","#F26A8D");
		$(e.target).css("background","white");
	});
</script></td></tr>
					</tbody>
				</table>
				<input type="hidden" name="locationDay" value="Mon-1">
				<input type="hidden" name="locationTime" value="09:00">
				<input type="hidden" name="locationPeople" value="30">
				<input type="hidden" name="locationDay" value="Mon-2">
				<input type="hidden" name="locationTime" value="10:00">
				<input type="hidden" name="locationPeople" value="30">
				<input type="hidden" name="locationDay" value="Mon-3">
				<input type="hidden" name="locationTime" value="11:00">
				<input type="hidden" name="locationPeople" value="30">
				<input type="hidden" name="locationDay" value="Mon-4">
				<input type="hidden" name="locationTime" value="13:00">
				<input type="hidden" name="locationPeople" value="30">
				<input type="hidden" name="locationDay" value="Mon-5">
				<input type="hidden" name="locationTime" value="14:00">
				<input type="hidden" name="locationPeople" value="30">
				<input type="hidden" name="locationDay" value="Mon-6">
				<input type="hidden" name="locationTime" value="15:00">
				<input type="hidden" name="locationPeople" value="30">
				<input type="hidden" name="locationDay" value="Mon-7">
				<input type="hidden" name="locationTime" value="16:00">
				<input type="hidden" name="locationPeople" value="30">
				<input type="hidden" name="locationDay" value="Mon-8">
				<input type="hidden" name="locationTime" value="17:00">
				<input type="hidden" name="locationPeople" value="30">
				<input type="hidden" name="locationDay" value="Mon-9">
				<input type="hidden" name="locationTime" value="18:00">
				<input type="hidden" name="locationPeople" value="30">
				<input type="submit">
			</form>
		</section>
			<script>
		var filecount = 1;
		$(function(){
			$('[name=noticeFile]').change(e => {
				var file = $(e.target)[0].files[0];
				if(file!=null){
					$(e.target).next(".custom-file-label").html(file.name);
				}else{
					console.log(file);
					$(e.target).next(".custom-file-label").html("여기를 클릭하여 파일을 선택하세요.");
				}
			})
		});
		$(function(){
			$('#addInputFile').click(e => {
				if(filecount < 5){
					$("#div-container-file").append("<div class='input-group mb-3'><div class='input-group-prepend'><span class='input-group-text' id='inputGroupFileAddon01'>파일</span></div><div class='custom-file'><input name='locationFile' onchange='changeFile(event);' type='file' class='custom-file-input' id='inputGroupFile01' aria-describedby='inputGroupFileAddon01'><label class='custom-file-label' for='inputGroupFile01'>여기를 클릭하여 파일을 선택하세요.</label></div><button onclick='deleteInputFile(event);' type='button' style='width:80px;''>삭제</button></div>");
					filecount++;
				}
			})
		});
		function deleteInputFile(event){
			$(event.target).parent().remove();
			filecount--;
		}
		function changeFile(event){
			var file = $(event.target)[0].files[0];
			if(file!=null){
				$(event.target).next(".custom-file-label").html(file.name);
			}else{
				console.log(file);
				$(event.target).next(".custom-file-label").html("여기를 클릭하여 파일을 선택하세요.");
			}
		}
	</script>
		<script>
		</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>