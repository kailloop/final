<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<style>
#logo {
	height: 900px;
	width: 100%;
	position: relative;
	z-index: 0;
	overflow: hidden;
}

#logo img {
	filter: grayscale(65%);
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	width: 100%;
	height: 100%;
	z-index: -1;
}

#logo label {
	position: absolute;
	left: 27%;
	top: 35%;
	font-size: 120px;
	z-index: 0;
	cursor: pointer;
	font-family: Dancing Script;
	color: black;
}
</style>
<div id="logo">
	<img src="${path }/resources/images/notice.jpg" alt="notice" /> <label>Notice</label>
</div>
<section id="content">
	<div class="container">
		<form action="${path }/notice/modifyNoticeEnd" method="post"
			enctype="multipart/form-data">
			<input type="text" name="noticeTitle" placeholder="제목"
				style="width: 100%;" value="${notice.noticeTitle}">
			<div id="fileListDiv">
				<c:forEach var="file" items="${noticeFile}">
					<div id="fileDiv">
						<c:out value="${file.originalName }" />
						<input name="fileRenameName" type="hidden" value="${file.renameName }">
						<button type="button" onclick="deleteFile(event);">삭제</button>
					</div>
				</c:forEach>
			</div>
			<div id="div-container-file">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroupFileAddon01">파일</span>
					</div>
					<div class="custom-file">
						<input name="noticeFile" type="file" class="custom-file-input"
							id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
						<label class="custom-file-label" for="inputGroupFile01">여기를
							클릭하여 파일을 선택하세요.</label>
					</div>
					<button id="addInputFile" style="width: 80px;" type="button">+</button>
				</div>
			</div>
			<textarea name="noticeContent" rows="30" class="form-control"
				style="resize: none;"><c:out
					value="${notice.noticeContent }" /></textarea>
			<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
			<input type="hidden" name="userId" value="${notice.userId}">
			<button class="float-right" type="submit">작성</button>
			<button class="float-left" onclick="checknotice();" type="button">체크</button>
		</form>
	</div>
</section>
<script>
	function deleteFile(event){
		console.log(event.target);
		console.log($(event.target).parent());
		$(event.target).parent().remove();
	}
	function checknotice(){
		console.log("체크들어옴");
		console.log("${notice.noticeTitle}");
	}
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
				$("#div-container-file").append("<div class='input-group mb-3'><div class='input-group-prepend'><span class='input-group-text' id='inputGroupFileAddon01'>파일</span></div><div class='custom-file'><input name='noticeFile' onchange='changeFile(event);' type='file' class='custom-file-input' id='inputGroupFile01' aria-describedby='inputGroupFileAddon01'><label class='custom-file-label' for='inputGroupFile01'>여기를 클릭하여 파일을 선택하세요.</label></div><button onclick='deleteInputFile(event);' type='button' style='width:80px;''>삭제</button></div>");
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
<jsp:include page="/WEB-INF/views/common/footer.jsp" />