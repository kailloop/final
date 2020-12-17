<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="EVENT" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>

<style>
	#eventUpdateDiv{
		margin-top: 90px;
		margin-left: auto;
		margin-right: auto;
	}
</style>

<div id="eventUpdateDiv">
		
		<!--글쓰기  스타일-->
		<style>
			#update{
				text-align: center;
			}
			table {
				width:800px;
				margin-left: auto;
				margin-right: auto;
				border-spacing: 15px;
  				border-collapse: separate;
			}
			td input {
				width: 500px;
				outline: none;
			}
			textarea {
				resize: none;
				width:500px;
				outline: none;
			}
		</style>
		<!--글쓰기  -->
			<form action="${path}/eventUpdateEnd?eventNo=${event.eventNo }/>" name="eventForm" method="post" enctype="multipart/form-data">
			<div id="update">
					<input type="text" name="eventWriter" value="${logginedMember.id}">
					<input type="text" name="eventNo" value="${event.eventNo}">
				<table border="1">
					<tr>
						<td style="width: 100px;">제목</td>
						<td><input type="text" name="eventTitle" value="${event.eventTitle}"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="eventContent">${event.eventContent }</textarea> </td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<input type="text" id="filetext" value="${event.eventOriginalFilename }" style="width:440px; border: none;" readonly>
							<input type="file" id="imgpreview" name="img" onchange="readURL(this);" style="width:405px;" />
							<button type="button" id="filebtn" class="btn btn-secondary" onclick="fileUpdateBtn();">수정</button>
							<img id="preview" src="${path }/resources/upload/event/${event.eventRenamedFilename}" alt="" width="500px;" height="300px;"/>
							<img id="updatepreview" src="${path }/resources/images/white.jpg" alt="" width="500px;" height="300px;"/>
							<p id="explanP">※파일선택을 안하시면 기존파일이 들어갑니다.</p>
					    </td>
					</tr>
				</table>
				
			</div>
			
			
			<!--버튼  스타일-->
			<style>
				#btn{
					margin-top:50px;
					text-align: center;
				}
				
			</style>
			<!--버튼  -->
			<div id="btn">
				<button type="submit" class="btn btn-warning" onclick="updateBtn();">수정</button>
				<button type="button" class="btn btn-outline-warning" onclick="cancelBtn();">취소</button>
			</div>
			
			
			</form>	
			
		</div><!-- eventUpdateDiv닫기 -->

</section>

<script>
	$(document).ready(function(){
		console.log("실행");
		$("#imgpreview").hide();
		$("#updatepreview").hide();
		$("#explanP").hide();
		var count=0;
		$("#filebtn").click(function(){
			if(count==0){
				$("#imgpreview").show();
				$("#filetext").hide();
				$("#preview").hide();
				$("#updatepreview").show();
				$("#explanP").show();
				$("#filebtn").html("수정취소");
				count++;
			}else {
				$("#imgpreview").hide();
				$("#filetext").show();
				$("#preview").show();
				$("#updatepreview").hide();
				$("#explanP").hide();
				$("#imgpreview").val("");
				$("#updatepreview").attr("src","${path }/resources/images/white.jpg" );
				$("#filebtn").html("수정");
				count=0;
			}
			
		});
	});
	function cancelBtn() {
	    if (confirm("변경하실 내용은 저장되지 않습니다. 정말 취소하시겠습니까??") == true){    //확인
	    	location.href="${path}/event/eventList.do";
	    }else{   //취소
	        return false;
	    }    
	}
	
	$("#imgpreview").change(function(e){
		let files=e.target.files;
		let filesArr=Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자가 이미지 형태가 아닙니다.");
				return;
			}
			
			let reader=new FileReader();
			reader.onload=function(e){
				$("#updatepreview").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
	})
	
	function updateBtn(){
		var title=$("[name=title]").val();
		if(title.trim().length==0){
			alert("제목을 입력해주세요");
			return false;
		}
	}

</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>