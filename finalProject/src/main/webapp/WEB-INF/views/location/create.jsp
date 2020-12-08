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
						<tr><td>내용</td><td><textarea name="locationContent" class="form-control" style="resize: none;"rows="30"></textarea></td></tr>
					</tbody>
				</table>
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